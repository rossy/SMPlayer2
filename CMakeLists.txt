cmake_minimum_required(VERSION 2.6)
include(cmake/Summary.cmake)

project(smplayer2)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)
find_program(QT_LRELEASE_EXECUTABLE NAMES lrelease PATHS ${QT_BINARY_DIR} NO_DEFAULT_PATH)
find_program(QT_LRELEASE_EXECUTABLE NAMES lrelease)

set(SMPLAYER2_VERSION_MAJOR 0)
set(SMPLAYER2_VERSION_MINOR 7)
set(SMPLAYER2_VERSION_RELEASE 0)
execute_process(COMMAND ${PROJECT_SOURCE_DIR}/version.sh
	OUTPUT_VARIABLE SMPLAYER2_VERSION_GITREV OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(SMPLAYER2_VERSION "${SMPLAYER2_VERSION_MAJOR}.${SMPLAYER2_VERSION_MINOR}.${SMPLAYER2_VERSION_RELEASE}${SMPLAYER2_VERSION_GITREV}")

if (CMAKE_COMPILER_IS_GNUCXX)
	add_definitions("-Wall -pedantic -std=c++0x")
endif()

add_definitions(-DSMPLAYER2_VERSION=\"${SMPLAYER2_VERSION}\")

find_package(Qt COMPONENTS QtNetwork QtXml REQUIRED)
find_package(ZLIB REQUIRED)
find_package(Quazip)
set(QT_USE_QTNETWORK TRUE)
set(QT_USE_QTXML TRUE)

if (QUAZIP_FOUND)
	option(ENABLE_DOWNLOAD_SUBS "Enable subtitle downloader (requires QuaZip)" ON)
	option(QUAZIP_STATIC "Enable this if QuaZip has been built as a static library" OFF)
endif()

if(ENABLE_DOWNLOAD_SUBS AND QUAZIP_FOUND)
	set(HAVE_DOWNLOAD_SUBS ON)
	if (QUAZIP_STATIC)
		add_definitions(-DQUAZIP_STATIC)
	endif()
endif()

add_subdirectory(src)

summary_add("Subtitle downloader" HAVE_DOWNLOAD_SUBS)
summary_show()

install(FILES icons/smplayer2_icon16.png
	DESTINATION share/icons/hicolor/16x16/apps/
	RENAME application-x-smplayer2.png
)
install(FILES icons/smplayer2_icon22.png
	DESTINATION share/icons/hicolor/22x22/apps/
	RENAME application-x-smplayer2.png
)
install(FILES icons/smplayer2_icon32.png
	DESTINATION share/icons/hicolor/32x32/apps/
	RENAME application-x-smplayer2.png
)
install(FILES icons/smplayer2_icon64.png
	DESTINATION share/icons/hicolor/64x64/apps/
	RENAME application-x-smplayer2.png
)
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
