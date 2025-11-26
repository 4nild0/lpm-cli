# LPM CLI

Command-line interface for the LPM (Lua Package Manager) ecosystem.

## Features

- **Project Initialization**: Create new LPM projects
- **Package Management**: Install and manage dependencies
- **Archive Creation**: Package projects for distribution
- **TOML Support**: Parse and generate TOML manifests
- **Pure Lua**: No external dependencies

## Installation

```bash
# Clone the repository
git clone https://github.com/4nild0/lpm-cli.git
cd lpm-cli

# Run tests
lua tests.lua
```

## Usage

```bash
# Initialize a new project
lua main.lua init my-project

# Install a package
lua main.lua install package-name

# Create a package archive
lua main.lua pack my-project
```

## Project Structure

```
lpm-cli/
├── src/
│   ├── archive.lua    # Archive creation (zip)
│   ├── fs.lua         # File system operations
│   ├── project.lua    # Project initialization
│   └── toml.lua       # TOML parsing/encoding
├── tests/
│   ├── test_archive.lua
│   ├── test_fs.lua
│   ├── test_project.lua
│   └── test_toml.lua
├── main.lua           # CLI entry point
└── project.toml       # Project manifest
```

## Commands

### init

Create a new LPM project.

```bash
lua main.lua init <project-name>
```

Creates:
- `project-name/`
  - `src/` - Source code directory
  - `deps/` - Dependencies directory
  - `tests/` - Test directory
  - `lpm.toml` - Project manifest

### install

Install a package from the LPM repository.

```bash
lua main.lua install <package-name>[@version]
```

### pack

Create a distributable archive of your project.

```bash
lua main.lua pack <project-directory>
```

## Testing

Uses the [lpm-test](https://github.com/4nild0/lpm-test) framework.

```bash
lua tests.lua
```

## Manifest Format

LPM projects use TOML manifests (`lpm.toml` or `project.toml`):

```toml
[project]
name = "my-package"
version = "1.0.0"
description = "A sample package"
author = "Your Name"
license = "MIT"

[dependencies]
some-package = "1.0.0"
```

## License

MIT
