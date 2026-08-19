# Local LLM
Local LLM setup using podman and llama-server with GPU passthrough

## Usage
./start-container.sh runs the container. The `./models` dir where the script is run will be bound to `/models` in the container. The value of $MODEL_FILENAME and $MMPROJ_FILENAME will be appended to /models for the main model gguf file and the associated mmproj file, respectively

# Dependencies
- podman
- [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
    - i'm on Arch Linux, its in the Extra repo, ymmv on other distros or OSes
