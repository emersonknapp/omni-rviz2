cmake_minimum_required(VERSION 3.5)

project(rviz_em)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rcutils REQUIRED)

add_executable(rviz_em
  src/rviz_em/main.cpp)
target_include_directories(rviz_em
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

ament_export_dependencies(rcutils)
ament_target_dependencies(rviz_em
  rcutils
  rviz_rendering
)

# TODO(emersonknapp) why is this bad? this adds `-l` option to emcc command, which it doesn't like
# target_link_libraries(rviz_em rcutils)

# ament_export_include_directories(include)

install(
  TARGETS rviz_em
  EXPORT rviz_em
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
)

ament_package()
