# Copycentral Website

Site institucional da Copycentral, desenvolvido com Django.

## Requisitos

- Python 3.8 ou superior
- Django 5.0.1
- Dependências principais:
  - django-bootstrap4: Interface com Bootstrap 4
  - whitenoise: Servir arquivos estáticos
  - django-compressor: Otimização de assets
  - gunicorn: Servidor WSGI para produção
  - Pillow: Processamento de imagens
- Outras dependências listadas em `requirements.txt`

## Início Rápido

1. Clone o repositório
2. Execute `config.bat`
3. Escolha a opção 1 para configuração inicial completa
4. Após a configuração, escolha a opção 2 para iniciar o servidor

Para configuração manual, veja a seção "Configuração Manual" abaixo.

## Script de Configuração (config.bat)

Execute `config.bat` para acessar o menu interativo com as seguintes opções:

1. **Configuração inicial completa**
   - Cria ambiente virtual
   - Instala dependências
   - Executa migrações
   - Coleta arquivos estáticos

2. **Iniciar servidor local**
   - Inicia o servidor em localhost:8000

3. **Iniciar servidor para acesso externo**
   - Mostra seu IP na rede
   - Inicia o servidor acessível por outros dispositivos

4. **Coletar arquivos estáticos**
   - Atualiza arquivos estáticos do projeto

5. **Verificar código**
   - Executa verificações de código
   - Checa migrações pendentes

6. **Limpar cache e arquivos temporários**
   - Remove arquivos .pyc
   - Limpa diretórios __pycache__
   - Remove pasta staticfiles

## Configuração Manual

Se preferir não usar o script, siga estes passos:

1. Crie e ative o ambiente virtual:
   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

2. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```

3. Configure o banco de dados:
   ```bash
   python manage.py migrate
   ```

4. Colete arquivos estáticos:
   ```bash
   python manage.py collectstatic
   ```

## Configuração do Email

Para o formulário de contato funcionar:

1. Configure no `copycentral/settings.py`:
   ```python
   EMAIL_HOST_USER = 'seu_email@gmail.com'
   EMAIL_HOST_PASSWORD = 'sua_senha_de_app'
   ```

2. Gere uma senha de app no Gmail:
   - Acesse configurações da conta Google
   - Ative verificação em duas etapas
   - Vá em "Senhas de app"
   - Gere uma nova senha
   - Use esta senha no settings.py

## Acesso Externo

Para acesso de outros dispositivos na rede:

1. Execute `config.bat` e escolha opção 3
2. Anote o IP mostrado
3. Outros dispositivos acessam via:
   ```
   http://SEU_IP:8000
   ```

## Estrutura do Projeto

```
copycentral/
├── core/                   # App principal
│   ├── templates/         # Templates do app
│   ├── views.py          # Views e lógica
│   └── urls.py           # URLs do app
├── static/                # Arquivos estáticos
│   ├── css/             # Estilos
│   ├── js/              # JavaScript
│   └── img/             # Imagens
├── templates/             # Templates globais
├── copycentral/          # Configurações do projeto
└── manage.py             # Script de gerenciamento
```

## Funcionalidades

- Página inicial responsiva
- Carrossel de serviços com animações
- Formulário de contato com envio de email
- Seções: Serviços, Sobre, Projetos, Depoimentos
- Links para redes sociais (Facebook, Instagram, WhatsApp, LinkedIn)
- Mapa de localização integrado

## Manutenção

Use o `config.bat` (opções 4, 5 e 6) para manutenção ou execute manualmente:

1. Atualizar dependências:
   ```bash
   pip install -r requirements.txt --upgrade
   ```

2. Verificar e aplicar migrações:
   ```bash
   python manage.py migrate
   ```

3. Atualizar arquivos estáticos:
   ```bash
   python manage.py collectstatic
   ```

4. Limpar arquivos temporários:
   ```bash
   del /s /q *.pyc
   del /s /q __pycache__
   ```

