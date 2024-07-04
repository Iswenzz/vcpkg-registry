vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/IzInjector
	REF 1eb55be91f9a3642668cf6d3c9ebefcbfa905f92
	SHA512 cbb65ea718ab7d0f66b03da100fe03481e9fe9f006bfed959b42d22e48536bfda5db684956ac47fc70d14aee865bd3c5578a238627f55116e0062759b5c4c480
	HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/IzInjector")

file(INSTALL "${SOURCE_PATH}/cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
