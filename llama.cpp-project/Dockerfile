# ベースイメージをPython Slimに変更
FROM python:3.12-slim

# 必要な依存パッケージをインストール
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git build-essential \
    wget cmake libopenblas-dev 

# 作業ディレクトリの作成
WORKDIR /app

# llama.cpp-project ディレクトリの内容をコンテナにコピー
COPY . /app/

# llama.cppのリポジトリをクローン
RUN git clone https://github.com/ggerganov/llama.cpp

# モデルをmodelsのディレクトリに移動　******モデル名入れる！！
RUN mv /app/granite-8b-code-instruct-4k.Q4_1.gguf /app/llama.cpp/models/

WORKDIR /app/llama.cpp

# Pythonパッケージのインストール
RUN python3 -m pip install --upgrade pip pytest cmake scikit-build setuptools fastapi uvicorn sse-starlette pydantic-settings starlette-context

# ビルド用ディレクトリの作成とビルドの実行
RUN make VERBOSE=1 

# bashをデフォルトコマンドとして起動（修正）
# CMD ["/bin/bash"]

# スクリプトの実行権限を付与
RUN chmod +x /app/run_llama.sh

# デフォルトコマンドを修正し、llama-cliを実行
# スクリプトを絶対パスで実行
CMD ["/bin/bash", "/app/run_llama.sh"]
