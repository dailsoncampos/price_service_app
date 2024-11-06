# Usar uma imagem Ruby oficial como base
FROM ruby:3.1

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copiar os arquivos de gem para o cache de dependências
COPY Gemfile Gemfile.lock ./

# Instalar as dependências do projeto
RUN bundle install

# Copiar o restante do código para o contêiner
COPY . .

# Comando padrão para execução de testes
CMD ["rspec", "--format", "documentation"]
