#!/bin/bash

set -e

echo "Setting up Rust Lobsters-like project..."

# Check if Rust is installed
if ! command -v cargo &> /dev/null; then
    echo "Rust is not installed. Please install Rust first:"
    echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

# Check Rust version
echo "Rust version:"
rustc --version
cargo --version

# Install additional tools
echo "Installing additional Rust tools..."
cargo install cargo-watch || true
cargo install cargo-audit || true
cargo install diesel_cli --no-default-features --features postgres || true

# Build the project
echo "Building the project..."
cargo build

# Run tests
echo "Running tests..."
cargo test

# Check code quality
echo "Running clippy..."
cargo clippy -- -D warnings

# Format code
echo "Formatting code..."
cargo fmt

echo "Setup completed successfully!"
echo ""
echo "Available commands:"
echo "  make build       - Build the project"
echo "  make run         - Run the project"
echo "  make test        - Run tests"
echo "  make watch       - Run with auto-reload"
echo "  make docker-build - Build Docker image"
