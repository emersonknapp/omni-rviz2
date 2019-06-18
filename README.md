# omni-rviz2
Experimental approach to a modularized RVIZ2 that can run natively or in the browser

## As of Today
This installs Emscripten

## Build
Dockerfile installs all dependencies and attempts to build a demonstration of some of the tech pieces.

```
docker build . -t omni-rviz2
docker -it omni-rviz2
```
