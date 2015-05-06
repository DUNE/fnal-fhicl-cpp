if (ALT_CMAKE) 
include(altCMakeLists.cmake)
else()
install (FILES
    LinuxPPC.cmake
    DESTINATION ${product}/${version}/src/xcompile
    )
endif()
