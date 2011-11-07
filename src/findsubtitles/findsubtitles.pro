TEMPLATE = app
LANGUAGE = C++

CONFIG += qt warn_on release

QT += network xml

INCLUDEPATH += ..
DEPENDPATH += ..

HEADERS += simplehttp.h \
           osparser.h \
           ../filechooser.h \
           ../languages.h \
           findsubtitlesconfigdialog.h \
           findsubtitleswindow.h

SOURCES += simplehttp.cpp \
           osparser.cpp \
           ../filechooser.cpp \
           ../languages.cpp \
           findsubtitlesconfigdialog.cpp \
           findsubtitleswindow.cpp \
           main.cpp

FORMS += ../filechooser.ui findsubtitleswindow.ui findsubtitlesconfigdialog.ui

DEFINES += NO_SMPLAYER_SUPPORT DOWNLOAD_SUBS

contains( DEFINES, DOWNLOAD_SUBS ) {
	INCLUDEPATH += filedownloader
	DEPENDPATH += filedownloader

	HEADERS += filedownloader.h subchooserdialog.h
	SOURCES += filedownloader.cpp subchooserdialog.cpp

	FORMS += subchooserdialog.ui


	LIBS += -lz
	
	win32 {
		INCLUDEPATH += c:\development\zlib-1.2.3
		LIBS += -Lc:\development\zlib-1.2.3
	}
}

unix {
  UI_DIR = .ui
  MOC_DIR = .moc
  OBJECTS_DIR = .obj
}

win32 {
  CONFIG += console
}

