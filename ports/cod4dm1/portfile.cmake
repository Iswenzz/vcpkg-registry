vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO iswenzz/CoD4-DM1
	REF c146c21562028e90fa4ab82c0953dd6a2a37a259
	SHA512 20eeaeb8a918183f5c2f197aa12031b42ea5ca354d3ece3aa383acc6eae926b1de617e6cba5876d705f42af6baebd4aa6734ae96dc9a870b989e334dab46cd12
	HEAD_REF develop
)

set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)
set(VCPKG_POLICY_DLLS_WITHOUT_LIBS enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

file(INSTALL "${SOURCE_PATH}/src/" DESTINATION "${CURRENT_PACKAGES_DIR}/include/CoD4DM1" FILES_MATCHING PATTERN "*.hpp" PATTERN "__test__" EXCLUDE)
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
