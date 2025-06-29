# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

md-converter is a Docker-based tool that converts various file formats to Markdown using the markitdown library. The tool operates through a shell script wrapper that manages Docker container execution.

## Architecture

- **Dockerized Environment**: All conversion happens inside a Docker container with Python 3.11 and necessary system dependencies
- **Shell Script Interface**: `convert.sh` serves as the main entry point, handling file path processing and Docker orchestration
- **Directory-based I/O**: Input files go in `input/`, converted Markdown files appear in `output/`
- **Batch Processing**: Supports both single file conversion and batch processing of all files in input directory

## Key Commands

```bash
# Build the Docker environment
docker compose build

# Convert a single file
./convert.sh filename.pdf

# Convert all files in input directory
./convert.sh

# Get help
./convert.sh --help
```

## File Processing Logic

The `convert.sh` script:
1. Creates `input/` and `output/` directories if they don't exist
2. When no argument is provided, processes all files in `input/` directory
3. When a file path is provided, processes that specific file
4. Handles path normalization (removes `./input/` or `input/` prefixes)
5. Uses Docker Compose to run the markitdown conversion
6. Outputs converted files with `.md` extension

## Dependencies

The Docker container includes:
- markitdown[all] Python package
- poppler-utils (PDF processing)
- tesseract-ocr (OCR for images)
- libreoffice (Office document processing)
- ffmpeg (audio/video processing)

## Development Notes

- The main conversion logic uses `docker compose run --rm md-converter python -m markitdown`
- File path handling includes cleanup of various input path formats
- Batch processing iterates through files using shell globbing
- Error handling includes file existence checks and usage information