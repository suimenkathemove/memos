#!/bin/bash
set -e

if [ -z "$LOCAL_DATABASE_URL" ]; then
  echo "エラー: LOCAL_DATABASE_URLが設定されていません"
  exit 1
fi

if [ -z "$STG_DATABASE_URL" ]; then
  echo "エラー: STG_DATABASE_URLが設定されていません"
  exit 1
fi

if [ -z "$TABLE_NAME" ]; then
  echo "エラー: TABLE_NAMEが設定されていません"
  exit 1
fi

EXPORT_FILE="export_${TABLE_NAME}.sql"

test_connections() {
  echo "データベース接続をテストしています..."

  echo "localへの接続テスト..."
  if docker run --rm postgres:16 psql "$LOCAL_DATABASE_URL" -c "SELECT 1;" >/dev/null 2>&1; then
    echo "o localへの接続テスト成功"
  else
    echo "x localへの接続テスト失敗"
    exit 1
  fi

  echo "stgへの接続テスト..."
  if docker run --rm postgres:16 psql "$STG_DATABASE_URL" -c "SELECT 1;" >/dev/null 2>&1; then
    echo "o stgへの接続テスト成功"
  else
    echo "x stgへの接続テスト失敗"
    exit 1
  fi

  echo "接続テスト完了"
}

export_from_local() {
  echo "localからデータをエクスポートしています..."

  docker run --rm \
    -v "$(pwd):/work" \
    -w /work \
    postgres:16 \
    pg_dump "$LOCAL_DATABASE_URL" \
    -t "$TABLE_NAME" \
    --data-only \
    --no-owner \
    --no-privileges \
    --no-tablespaces \
    --no-unlogged-table-data \
    --verbose \
    >"$EXPORT_FILE"

  if [ ! -s "$EXPORT_FILE" ]; then
    echo "エラー: データのエクスポートに失敗しました"
    exit 1
  fi

  echo "エクスポート完了"
}

delete_stg_existing_data() {
  echo "stgの既存データを削除しています..."

  docker run --rm \
    postgres:16 \
    psql "$STG_DATABASE_URL" \
    -c "DELETE FROM $TABLE_NAME;"

  echo "削除完了"
}

import_to_stg() {
  echo "stgへデータをインポートしています..."

  docker run --rm \
    -v "$(pwd):/work" \
    -w /work \
    postgres:16 \
    psql "$STG_DATABASE_URL" \
    -f "/work/$EXPORT_FILE"

  echo "インポート完了"
}

cleanup() {
  rm -f "$EXPORT_FILE"
}

main() {
  test_connections
  export_from_local
  delete_stg_existing_data
  import_to_stg
  cleanup
}
main
