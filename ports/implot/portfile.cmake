vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO epezent/implot
	REF 3da8bd34299965d3b0ab124df743fe3e076fa222
	SHA512 8a95f76ae4a14adf6f3bcd798d2334d8282ff7b50fc7def6308c0556adcc1dbd151c0a36aa676a82e10e1ae80d1ecc1ac54e705180650eed46d0a609611c73c5
	HEAD_REF master
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
	vcpkg_replace_string("${SOURCE_PATH}/implot.h" "#define IMPLOT_API" "#define IMPLOT_API __declspec(dllexport)")
endif()

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS_DEBUG
		-DIMPLOT_SKIP_HEADERS=ON
)

vcpkg_cmake_install()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "dynamic")
	vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/implot.h" "#define IMPLOT_API __declspec(dllexport)" "#define IMPLOT_API __declspec(dllimport)")
endif()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
