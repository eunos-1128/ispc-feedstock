#!/bin/bash
set -exo pipefail

# Use our compilers instead of clang/clang++
sed -i.bak 's|set(CMAKE_C_COMPILER|set(CMAKE_C_COMPILER_BAK|g' CMakeLists.txt
sed -i.bak 's|set(CMAKE_CXX_COMPILER|set(CMAKE_CXX_COMPILER_BAK|g' CMakeLists.txt

cmake -S . -B build \ 
  ${CMAKE_ARGS} \
  -DLLVM_TOOLS_BINARY_DIR=${BUILD_PREFIX}/bin \
  -DISPC_INCLUDE_EXAMPLES=OFF \
  -DISPC_INCLUDE_TESTS=OFF \
  -DISPC_INCLUDE_UTILS=OFF \
  -DARM_ENABLED=OFF \
  -DISPC_NO_DUMPS=ON \
  -DISPC_SLIM_BINARY=ON
cmake --build build --parallel ${CPU_COUNT}
cmake --install build

