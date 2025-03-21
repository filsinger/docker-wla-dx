# Docker container for the [wla-dx](https://github.com/vhelin/wla-dx) assembler.

## Pulling from docker hub

```sh
docker pull filsinger/wla-dx
```

### Pulling Version `v10.6`
```sh
docker pull filsinger/wla-dx:v10.6
```

## Usage Example

```sh
docker run -it --rm filsinger/wla-dx:<version> <command>
```

### Example of assembling and linking

Mount the current working directory in the container.
Assemble files using `wla-6502` and link using `wlalink`.

```sh
docker run -v $(pwd):/project -it --rm filsinger/wla-dx bash -c "cd /project && wla-6502 -o main.o main.s && wlalink -v -s linkfile linked.rom"
```

## Building the Image

```sh
docker buildx build -t filsinger/wla-dx:<version> . --build-arg WLA_DX_BRANCH=<tag-version>
```
