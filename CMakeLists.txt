project("glad2-prebuilt")

include(FetchContent)

# Declare the content we want to fetch
FetchContent_Declare(
  glad
  GIT_REPOSITORY https://github.com/Dav1dde/glad
  GIT_TAG v2.0.4
  SOURCE_SUBDIR cmake
)

FetchContent_MakeAvailable(glad)

glad_add_library(glad_gl_core_46 
  REPRODUCIBLE 
  STATIC
  LANGUAGE "c++" 
  API gl:core=4.6)
  
add_library(glad::glad ALIAS glad_gl_core_46)
