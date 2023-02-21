cmake_minimum_required(VERSION 3.22)

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
  API gl:core=4.6
)

#   LOCATION "${PROJECT_SOURCE_DIR}/external/glad_gl_core_46"

include(GNUInstallDirs)

install(DIRECTORY ${CMAKE_BINARY_DIR}/gladsources/glad_gl_core_46/include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# define the export of our cmake target:
install(
  TARGETS glad_gl_core_46
  EXPORT glad_gl_core_46
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)
