# md-converter

Docker環境でmarkitdownを使用してファイルをMarkdownに変換するツールです。

## 使用方法

1. 変換したいファイルを `input` ディレクトリに配置
2. 変換スクリプトを実行

```bash
./convert.sh <ファイル名>
```

例:
```bash
./convert.sh document.pdf
./convert.sh folder/document.docx
```

変換されたMarkdownファイルは `output` ディレクトリに保存されます。

## セットアップ

```bash
# Dockerイメージをビルド
docker-compose build

# 必要なディレクトリを作成
mkdir -p input output
```

## サポートファイル形式

markitdownがサポートする形式:
- PDF
- Word文書 (.docx)
- PowerPoint (.pptx)
- Excel (.xlsx)
- 画像ファイル (OCR)
- その他多数