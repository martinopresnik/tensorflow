 
include (ExternalProject)

set(abseil_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/abseil)
#set(abseil_EXTRA_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/abseil/src)
set(abseil_BUILD ${CMAKE_BINARY_DIR}/abseil/src/abseil-build)
#set(abseil_LIBRARIES ${abseil_BUILD}/obj/so/libabseil.so)
set(abseil_STATIC_LIBRARIES
# TODO: Set paths to .a files!!!
    ${abseil_BUILD}/something.a
)
set(abseil_INCLUDES ${abseil_BUILD})

set(abseil_HEADERS
    "${abseil_INCLUDE_DIR}/include/*.h"
)

ExternalProject_Add(abseil
    PREFIX abseil
    GIT_REPOSITORY https://github.com/abseil/abseil-cpp.git
    GIT_TAG f4bb8afa9376b4120f56f3beff7b07260da4a5c2
    DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
    # BUILD_IN_SOURCE 1
    BUILD_BYPRODUCTS ${abseil_STATIC_LIBRARIES}
    # INSTALL_COMMAND ""
    CMAKE_CACHE_ARGS
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=${tensorflow_ENABLE_POSITION_INDEPENDENT_CODE}
        -DCMAKE_BUILD_TYPE:STRING=Release
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF
)

link_libraries(${abseil_STATIC_LIBRARIES})

