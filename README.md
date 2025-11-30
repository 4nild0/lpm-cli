# LPM CLI

Interface de linha de comando para o LPM (Lua Package Manager), permitindo gerenciar pacotes e projetos Lua.

## Descrição

O `lpm-cli` é a ferramenta principal para interagir com o LPM. Ele permite criar projetos, gerenciar dependências, construir pacotes, validar manifestos e publicar pacotes em um repositório remoto.

## Funcionalidades

- **Gerenciamento de Pacotes**: Instale, publique e gerencie pacotes Lua
- **Inicialização de Projetos**: Crie novos projetos com estrutura padrão
- **Validação**: Verifique a integridade dos pacotes e manifestos
- **Empacotamento**: Crie pacotes prontos para distribuição
- **Build e Execução**: Construa e execute projetos Lua
- **Integração com Servidor**: Conecte-se a um repositório de pacotes remoto

## Instalação

```bash
# Clone o repositório
git clone https://github.com/4nild0/lpm-cli.git
cd lpm-cli

# Execute os testes
lua tests/test_cli.lua
```

## Uso Básico

```bash
# Inicializar um novo projeto
lua main.lua init meu-projeto

# Criar um novo pacote
lua main.lua create nome-do-pacote

# Construir o projeto atual
lua main.lua build

# Executar o projeto
lua main.lua run

# Validar o manifesto do pacote
lua main.lua validate

# Empacotar para distribuição
lua main.lua pack

# Instalar um pacote
lua main.lua install nome-do-pacote

# Publicar um pacote
lua main.lua publish
```

## Estrutura do Projeto

```
lpm-cli/
├── src/
│   ├── autoload.lua    # Sistema de autoload de módulos
│   ├── cache.lua       # Gerenciamento de cache local
│   ├── cli.lua         # Lógica principal da CLI
│   ├── cli_init.lua    # Inicialização dos comandos
│   ├── commands/       # Implementação dos comandos
│   │   ├── build.lua     # Comando build
│   │   ├── create.lua    # Criação de projetos
│   │   ├── init.lua      # Inicialização
│   │   ├── install.lua   # Instalação de pacotes
│   │   ├── pack.lua      # Empacotamento
│   │   ├── publish.lua   # Publicação
│   │   ├── run.lua       # Execução de projetos
│   │   └── validate.lua  # Validação
│   └── network.lua     # Comunicação com o servidor
├── bin/                # Scripts executáveis
├── deps/               # Dependências (lpm-core)
├── test-project/       # Projeto de teste
├── tests/              # Testes unitários
│   └── test_cli.lua
├── main.lua            # Ponto de entrada
└── project.toml        # Manifesto do projeto
```

## Comandos Disponíveis

- `init <nome>`: Inicializa um novo projeto LPM no diretório especificado
- `create <nome>`: Cria um novo pacote com estrutura padrão
- `build`: Constrói o pacote atual
- `run`: Executa o projeto atual
- `validate`: Valida o manifesto do pacote (project.toml)
- `pack`: Empacota o projeto para distribuição
- `install <nome>`: Instala um pacote do repositório
- `publish`: Publica um pacote no repositório remoto

## Configuração

O LPM CLI pode ser configurado através de um arquivo `.env` na raiz do projeto:

```env
SERVER_URL=http://localhost:8080  # URL do servidor LPM
CACHE_DIR=./.lpm/cache           # Diretório de cache
```

## Dependências

- **lpm-core**: Biblioteca central do LPM (instalada automaticamente)

## Desenvolvimento

Para contribuir com o desenvolvimento:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Faça commit das suas alterações (`git commit -am 'Adiciona nova funcionalidade'`)
4. Faça push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Licença

MIT License
