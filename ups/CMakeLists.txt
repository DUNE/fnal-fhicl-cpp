if (ALT_CMAKE) 
include(altCMakeLists.cmake)
else()
process_ups_files()

cet_cmake_config()
endif()
