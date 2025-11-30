# LPM CLI

Interface de linha de comando para o LPM (Lua Package Manager), permitindo gerenciar pacotes e projetos Lua.

## Funcionalidades

- **Gerenciamento de Pacotes**: Instale, publique e gerencie pacotes Lua
- **Inicialização de Projetos**: Crie novos projetos com estrutura padrão
- **Validação**: Verifique a integridade dos pacotes
- **Empacotamento**: Crie pacotes prontos para distribuição
- **Integração com Servidor**: Conecte-se a um repositório de pacotes remoto

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

# Construir o projeto atual
lua main.lua build

# Validar o manifesto do pacote
lua main.lua validate

# Empacotar para distribuição
lua main.lua pack

# Publicar um pacote
lua main.lua publish
```

## Estrutura do Projeto

```
lpm-cli/
├── src/
│   ├── cache.lua      # Gerenciamento de cache local
│   ├── cli.lua        # Lógica principal da CLI
│   ├── cli_init.lua   # Inicialização dos comandos
│   ├── commands/      # Implementação dos comandos
│   │   ├── build.lua    # Comando build
│   │   ├── create.lua   # Criação de projetos
│   │   ├── init.lua     # Inicialização
│   │   ├── install.lua  # Instalação de pacotes
│   │   ├── pack.lua     # Empacotamento
│   │   ├── publish.lua  # Publicação
│   │   └── validate.lua # Validação
│   └── network.lua    # Comunicação com o servidor
├── tests/             # Testes unitários
└── main.lua           # Ponto de entrada
```

## Comandos Disponíveis

- `init`: Inicializa um novo projeto LPM
- `create`: Cria um novo pacote
- `build`: Constrói o pacote atual
- `validate`: Valida o manifesto do pacote
- `pack`: Empacota o projeto para distribuição
- `install`: Instala um pacote
- `publish`: Publica um pacote no repositório

## Configuração

O LPM CLI pode ser configurado através de um arquivo `.env` na raiz do projeto:

```
SERVER_URL=http://localhost:8080  # URL do servidor LPM
CACHE_DIR=./.lpm/cache           # Diretório de cache
```

## Desenvolvimento

Para contribuir com o desenvolvimento:

1. Faça um fork do repositório
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Faça commit das suas alterações (`git commit -am 'Adiciona nova funcionalidade'`)
4. Faça push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Licença

MIT License
