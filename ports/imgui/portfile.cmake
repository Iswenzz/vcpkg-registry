if("docking-experimental" IN_LIST FEATURES)
	vcpkg_from_github(
		OUT_SOURCE_PATH SOURCE_PATH
		REPO ocornut/imgui
		REF a1b60fc1f5589d498ab1080c2572da725fcbd0e3
		SHA512 ac6117f6adf9418af3a2db5392f1316be50a94c38e78cd1eadc0e0a71dfbb5536507aaf4d9d3b3468b5a30ebf143b806e2774f274e2098e1217ed93080fe81c7
		HEAD_REF docking
	)
else()
	vcpkg_from_github(
		OUT_SOURCE_PATH SOURCE_PATH
		REPO ocornut/imgui
		REF v${VERSION}
		SHA512 42021b06b611b58222b09fab8db2c34e992c3dc4fbaa175e09833c66c90d04b4a4e7def16a732535335c0ac5ff014d235835511a5d9a76d32b4395b302146919
		HEAD_REF master
	)
endif()

file(COPY "${CMAKE_CURRENT_LIST_DIR}/imgui-config.cmake.in" DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
	FEATURES
	allegro5-binding            IMGUI_BUILD_ALLEGRO5_BINDING
	dx9-binding                 IMGUI_BUILD_DX9_BINDING
	dx10-binding                IMGUI_BUILD_DX10_BINDING
	dx11-binding                IMGUI_BUILD_DX11_BINDING
	dx12-binding                IMGUI_BUILD_DX12_BINDING
	glfw-binding                IMGUI_BUILD_GLFW_BINDING
	glut-binding                IMGUI_BUILD_GLUT_BINDING
	metal-binding               IMGUI_BUILD_METAL_BINDING
	opengl2-binding             IMGUI_BUILD_OPENGL2_BINDING
	opengl3-binding             IMGUI_BUILD_OPENGL3_BINDING
	osx-binding                 IMGUI_BUILD_OSX_BINDING
	sdl2-binding                IMGUI_BUILD_SDL2_BINDING
	sdl2-renderer-binding       IMGUI_BUILD_SDL2_RENDERER_BINDING
	vulkan-binding              IMGUI_BUILD_VULKAN_BINDING
	win32-binding               IMGUI_BUILD_WIN32_BINDING
	freetype                    IMGUI_FREETYPE
	freetype-lunasvg            IMGUI_FREETYPE_LUNASVG
	wchar32                     IMGUI_USE_WCHAR32
)

if("libigl-imgui" IN_LIST FEATURES)
	vcpkg_download_distfile(
		IMGUI_FONTS_DROID_SANS_H
		URLS https://raw.githubusercontent.com/libigl/libigl-imgui/c3efb9b62780f55f9bba34561f79a3087e057fc0/imgui_fonts_droid_sans.h
		FILENAME "imgui_fonts_droid_sans.h"
		SHA512 abe9250c9a5989e0a3f2285bbcc83696ff8e38c1f5657c358e6fe616ff792d3c6e5ff2fa23c2eeae7d7b307392e0dc798a95d14f6d10f8e9bfbd7768d36d8b31
	)
	file(INSTALL "${IMGUI_FONTS_DROID_SANS_H}" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
endif()

if("club" IN_LIST FEATURES)
	vcpkg_download_distfile(
		IMGUI_CLUB_MEMORY_EDITOR_H
		URLS https://raw.githubusercontent.com/ocornut/imgui_club/ea49dd3c6803088d50b496e3fe981501543b7cbc/imgui_memory_editor/imgui_memory_editor.h
		FILENAME "imgui_memory_editor.h"
		SHA512 61bf32f9c119096d9224bd5cbf3aa268e2dc0d16e3718815fe1ed8b1e5ec648b3a39bb290261d5395527e0de932a1dcf2fcab4d21aade690b033059c008d8a68
	)
	file(INSTALL "${IMGUI_CLUB_MEMORY_EDITOR_H}" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
endif()

if("markdown" IN_LIST FEATURES)
	vcpkg_download_distfile(
		IMGUI_MARKDOWN_H
		URLS https://raw.githubusercontent.com/juliettef/imgui_markdown/61a181bdb83f450f852f7cf5d1282d8cda1c0f57/imgui_markdown.h
		FILENAME "imgui_markdown.h"
		SHA512 66fc1f98d55852cd06d92934fa3fc926924608f24c773df931e380e98435c0c0b3565e06f28ca5fd0a2e509d05c9e2ede3b762f67af7bdaf5b73f09271750192
	)
	file(INSTALL "${IMGUI_MARKDOWN_H}" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
endif()

vcpkg_replace_string("${SOURCE_PATH}/imconfig.h" "//#define IMGUI_API __declspec( dllexport )" "#define IMGUI_API __declspec( dllexport )")

vcpkg_cmake_configure(
	SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS
		${FEATURE_OPTIONS}
	OPTIONS_DEBUG
		-DIMGUI_SKIP_HEADERS=ON
)
vcpkg_cmake_install()

vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/imconfig.h" "#define IMGUI_API __declspec( dllexport )" "#define IMGUI_API __declspec( dllimport )")
if("freetype" IN_LIST FEATURES)
	vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/imconfig.h" "//#define IMGUI_ENABLE_FREETYPE" "#define IMGUI_ENABLE_FREETYPE")
endif()
if("freetype-lunasvg" IN_LIST FEATURES)
	vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/imconfig.h" "//#define IMGUI_ENABLE_FREETYPE_LUNASVG" "#define IMGUI_ENABLE_FREETYPE_LUNASVG")
endif()
if("wchar32" IN_LIST FEATURES)
	vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/imconfig.h" "//#define IMGUI_USE_WCHAR32" "#define IMGUI_USE_WCHAR32")
endif()

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
