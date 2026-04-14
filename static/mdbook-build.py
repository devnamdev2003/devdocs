import os
import shutil
import subprocess

BASE_DIR = "md-code2"
SRC_DIR = "src"
OUTPUT_BASE = "docs"

AUTHOR = "Dev Namdev"


def clean():
    """Remove src folder and book.toml if they exist"""
    if os.path.exists(SRC_DIR):
        shutil.rmtree(SRC_DIR)

    if os.path.exists("book.toml"):
        os.remove("book.toml")


def create_summary(title, md_file):
    return f"""# Summary

- [{title}]({md_file})
"""


def create_book_toml(title, build_dir):
    return f"""[book]
title = "{title}"
authors = ["{AUTHOR}"]
language = "en"
src = "src"

[build]
build-dir = "{build_dir}"
"""


# Ensure output base exists
os.makedirs(OUTPUT_BASE, exist_ok=True)

# Loop through md-code2 folders
for folder in os.listdir(BASE_DIR):
    folder_path = os.path.join(BASE_DIR, folder)

    if not os.path.isdir(folder_path):
        continue

    # Find the .md file
    md_files = [f for f in os.listdir(folder_path) if f.endswith(".md")]
    if not md_files:
        continue

    md_file = md_files[0]
    title = folder.upper()

    print("\n===============================")
    print(f"Building {title}")
    print("===============================")

    clean()

    # Create src folder
    os.makedirs(SRC_DIR, exist_ok=True)

    # Copy markdown file
    shutil.copy(
        os.path.join(folder_path, md_file),
        os.path.join(SRC_DIR, md_file)
    )

    # Create SUMMARY.md
    with open(os.path.join(SRC_DIR, "SUMMARY.md"), "w", encoding="utf-8") as f:
        f.write(create_summary(title, md_file))

    # Create book.toml
    build_dir = f"{OUTPUT_BASE}/{folder}"
    with open("book.toml", "w", encoding="utf-8") as f:
        f.write(create_book_toml(title, build_dir))

    # Run mdbook build
    subprocess.run(["mdbook", "build"], check=True)

    print(f"✔ {title} built successfully")

# Final cleanup
clean()

print("\n===============================")
print("All mdBooks built successfully")
print("===============================")
