# omni-rviz2

Experimental approach to a modularized RVIZ2 that can run natively or in the browser

## Project structure

### rviz_em
Emscripten bundling of rviz into a single JS file

### rviz_web
node+webpack+react project that loads Emscripten-compiled OGRE sample. Installation/building is not streamlined yet.

```
npm install
npm build
cp $ROS_WS/build/rviz_ogre_vendor/ogre-master-ca665a6-prefix/src/ogre-master-ca665a6-build/bin/EmscriptenSample.* dist/
npm start
```

Direct your browser to localhost:8080 to see the OGRE demo.


## Existing Works and References

* http://robotwebtools.org/
  * Javascript bindings for ROS and some web-native tooling like a partial visualizer using rosbridge protocol
* https://github.com/lucasw/imgui_ros
  * Attempt to replace the GUI framework in ROS tools with an immediate-mode one
* https://vis.gl/
  * a from-scratch robotics web-based visualizer tool suite - from Uber
* https://webviz.io/
  * Webviz - another built-from-scratch attempt to visualize ros data. Currently supports rosbag playback

## Colcon foray

Creates a JS output that links against and calls another ament package.

```
colcon build --cmake-args -DCMAKE_TOOLCHAIN_FILE=/root/emsdk/fastcomp/emscripten/cmake/Modules/Platform/Emscripten.cmake -DBUILD_TESTING=OFF --packages-up-to rviz_em --packages-ignore osrf_testing_tools_cpp

node build/rviz_em/rviz_em.js
```
