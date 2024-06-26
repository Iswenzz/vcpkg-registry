vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO epezent/implot
	REF v${VERSION}
	SHA512 117cb08122d900e7db857897bfec4c9ac3300a1d429c8f0303415bc693840baa9bbbb91ca3f13853d8efd3a6ebf538b7114401d4fbfe0d067256e58cbdbd4919
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
