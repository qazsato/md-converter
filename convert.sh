#!/bin/bash

# Create directories if they don't exist
mkdir -p input output

# Usage information
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Usage: ./convert.sh [file_path]"
    echo "  file_path: Path to the file to convert (relative to input directory)"
    echo ""
    echo "Examples:"
    echo "  ./convert.sh document.pdf"
    echo "  ./convert.sh folder/document.docx"
    echo ""
    echo "The converted markdown file will be saved to the output directory."
    exit 0
fi

# Check if file path is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a file path"
    echo "Usage: ./convert.sh [file_path]"
    exit 1
fi

# Clean up the file path (remove leading ./input/ if present)
FILE_PATH="$1"
FILE_PATH="${FILE_PATH#./input/}"
FILE_PATH="${FILE_PATH#input/}"

# Check if input file exists
if [ ! -f "input/$FILE_PATH" ]; then
    echo "Error: File 'input/$FILE_PATH' not found"
    echo "Please place your file in the input directory"
    exit 1
fi

# Run the conversion using docker-compose
echo "Converting $FILE_PATH to markdown..."

# Get base filename without extension and add .md
BASE_NAME=$(basename "$FILE_PATH")
OUTPUT_NAME="${BASE_NAME%.*}.md"

docker compose run --rm md-converter python -m markitdown "input/$FILE_PATH" -o "output/$OUTPUT_NAME"

echo "Conversion completed! Check the output directory."