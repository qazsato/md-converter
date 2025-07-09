# md-converter

Docker環境でmarkitdownを使用してファイルをMarkdownに変換するツールです。

## 使用方法

以下の手順で実行してください：

1. **環境構築**
   ```bash
   docker compose build
   ```

2. **ファイル配置**
   - 変換したいファイルを `input` ディレクトリに配置

3. **変換実行**
   ```bash
   ./convert.sh
   ```

4. **結果確認**
   - 変換されたMarkdownファイルが `output` ディレクトリに出力されます

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
- ffmpeg（音声・動画処理）

## Tips

### ヘルプの確認
```bash
./convert.sh --help
```

### 特定のファイルのみ変換
```bash
# 特定のファイルを変換
./convert.sh document.pdf

# フルパス指定も可能
./convert.sh ./input/document.pdf
```

### その他
- `input/` と `output/` ディレクトリは自動作成されます
- 複数ファイルを一括変換する場合は `input/` ディレクトリに配置後、引数なしで実行してください