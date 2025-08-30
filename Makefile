.PHONY: build run test clean fmt clippy

# Build the project
build:
	cargo build

# Build for release
build-release:
	cargo build --release

# Run the project
run:
	cargo run

# Run tests
test:
	cargo test

# Clean build artifacts
clean:
	cargo clean

# Format code
fmt:
	cargo fmt

# Run clippy linter
clippy:
	cargo clippy -- -D warnings

# Check code without building
check:
	cargo check

# Install dependencies
deps:
	cargo fetch

# Update dependencies
update:
	cargo update

# Run with watch (requires cargo-watch)
watch:
	cargo watch -x run

# Install cargo-watch if not present
install-watch:
	cargo install cargo-watch

# Docker build
docker-build:
	docker build -t x-app .

# Docker run
docker-run:
	docker run -p 3000:3000 x-app
