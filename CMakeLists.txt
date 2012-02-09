cmake_minimum_required(VERSION 2.6)
include(cmake/Summary.cmake)

project(smplayer2)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)
find_program(QT_LRELEASE_EXECUTABLE NAMES lrelease PATHS ${QT_BINARY_DIR} NO_DEFAULT_PATH)
find_program(QT_LRELEASE_EXECUTABLE NAMES lrelease)

set(SMPLAYER2_VERSION_MAJOR 0)
set(SMPLAYER2_VERSION_MINOR 7)
set(SMPLAYER2_VERSION_RELEASE 1)
execute_process(COMMAND ${PROJECT_SOURCE_DIR}/version.sh WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	OUTPUT_VARIABLE SMPLAYER2_VERSION_GITREV OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(SMPLAYER2_VERSION "${SMPLAYER2_VERSION_MAJOR}.${SMPLAYER2_VERSION_MINOR}.${SMPLAYER2_VERSION_RELEASE}${SMPLAYER2_VERSION_GITREV}")

if (CMAKE_COMPILER_IS_GNUCXX)
	add_definitions("-Wall -pedantic -std=c++0x")
endif()

if (MINGW)
	add_definitions("-U__STRICT_ANSI__")
endif()

find_package(Quazip)
if (QUAZIP_FOUND)
	option(ENABLE_DOWNLOAD_SUBS "Enable subtitle downloader (requires QuaZip)" ON)
	option(QUAZIP_STATIC "Enable this if QuaZip has been built as a static library" OFF)
endif()

option(DEBUG_OUTPUT "Enable debug output on terminal" OFF)

if (ENABLE_DOWNLOAD_SUBS AND QUAZIP_FOUND)
	set(HAVE_DOWNLOAD_SUBS ON)
	if (QUAZIP_STATIC)
		add_definitions(-DQUAZIP_STATIC)
	endif()
endif()

if (NOT DEBUG_OUTPUT)
	add_definitions(-DNO_DEBUG_ON_CONSOLE)
endif()

add_subdirectory(src)
add_subdirectory(icons)

summary_add("Subtitle downloader" HAVE_DOWNLOAD_SUBS)
summary_show()

install(FILES smplayer2.desktop
	DESTINATION share/applications
)
install(FILES smplayer2_enqueue.desktop
	DESTINATION share/applications
)

# uninstall target
configure_file(
	"${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
	"${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
	IMMEDIATE @ONLY)

add_custom_target(uninstall
COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake)
