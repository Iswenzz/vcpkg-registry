
if(EXISTS "${CURRENT_INSTALLED_DIR}/include/mysql/mysql.h")
	message(FATAL_ERROR "FATAL ERROR: libmysql and libmariadb are incompatible.")
endif()

vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO mariadb-corporation/mariadb-connector-c
	REF c0ddc2c8cff30aebbedc5ae175e435c2c6fec646
	SHA512 4130188036045ca3cd003378ea61c4420cf64e1d6ab77047bf95418a5323f1057951082fe8658ec3c57cb6d3d3f6326bad651cced0e9576fff923f6b8c2ad71e
	HEAD_REF c0ddc2c8cff30aebbedc5ae175e435c2c6fec646
	PATCHES mingw.patch
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()

file(INSTALL "${SOURCE_PATH}/README" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/COPYING.LIB" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/pkgconfig")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/lib/debug/pkgconfig")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/bin/mariadb")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/bin/plugin")
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/bin/plugin")

if(VCPKG_TARGET_IS_WINDOWS)
	file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/libmariadb.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/libmariadb.dll")
	file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/libmariadb.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/libmariadb.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/plugin/caching_sha2_password.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/plugin/caching_sha2_password.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/plugin/caching_sha2_password.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/plugin/caching_sha2_password.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/plugin/client_ed25519.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/plugin/client_ed25519.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/plugin/client_ed25519.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/plugin/client_ed25519.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/plugin/dialog.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/plugin/dialog.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/plugin/dialog.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/plugin/dialog.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/plugin/mysql_clear_password.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/plugin/mysql_clear_password.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/plugin/mysql_clear_password.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/plugin/mysql_clear_password.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/plugin/pvio_shmem.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/plugin/pvio_shmem.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/plugin/pvio_shmem.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/plugin/pvio_shmem.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/lib/mariadb/plugin/sha256_password.dll" "${CURRENT_PACKAGES_DIR}/bin/mariadb/plugin/sha256_password.dll")
    file(RENAME "${CURRENT_PACKAGES_DIR}/debug/lib/mariadb/plugin/sha256_password.dll" "${CURRENT_PACKAGES_DIR}/debug/bin/mariadb/plugin/sha256_password.dll")
endif()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
	file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin")
	file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

file(RENAME "${CURRENT_PACKAGES_DIR}/debug/share/pkgconfig/zlib.pc" "${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/zlib.pc")
file(RENAME "${CURRENT_PACKAGES_DIR}/share/pkgconfig/zlib.pc" "${CURRENT_PACKAGES_DIR}/lib/pkgconfig/zlib.pc")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
