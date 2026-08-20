# Local LLM
Local LLM setup using podman and llama-server with GPU passthrough

## Usage
./start-container.sh runs the container. The `./models` dir where the script is run will be bound to `/models` in the container. All gguf files in that directory will be loaded using llama-server's model routing capabilities with the --models-dir flag. 

# Dependencies
- podman
- [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
    - i'm on Arch Linux, its in the Extra repo, ymmv on other distros or OSes
