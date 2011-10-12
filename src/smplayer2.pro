TEMPLATE = app
LANGUAGE = C++

CONFIG += qt warn_on release

QT += network xml

RESOURCES = icons.qrc

INCLUDEPATH += findsubtitles videopreview mpcgui
DEPENDPATH += findsubtitles videopreview mpcgui

#DEFINES += USE_QXT

DEFINES += DOWNLOAD_SUBS

HEADERS += guiconfig.h \
	config.h \
	constants.h \
	version.h \
	global.h \
	paths.h \
	helper.h \
	colorutils.h \
	translator.h \
	subtracks.h \
	tracks.h \
	titletracks.h \
	discname.h \
	extensions.h \
	desktopinfo.h \
	myprocess.h \
	mplayerprocess.h \
	infoprovider.h \
	mplayerwindow.h \
	mediadata.h \
	audioequalizerlist.h \
	mediasettings.h \
	assstyles.h \
	filters.h \
	preferences.h \
	filesettingsbase.h \
	filesettings.h \
	filesettingshash.h \
	tvsettings.h \
	images.h \
	inforeader.h \
	deviceinfo.h \
	recents.h \
	urlhistory.h \
	core.h \
	logwindow.h \
	infofile.h \
	seekwidget.h \
	mytablewidget.h \
	shortcutgetter.h \
	actionseditor.h \
	filechooser.h \
	preferencesdialog.h \
	mycombobox.h \
	tristatecombo.h \
	languages.h \
	selectcolorbutton.h \
	prefwidget.h \
	prefgeneral.h \
	prefdrives.h \
	prefinterface.h \
	prefperformance.h \
	prefinput.h \
	prefsubtitles.h \
	prefadvanced.h \
	prefplaylist.h \
	preftv.h \
	filepropertiesdialog.h \
	playlist.h \
	playlistdock.h \
	verticaltext.h \
	eqslider.h \
	videoequalizer.h \
	audioequalizer.h \
	myslider.h \
	timeslider.h \
	inputdvddirectory.h \
	inputurl.h \
	myaction.h \
	myactiongroup.h \
	myserver.h \
	myclient.h \
	filedialog.h \
	about.h \
	errordialog.h \
	timedialog.h \
	findsubtitles/simplehttp.h \
	findsubtitles/osparser.h \
	findsubtitles/findsubtitlesconfigdialog.h \
	findsubtitles/findsubtitleswindow.h \
	videopreview/videopreview.h \
	videopreview/videopreviewconfigdialog.h \
	favorites.h \
	tvlist.h \
	favoriteeditor.h \
	basegui.h \
	baseguiplus.h \
	floatingwidget.h \
	widgetactions.h \
	toolbareditor.h \
	defaultgui.h \
	minigui.h \
	mpcgui/mpcgui.h \
	mpcgui/mpcstyles.h \
	smplayer2.h \
	clhelp.h


SOURCES	+= version.cpp \
	global.cpp \
	paths.cpp \
	helper.cpp \
	colorutils.cpp \
	translator.cpp \
	subtracks.cpp \
	tracks.cpp \
	titletracks.cpp \
	discname.cpp \
	extensions.cpp \
	desktopinfo.cpp \
	myprocess.cpp \
	mplayerprocess.cpp \
	infoprovider.cpp \
	mplayerwindow.cpp \
	mediadata.cpp \
	mediasettings.cpp \
	assstyles.cpp \
	filters.cpp \
	preferences.cpp \
	filesettingsbase.cpp \
	filesettings.cpp \
	filesettingshash.cpp \
	tvsettings.cpp \
	images.cpp \
	inforeader.cpp \
	deviceinfo.cpp \
	recents.cpp \
	urlhistory.cpp \
	core.cpp \
	logwindow.cpp \
	infofile.cpp \
	seekwidget.cpp \
	mytablewidget.cpp \
	shortcutgetter.cpp \
	actionseditor.cpp \
	filechooser.cpp \
	preferencesdialog.cpp \
	mycombobox.cpp \
	tristatecombo.cpp \
	languages.cpp \
	selectcolorbutton.cpp \
	prefwidget.cpp \
	prefgeneral.cpp \
	prefdrives.cpp \
	prefinterface.cpp \
	prefperformance.cpp \
	prefinput.cpp \
	prefsubtitles.cpp \
	prefadvanced.cpp \
	prefplaylist.cpp \
	preftv.cpp \
	filepropertiesdialog.cpp \
	playlist.cpp \
	playlistdock.cpp \
	verticaltext.cpp \
	eqslider.cpp \
	videoequalizer.cpp \
	audioequalizer.cpp \
	myslider.cpp \
	timeslider.cpp \
	inputdvddirectory.cpp \
	inputurl.cpp \
	myaction.cpp \
	myactiongroup.cpp \
	myserver.cpp \
	myclient.cpp \
	filedialog.cpp \
	about.cpp \
	errordialog.cpp \
	timedialog.cpp \
	findsubtitles/simplehttp.cpp \
	findsubtitles/osparser.cpp \
	findsubtitles/findsubtitlesconfigdialog.cpp \
	findsubtitles/findsubtitleswindow.cpp \
	videopreview/videopreview.cpp \
	videopreview/videopreviewconfigdialog.cpp \
	favorites.cpp \
	tvlist.cpp \
	favoriteeditor.cpp \
	basegui.cpp \
	baseguiplus.cpp \
	floatingwidget.cpp \
	widgetactions.cpp \
	toolbareditor.cpp \
	defaultgui.cpp \
	minigui.cpp \
	mpcgui/mpcgui.cpp \
	mpcgui/mpcstyles.cpp \
	clhelp.cpp \
	smplayer2.cpp \
	main.cpp

#libqxt
contains(DEFINES, USE_QXT) {
	CONFIG  += qxt
	QXT     += core
}

FORMS = inputdvddirectory.ui logwindowbase.ui filepropertiesdialog.ui \
        eqslider.ui seekwidget.ui inputurl.ui \
        preferencesdialog.ui prefgeneral.ui prefdrives.ui prefinterface.ui \
        prefperformance.ui prefinput.ui prefsubtitles.ui prefadvanced.ui \
        prefplaylist.ui preftv.ui favoriteeditor.ui \
        about.ui errordialog.ui timedialog.ui \
        filechooser.ui \
        findsubtitles/findsubtitleswindow.ui findsubtitles/findsubtitlesconfigdialog.ui \
        videopreview/videopreviewconfigdialog.ui

TRANSLATIONS = translations/smplayer2_es.ts translations/smplayer2_de.ts \
               translations/smplayer2_sk.ts translations/smplayer2_it.ts \
               translations/smplayer2_fr.ts translations/smplayer2_zh_CN.ts \
               translations/smplayer2_ru_RU.ts translations/smplayer2_hu.ts \
               translations/smplayer2_en_US.ts translations/smplayer2_pl.ts \
               translations/smplayer2_ja.ts translations/smplayer2_nl.ts \
               translations/smplayer2_uk_UA.ts translations/smplayer2_pt_BR.ts \
               translations/smplayer2_ka.ts translations/smplayer2_cs.ts \
               translations/smplayer2_bg.ts translations/smplayer2_tr.ts \
               translations/smplayer2_sv.ts translations/smplayer2_sr.ts \
               translations/smplayer2_zh_TW.ts translations/smplayer2_ro_RO.ts \
               translations/smplayer2_pt.ts translations/smplayer2_el_GR.ts \
               translations/smplayer2_fi.ts translations/smplayer2_ko.ts \
               translations/smplayer2_mk.ts translations/smplayer2_eu.ts \
               translations/smplayer2_ca.ts translations/smplayer2_sl_SI.ts \
               translations/smplayer2_ar_SY.ts translations/smplayer2_ku.ts \
               translations/smplayer2_gl.ts translations/smplayer2_vi_VN.ts \
               translations/smplayer2_et.ts translations/smplayer2_lt.ts \
               translations/smplayer2_da.ts

contains( DEFINES, DOWNLOAD_SUBS ) {
	INCLUDEPATH += findsubtitles/filedownloader findsubtitles/quazip
	DEPENDPATH += findsubtitles/filedownloader findsubtitles/quazip

	HEADERS += filedownloader.h subchooserdialog.h
	SOURCES += filedownloader.cpp subchooserdialog.cpp

	FORMS += subchooserdialog.ui

	HEADERS += crypt.h \
	           ioapi.h \
	           quazip.h \
	           quazipfile.h \
	           quazipfileinfo.h \
	           quazipnewinfo.h \
	           unzip.h \
	           zip.h

	SOURCES += ioapi.c \
	           quazip.cpp \
	           quazipfile.cpp \
	           quazipnewinfo.cpp \
	           unzip.c \
	           zip.c

	LIBS += -lz
}

unix {
	UI_DIR = .ui
	MOC_DIR = .moc
	OBJECTS_DIR = .obj

	DEFINES += DATA_PATH=$(DATA_PATH)
	DEFINES += DOC_PATH=$(DOC_PATH)
	DEFINES += TRANSLATION_PATH=$(TRANSLATION_PATH)
	DEFINES += THEMES_PATH=$(THEMES_PATH)
	DEFINES += SHORTCUTS_PATH=$(SHORTCUTS_PATH)
	#DEFINES += NO_DEBUG_ON_CONSOLE

	#DEFINES += KDE_SUPPORT
	#INCLUDEPATH += /opt/kde3/include/
	#LIBS += -lkio -L/opt/kde3/lib/

	#contains( DEFINES, KDE_SUPPORT) {
	# HEADERS += mysystemtrayicon.h
	# SOURCES += mysystemtrayicon.cpp
	#}

	#HEADERS += prefassociations.h winfileassoc.h
	#SOURCES += prefassociations.cpp winfileassoc.cpp
	#FORMS += prefassociations.ui
}

win32 {
	DEFINES += SCREENSAVER_OFF
	contains( DEFINES, SCREENSAVER_OFF ) {
		HEADERS += screensaver.h
		SOURCES += screensaver.cpp
	}

	!contains( DEFINES, PORTABLE_APP ) {
		DEFINES += USE_ASSOCIATIONS
	}
	
	contains( DEFINES, USE_ASSOCIATIONS ) {
		HEADERS += prefassociations.h winfileassoc.h
		SOURCES += prefassociations.cpp winfileassoc.cpp
		FORMS += prefassociations.ui
	}

	contains(TEMPLATE,vcapp) {
		LIBS += ole32.lib user32.lib
	} else {
		LIBS += libole32
	}
	
	RC_FILE = smplayer2.rc
	DEFINES += NO_DEBUG_ON_CONSOLE
#	debug {
#		CONFIG += console
#	}
}

