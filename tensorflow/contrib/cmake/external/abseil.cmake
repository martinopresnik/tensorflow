 
include (ExternalProject)

ExternalProject_Add(abseil
    PREFIX abseil
    GIT_REPOSITORY https://github.com/abseil/abseil-cpp.git
    DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
    # BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
    CMAKE_CACHE_ARGS
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=${tensorflow_ENABLE_POSITION_INDEPENDENT_CODE}
        -DCMAKE_BUILD_TYPE:STRING=Release
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF
)

add_subdirectory(abseil-cpp)

link_libraries(
    absl::base
    absl::algorithm
    absl::container
    absl::debugging
    absl::memory
    absl::meta
    absl::numeric
    absl::strings
    absl::synchronization
    absl::time
    absl::utility
)

