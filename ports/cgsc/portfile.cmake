vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/CGSC
	REF fff78805ced55e99617643a6a797f1b6cb05bed6
	SHA512 a8d248fa6156922f2b5a5ce08d4d50deeca60d6ed0a4c2eb7d58e126a4175690235c5a8dc1eae601c3bf470316323f8f43630cf7db672ac3b4a78df2d193686b
	HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/CGSC")

file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/.github")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/.vcpkg")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/cmake")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/asm")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/docs")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/scripts")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/tests")
