#!/bin/bash
set -exo pipefail

cmake -S . -B build \
  ${CMAKE_ARGS} \
  -DFILE_CHECK_EXECUTABLE=${BUILD_PREFIX}/libexec/llvm/FileCheck \
  -DARM_ENABLED=OFF \
  -DISPC_NO_DUMPS=ON \
  -DISPC_SLIM_BINARY=ON \
  -DISPC_INCLUDE_TESTS=ON \
  -DISPC_INCLUDE_EXAMPLES=OFF \
  -DISPC_INCLUDE_RT=OFF
cmake --build build --parallel ${CPU_COUNT}
cmake --install build

