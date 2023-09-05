vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/CGSC
	REF d9de98663072d70111ea0200ccf24c61c1007232
	SHA512 546a0ec01ad1c7e0a003c987ec8e8a4bdef55924d7ceb4e4f67ea9c9e3679f6ba9c34b627d2c2d7ca170a5772822db79ecb5ef9a099724320aaa6b3cbcc4d59d
	HEAD_REF develop
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

file(INSTALL "${SOURCE_PATH}/" DESTINATION "${CURRENT_PACKAGES_DIR}/include/CGSC" FILES_MATCHING PATTERN "*.h" PATTERN "__test__" EXCLUDE)
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/.github")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/.vcpkg")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/asm")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/docs")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/scripts")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/CGSC/tests")
