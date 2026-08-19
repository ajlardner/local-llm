# run llama-server using podman
set -euo pipefail

MODEL_FILENAME=${MODEL_FILENAME:-qwen/Qwen3.8-27B-Q4_0.gguf}
MMPROJ_FILENAME=${MMPROJ_FILENAME:-qwen/mmproj-Qwen3.8-27B-BF16.gguf}

podman run -d \
  --name llama-server \
  --replace \
  --pull newer \
  -p 127.0.0.1:8080:8080 \
  -v ./models:/models:ro \
  --device nvidia.com/gpu=all \
  --security-opt label=disable \
  --restart unless-stopped \
  ghcr.io/ggml-org/llama.cpp:server-cuda \
  --model /models/"$MODEL_FILENAME" \
  --mmproj /models/"$MMPROJ_FILENAME" \
  --fit on \
  --fit-target 1024 \
  --ctx-size 128000 \
  --host 0.0.0.0 \
  --port 8080 \
  --no-mmap \
  --reasoning-budget 0

