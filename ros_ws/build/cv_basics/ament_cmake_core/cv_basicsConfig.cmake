# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_cv_basics_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED cv_basics_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(cv_basics_FOUND FALSE)
  elseif(NOT cv_basics_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(cv_basics_FOUND FALSE)
  endif()
  return()
endif()
set(_cv_basics_CONFIG_INCLUDED TRUE)

# output package information
if(NOT cv_basics_FIND_QUIETLY)
  message(STATUS "Found cv_basics: 0.0.0 (${cv_basics_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'cv_basics' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${cv_basics_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(cv_basics_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${cv_basics_DIR}/${_extra}")
endforeach()
