# run llama-server using podman
MODELS_PATH=${MODEL_PATH:-$HOME/local-llm/models}
podman run -d \
  --name llama-server \
  --replace \
  --pull newer \
  -p 127.0.0.1:8080:8080 \
  -v "$MODELS_PATH":/models:ro \
  --device nvidia.com/gpu=all \
  --security-opt label=disable \
  --restart unless-stopped \
  ghcr.io/ggml-org/llama.cpp:server-cuda \
  --models-dir /models \
  --jinja \
  --flash-attn on \
  --parallel 1 \
  --fit on \
  --fit-target 4096 \
  --cache-type-k q8_0 \
  --cache-type-v q8_0 \
  --ctx-size 65536 \
  --host 0.0.0.0 \
  --port 8080 \
  --load-mode none \

