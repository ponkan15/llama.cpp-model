#!/bin/bash

# 使用するモデルのパスを固定*******モデル名入れる！！！
MODEL_PATH=./models/granite-8b-code-instruct-4k.Q4_1.gguf

# モデルの存在確認
if [ ! -f "$MODEL_PATH" ]; then
    echo "Error: Model file '$MODEL_PATH' not found."
    exit 1
fi

# モデルのロードメッセージ
echo "Model '$MODEL_PATH' loaded successfully."

# 無限ループで応答を繰り返す
while true; do
    # プロンプト入力
    echo -n "Enter your prompt (or type 'exit' to quit): "
    read prompt
    
    # 'exit' で終了
    if [[ "$prompt" == "exit" ]]; then
        echo "Exiting..."
        break
    fi

    # llama-cli を使って応答を生成
    ./llama-cli -m "$MODEL_PATH" -p "$prompt"
done
