#-----------------------------------------------------------------------
# Base directories and sources
#
set(fhiclcpp_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/fhiclcpp")
set(fhiclcpp_INCLUDE_DIR "${fhiclcpp_ROOT_DIR}/fhiclcpp")


# define contents of interest:
set(PUBLIC_HDRS
  ${fhiclcpp_INCLUDE_DIR}/DatabaseSupport.h
  ${fhiclcpp_INCLUDE_DIR}/ParameterSet.h
  ${fhiclcpp_INCLUDE_DIR}/ParameterSetID.h
  ${fhiclcpp_INCLUDE_DIR}/ParameterSetRegistry.h
  ${fhiclcpp_INCLUDE_DIR}/coding.h
  ${fhiclcpp_INCLUDE_DIR}/exception.h
  ${fhiclcpp_INCLUDE_DIR}/extended_value.h
  ${fhiclcpp_INCLUDE_DIR}/fwd.h
  ${fhiclcpp_INCLUDE_DIR}/intermediate_table.h
  ${fhiclcpp_INCLUDE_DIR}/make_ParameterSet.h
  ${fhiclcpp_INCLUDE_DIR}/parse.h
  ${fhiclcpp_INCLUDE_DIR}/tokens.h
  ${fhiclcpp_INCLUDE_DIR}/type_traits.h
)

set(SOURCES
  ${fhiclcpp_INCLUDE_DIR}/DatabaseSupport.cc
  ${fhiclcpp_INCLUDE_DIR}/ParameterSet.cc
  ${fhiclcpp_INCLUDE_DIR}/ParameterSetID.cc
  ${fhiclcpp_INCLUDE_DIR}/ParameterSetRegistry.cc
  ${fhiclcpp_INCLUDE_DIR}/coding.cc
  ${fhiclcpp_INCLUDE_DIR}/exception.cc
  ${fhiclcpp_INCLUDE_DIR}/extended_value.cc
  ${fhiclcpp_INCLUDE_DIR}/intermediate_table.cc
  ${fhiclcpp_INCLUDE_DIR}/make_ParameterSet.cc
  ${fhiclcpp_INCLUDE_DIR}/parse.cc
)

add_library(obj-fhiclcpp OBJECT ${PUBLIC_HDRS} ${SOURCES})

add_executable(fhicl-expand ${fhiclcpp_INCLUDE_DIR}/fhicl-expand.cc)
target_link_libraries(fhicl-expand
  FNALCore
  ${Boost_PROGRAM_OPTIONS_LIBRARY}
  )

add_executable(fhicl-write-db ${fhiclcpp_INCLUDE_DIR}/fhicl-write-db.cc)
target_link_libraries(fhicl-write-db
  FNALCore
  ${SQLite3_LIBRARIES}
  )

# TEMP local install of exes
install(TARGETS fhicl-expand fhicl-write-db
  EXPORT FNALCoreExports
  DESTINATION ${CMAKE_INSTALL_BINDIR}
  COMPONENT Runtime
  )

# TEMP local install of headers
install(FILES ${PUBLIC_HDRS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/FNALCore/fhiclcpp
  COMPONENT Development
  )

# ======================================================================
