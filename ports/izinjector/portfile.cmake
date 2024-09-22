vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/IzInjector
	REF 5c037b9e2b79ff40f7c77d6aef64fff69917cfaf
	SHA512 3b68fc0709763f304aa18edbd485d257dae16571b882e052500808f5b33e1dfde3da38fe46648994e186303238ec83b881cccd6c0e1b9460eb070a8e4a681cf2
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
