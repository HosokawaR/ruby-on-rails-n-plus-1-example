FROM ruby:3.2.2

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

# 作業ディレクトリの設定
WORKDIR /app

# Gemfileのコピー
COPY Gemfile Gemfile.lock ./

# Bundlerのインストールと依存関係の解決
RUN bundle install

# アプリケーションのコピー
COPY . .

# ポートの公開
EXPOSE 3000

# サーバーの起動
CMD ["rails", "server", "-b", "0.0.0.0"]
