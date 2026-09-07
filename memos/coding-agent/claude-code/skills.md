# Skills

skillsとは `/コマンド名` で呼び出せるワークフロー定義

## スキル一覧

配布元:
gstack = <https://github.com/garrytan/gstack>
ECC = <https://github.com/affaan-m/ECC>
uupm = <https://github.com/nextlevelbuilder/ui-ux-pro-max-skill>

### レビュー・品質

- `/code-review`（組み込み）
  — 現在の差分・PR・ブランチをレビューする。
    effort（low〜max, ultra）を指定でき、`--comment` でPRにインラインコメント、`--fix` で修正を適用
- `/security-review`（組み込み）
  — 現在のブランチの変更に対してセキュリティレビューを行う
- `/simplify`（組み込み）
  — 変更箇所の再利用・簡略化・効率化の観点で修正まで行う（バグ探しはしない）
- `/plan-eng-review`（gstack）
  — EM 目線でアーキテクチャ・障害モード・システム設計をレビューする

### テスト・デバッグ

## スキルを作成する

決定的な処理はスクリプトで行わせる

SKILL.md の description は Claude Code が読み、文脈に合えば `/スキル名` を明示しなくても自動で使われる

## Skillsを見つける

- <https://skillsmp.com/ja>
- <https://www.skills.sh/>
