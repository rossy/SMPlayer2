add_definitions(-DSMPLAYER2_VERSION=\"${SMPLAYER2_VERSION}\")
if(NOT WIN32)
	add_definitions(-DDATA_PATH=\"${CMAKE_INSTALL_PREFIX}/share/smplayer2\")
endif()

find_package(Qt4 REQUIRED QtCore QtGui QtNetwork QtXml)
find_package(ZLIB REQUIRED)
set(QT_USE_QTNETWORK TRUE)
set(QT_USE_QTXML TRUE)

include(${QT_USE_FILE})
add_definitions(${QT_DEFINITIONS})

set(smplayer2_SOURCES
	global.cpp
	paths.cpp
	helper.cpp
	colorutils.cpp
	translator.cpp
	subtracks.cpp
	tracks.cpp
	titletracks.cpp
	discname.cpp
	extensions.cpp
	desktopinfo.cpp
	myprocess.cpp
	mplayerprocess.cpp
	infoprovider.cpp
	mplayerwindow.cpp
	mediadata.cpp
	mediasettings.cpp
	assstyles.cpp
	filters.cpp
	preferences.cpp
	filesettingsbase.cpp
	filesettings.cpp
	filesettingshash.cpp
	tvsettings.cpp
	images.cpp
	inforeader.cpp
	deviceinfo.cpp
	recents.cpp
	urlhistory.cpp
	core.cpp
	logwindow.cpp
	infofile.cpp
	seekwidget.cpp
	mytablewidget.cpp
	shortcutgetter.cpp
	actionseditor.cpp
	filechooser.cpp
	preferencesdialog.cpp
	mycombobox.cpp
	tristatecombo.cpp
	languages.cpp
	selectcolorbutton.cpp
	prefwidget.cpp
	prefgeneral.cpp
	prefdrives.cpp
	prefinterface.cpp
	prefperformance.cpp
	prefinput.cpp
	prefsubtitles.cpp
	prefadvanced.cpp
	prefplaylist.cpp
	preftv.cpp
	filepropertiesdialog.cpp
	playlist.cpp
	playlistdock.cpp
	verticaltext.cpp
	eqslider.cpp
	videoequalizer.cpp
	audioequalizer.cpp
	myslider.cpp
	timeslider.cpp
	inputdvddirectory.cpp
	inputurl.cpp
	myaction.cpp
	myactiongroup.cpp
	myserver.cpp
	myclient.cpp
	filedialog.cpp
	about.cpp
	errordialog.cpp
	timedialog.cpp
	findsubtitles/simplehttp.cpp
	findsubtitles/osparser.cpp
	findsubtitles/findsubtitlesconfigdialog.cpp
	findsubtitles/findsubtitleswindow.cpp
	videopreview/videopreview.cpp
	videopreview/videopreviewconfigdialog.cpp
	favorites.cpp
	tvlist.cpp
	favoriteeditor.cpp
	basegui.cpp
	baseguiplus.cpp
	floatingwidget.cpp
	widgetactions.cpp
	toolbareditor.cpp
	defaultgui.cpp
	minigui.cpp
	mpcgui/mpcgui.cpp
	mpcgui/mpcstyles.cpp
	clhelp.cpp
	smplayer2.cpp
	main.cpp
)

set(smplayer2_HEADERS
	about.h
	actionseditor.h
	audioequalizer.h
	basegui.h
	baseguiplus.h
	core.h
	defaultgui.h
	eqslider.h
	errordialog.h
	favoriteeditor.h
	favorites.h
	filechooser.h
	findsubtitles/findsubtitlesconfigdialog.h
	findsubtitles/findsubtitleswindow.h
	findsubtitles/simplehttp.h
	filepropertiesdialog.h
	filters.h
	floatingwidget.h
	inforeader.h
	inputdvddirectory.h
	inputurl.h
	languages.h
	logwindow.h
	minigui.h
	mpcgui/mpcgui.h
	mpcgui/mpcstyles.h
	mplayerprocess.h
	mplayerwindow.h
	myactiongroup.h
	myprocess.h
	myserver.h
	myslider.h
	playlistdock.h
	playlist.h
	prefadvanced.h
	prefdrives.h
	preferencesdialog.h
	prefgeneral.h
	prefinput.h
	prefinterface.h
	prefperformance.h
	prefplaylist.h
	prefsubtitles.h
	preftv.h
	seekwidget.h
	selectcolorbutton.h
	shortcutgetter.h
	timedialog.h
	timeslider.h
	tristatecombo.h
	tvlist.h
	videoequalizer.h
	videopreview/videopreviewconfigdialog.h
	videopreview/videopreview.h
	widgetactions.h
)

set(smplayer2_FORMS
	inputdvddirectory.ui
	logwindowbase.ui
	filepropertiesdialog.ui
	eqslider.ui
	seekwidget.ui
	inputurl.ui
	preferencesdialog.ui
	prefgeneral.ui
	prefdrives.ui
	prefinterface.ui
	prefperformance.ui
	prefinput.ui
	prefsubtitles.ui
	prefadvanced.ui
	prefplaylist.ui
	preftv.ui
	favoriteeditor.ui
	about.ui
	errordialog.ui
	timedialog.ui
	filechooser.ui
	findsubtitles/findsubtitleswindow.ui
	findsubtitles/findsubtitlesconfigdialog.ui
	videopreview/videopreviewconfigdialog.ui
)

set(smplayer2_RESOURCES icons.qrc)
set(smplayer2_LIBS ${QT_LIBRARIES} ${ZLIB_LIBRARY})

if(HAVE_DOWNLOAD_SUBS)
	add_definitions(-DDOWNLOAD_SUBS)
	set(smplayer2_LIBS ${smplayer2_LIBS} ${QUAZIP_LIBRARY})
	set(smplayer2_HEADERS ${smplayer2_HEADERS}
		findsubtitles/filedownloader/filedownloader.h
		findsubtitles/subchooserdialog.h)
	set(smplayer2_SOURCES ${smplayer2_SOURCES}
		findsubtitles/filedownloader/filedownloader.cpp
		findsubtitles/subchooserdialog.cpp)
	set(smplayer2_FORMS ${smplayer2_FORMS}
		findsubtitles/subchooserdialog.ui)
endif()

if(WIN32)
	string(REPLACE "gcc" "windres" CMAKE_RC_COMPILER_INIT ${CMAKE_C_COMPILER})
	enable_language(RC)
	set(CMAKE_RC_COMPILE_OBJECT "<CMAKE_RC_COMPILER> -O coff -o <OBJECT> <SOURCE>")

	add_definitions(-DSCREENSAVER_OFF)
	add_definitions(-DUSE_ASSOCIATIONS)
	set(smplayer2_SOURCES ${smplayer2_SOURCES}
	screensaver.cpp
	prefassociations.cpp
	winfileassoc.cpp
	smplayer2.rc
	)
	set(smplayer2_HEADERS ${smplayer2_HEADERS}
	prefassociations.h
	)
	set(smplayer2_FORMS ${smplayer2_FORMS}
	prefassociations.ui
	)
endif()

set(LINGUAS "All" CACHE STRING "\"All\", a space-seperated list of translations to install with SMPlayer2, or \"None\".")
if (LINGUAS STREQUAL "All")
	file(GLOB smplayer2_LANGUAGES translations/*.ts)
else ()
if (NOT LINGUAS OR LINGUAS STREQUAL "None")
	set (smplayer2_LANGUAGES "")
else ()
	string(REGEX MATCHALL [a-zA-Z_]+
			langs ${LINGUAS})
	foreach(lang ${langs})
		list(APPEND langs translations/smplayer2_${lang}.ts)
	endforeach()
	file(GLOB smplayer2_LANGUAGES ${langs})
endif ()
endif ()

qt4_wrap_cpp(smplayer2_HEADERS_MOC ${smplayer2_HEADERS})
qt4_wrap_ui(smplayer2_FORMS_HEADERS ${smplayer2_FORMS})
qt4_add_translation(smplayer2_TRANSLATIONS ${smplayer2_LANGUAGES})
qt4_add_resources(smplayer2_RESOURCES_RCC ${smplayer2_RESOURCES})
add_custom_target(translations DEPENDS ${smplayer2_TRANSLATIONS})

add_executable(smplayer2 WIN32
	${smplayer2_SOURCES}
	${smplayer2_HEADERS_MOC}
	${smplayer2_FORMS_HEADERS}
	${smplayer2_RESOURCES_RCC}
)

add_dependencies(smplayer2 translations)
target_link_libraries(smplayer2 ${smplayer2_LIBS})
include_directories(${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})

install(TARGETS smplayer2 RUNTIME DESTINATION bin)
install(FILES ${smplayer2_TRANSLATIONS} DESTINATION share/smplayer2/translations)
