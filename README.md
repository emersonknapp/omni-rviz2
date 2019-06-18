# omni-rviz2

Experimental approach to a modularized RVIZ2 that can run natively or in the browser

## As of Today

This builds OGRE 1.12.0 via Emscripten, verifying that tthis build is possible at all. This build may be missing components, but the demo basically runs.

Would not successfully build out of the box with prior OGRE versions - this may cause

## Build

Dockerfile installs all dependencies and attempts to build a demonstration of some of the tech pieces.

```
docker build . -t omni-rviz2
```

## Run Demo

```
docker run -it -p 8000:8000 omni-rviz2
cd ogre/bin
python3 -m http.server 8000
```

Go to `localhost:8000` and view the glory



## Existing Works and References

* http://robotwebtools.org/
  * Javascript bindings for ROS and some web-native tooling like a partial visualizer using rosbridge protocol
* https://github.com/lucasw/imgui_ros
  * Attempt to replace the GUI framework in ROS tools
* https://vis.gl/
  * a fully fledged robotics web-based visualizer tool suite - from Uber
