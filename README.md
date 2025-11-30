# LPM CLI (Interface de Linha de Comando)

Interface de linha de comando para o ecossistema LPM (Lua Package Manager).

## Funcionalidades

- **Inicialização de Projetos**: Crie novos projetos LPM
- **Gerenciamento de Pacotes**: Instale e gerencie dependências
- **Criação de Arquivos**: Empacote projetos para distribuição
- **Suporte a TOML**: Leitura e geração de manifestos TOML
- **Puro Lua**: Sem dependências externas
- **Carregamento Automático**: Suporte a autoload de módulos

## Instalação

```bash
# Clone o repositório
git clone https://github.com/4nild0/lpm-cli.git
cd lpm-cli

# Execute os testes
lua tests.lua
```

## Uso Básico

```bash
# Inicializar um novo projeto
lua main.lua init meu-projeto

# Instalar um pacote
lua main.lua install nome-do-pacote

# Criar um pacote compactado
lua main.lua pack meu-projeto

# Publicar um pacote
lua main.lua publish
```

## Estrutura do Projeto

```
lpm-cli/
├── src/
│   ├── commands/      # Comandos da CLI
│   │   ├── init.lua   # Inicialização de projetos
│   │   ├── install.lua # Instalação de pacotes
│   │   └── ...
│   ├── cli.lua        # Núcleo da CLI
│   ├── cli_init.lua   # Inicialização dos comandos
│   ├── network.lua    # Requisições HTTP
│   └── cache.lua      # Gerenciamento de cache
├── tests/             # Testes unitários
│   ├── test_cli.lua
│   └── ...
└── main.lua           # Ponto de entrada
```

## Configuração

Crie um arquivo `.env` na raiz do projeto para configurar:

```
SERVER_URL=http://localhost:8080
```

## Desenvolvimento

1. Faça um fork do repositório
2. Crie uma branch para sua feature
3. Envie um pull request

## Licença

MIT
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
