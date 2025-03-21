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

```sh
docker run -it --rm filsinger/wla-dx wla-6502 -M -t -o main.o main.asm
```

## Building the Image

```sh
docker buildx build -t filsinger/wla-dx:<version> . --build-arg WLA_DX_BRANCH=<tag-version>
```
