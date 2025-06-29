# md-converter

Docker環境でmarkitdownを使用してファイルをMarkdownに変換するツールです。

## 使用方法

1. 変換したいファイルを `input` ディレクトリに配置
2. 変換スクリプトを実行

```bash
# ファイル名のみ指定（推奨）
./convert.sh document.pdf

# フルパス指定も可能
./convert.sh ./input/document.pdf
```

変換されたMarkdownファイルは `output` ディレクトリに保存されます。

## セットアップ

```bash
# Dockerイメージをビルド
docker compose build

# 必要なディレクトリを作成（スクリプトが自動作成）
mkdir -p input output
```

## ヘルプ

```bash
./convert.sh --help
```

## ファイル構成

```
md-converter/
├── Dockerfile              # Python環境とmarkitdown[all]をインストール
├── docker-compose.yml      # Docker設定
├── convert.sh              # 変換実行スクリプト
├── input/                  # 変換元ファイル配置
└── output/                 # 変換後のMarkdownファイル出力
```

## サポートファイル形式

markitdownがサポートする形式:
- PDF（poppler使用）
- Word文書 (.docx)
- PowerPoint (.pptx)
- Excel (.xlsx)
- 画像ファイル（OCR、tesseract使用）
- LibreOffice形式（.odt, .ods, .odp）
- その他多数

## 依存関係

Docker内に以下がインストールされます:
- Python 3.11
- markitdown[all]
- poppler-utils（PDF処理）
- tesseract-ocr（OCR処理）
- libreoffice（Office文書処理）