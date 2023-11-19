vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/IzInjector
	REF e9266b19eb35df8f1efbc03d804eedc9afe33588
	SHA512 d96a0d0525b3fa5dc31cfe316277ca3da465ba8be93e16862108aed78240b6a98be1607fb38576b27419615993533408fb22975fbe5d1fa325e0df049bb3d792
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
