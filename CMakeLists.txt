project(glad2_loader)

# Declare the content we want to fetch
FetchContent_Declare(
  glad
  GIT_REPOSITORY https://github.com/Dav1dde/glad
  GIT_TAG glad2
  SOURCE_SUBDIR cmake
)

FetchContent_MakeAvailable(glad)
glad_add_library(glad_gl 
  REPRODUCIBLE 
  # STATIC
  LANGUAGE "c++" 
  API gl:core=4.6)
add_library(glad::glad ALIAS glad_gl)

add_library(${PROJECT_NAME}
    include/glad2_loader.h
    src/glad2_loader.cc)

target_link_libraries(${PROJECT_NAME}
    PRIVATE sdl2
    PUBLIC glad_gl_core_42)







