vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/CoD4-DM1
	REF bb43514ee4675f2c090f6f8686b314d71b780989
	SHA512 abd45260ffbbaa891cbff00998f0d1df49e6242998e817bcbab0588475e30f11cbdf6cf9aceae8fd9fad605dbd8c07dffd74d5d5efbb6cc3a2c7516f97a87b5a
	HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/CoD4DM1")

file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
