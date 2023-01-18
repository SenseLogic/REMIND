// -- IMPORTS

import "package:influx/influx.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "../DATA/page_index.dart";
import "application_page.dart";
import "backup_list_page.dart";
import "calendar_page.dart";
import "chapter_list_page.dart";
import "course_list_page.dart";
import "option_list_page.dart";
import "planning_list_page.dart";
import "start_page.dart";

// -- TYPES

class APPLICATION_STATE extends State<APPLICATION_PAGE> with SingleTickerProviderStateMixin, WidgetsBindingObserver implements View
{
    // -- CONSTRUCTORS

    APPLICATION_STATE(
        ) :
        super()
    {
    }

    // -- INQUIRIES

    Widget? GetView(
        )
    {
        switch ( widget.Data.PageIndex )
        {
            case PAGE_INDEX.Start : return START_PAGE( this, widget.Data );
            case PAGE_INDEX.Calendar : return CALENDAR_PAGE( this, widget.Data );
            case PAGE_INDEX.CourseList : return COURSE_LIST_PAGE( this, widget.Data );
            case PAGE_INDEX.ChapterList : return CHAPTER_LIST_PAGE( this, widget.Data );
            case PAGE_INDEX.PlanningList : return PLANNING_LIST_PAGE( this, widget.Data );
            case PAGE_INDEX.BackupList : return BACKUP_LIST_PAGE( this, widget.Data );
            case PAGE_INDEX.SettingList : return OPTION_LIST_PAGE( this, widget.Data );
        }
    }

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();
        WidgetsBinding.instance.addObserver( this );

        widget.InitializeDocumentPath();
    }

    // ~~

    @override void didChangeAppLifecycleState(
        AppLifecycleState state
        )
    {
        widget.Data.Save();
    }

    // ~~

    void SetPageIndex(
        BuildContext? build_context,
        PAGE_INDEX page_index
        )
    {
        setState(
            ()
            {
                if ( build_context != null )
                {
                    while ( Navigator.canPop( build_context ) )
                    {
                        Navigator.pop( build_context );
                    }
                }

                widget.Data.PageIndex = page_index;
            }
            );
    }

    // ~~

    Drawer GetDrawer(
        BuildContext build_context
        )
    {
        widget.Data.Save();

        return Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                    DrawerHeader(
                        decoration: BoxDecoration(
                            color: widget.Data.PrimaryColor
                            ),
                        child: Center(
                            child: Text(
                                "ReMind",
                                style: TextStyle(
                                    fontSize: 60.0,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                        Shadow(
                                            offset: const Offset( 1.0, 1.0 ),
                                            blurRadius: 2.0,
                                            color: widget.Data.AccentColor
                                            ),
                                        Shadow(
                                            offset: const Offset( -1.0, 1.0 ),
                                            blurRadius: 2.0,
                                            color: widget.Data.AccentColor
                                            ),
                                        Shadow(
                                            offset: const Offset( -1.0, -1.0 ),
                                            blurRadius: 2.0,
                                            color: widget.Data.AccentColor
                                            ),
                                        Shadow(
                                            offset: const Offset( 1.0, -1.0 ),
                                            blurRadius: 2.0,
                                            color: widget.Data.AccentColor
                                            )
                                        ]
                                    )
                                )
                            )
                        ),
                    ListTile(
                        leading: const Icon(
                            Icons.event_note,
                            size: 30.0,
                            color: Colors.black
                            ),
                        title: widget.Data.GetTitleText(
                            widget.Data.GetText( "CALENDAR" )
                            ),
                        onTap:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        SetPageIndex( build_context, PAGE_INDEX.Calendar );
                                    }
                                    );
                            }
                        ),
                    ListTile(
                        leading: const Icon(
                            Icons.account_balance,
                            size: 30.0,
                            color: Colors.black
                            ),
                        title: widget.Data.GetTitleText(
                            widget.Data.GetText( "COURSES" )
                            ),
                        onTap:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        SetPageIndex( build_context, PAGE_INDEX.CourseList );
                                    }
                                    );
                            }
                        ),
                    ListTile(
                        leading: const Icon(
                            Icons.local_library,
                            size: 30.0,
                            color: Colors.black
                            ),
                        title: widget.Data.GetTitleText(
                            widget.Data.GetText( "CHAPTERS" )
                            ),
                        onTap:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        SetPageIndex( build_context, PAGE_INDEX.ChapterList );
                                    }
                                    );
                            }
                        ),
                    ListTile(
                        leading: const Icon(
                            Icons.slow_motion_video,
                            size: 30.0,
                            color: Colors.black
                            ),
                        title: widget.Data.GetTitleText(
                            widget.Data.GetText( "PLANNINGS" )
                            ),
                        onTap:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        SetPageIndex( build_context, PAGE_INDEX.PlanningList );
                                    }
                                    );
                            }
                        ),
                    ListTile(
                        leading: const Icon(
                            Icons.archive,
                            size: 30.0,
                            color: Colors.black
                            ),
                        title: widget.Data.GetTitleText(
                            widget.Data.GetText( "BACKUPS" )
                            ),
                        onTap:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        SetPageIndex( build_context, PAGE_INDEX.BackupList );
                                    }
                                    );
                            }
                        ),
                    ListTile(
                        leading: const Icon(
                            Icons.settings,
                            size: 30.0,
                            color: Colors.black
                            ),
                        title: widget.Data.GetTitleText(
                            widget.Data.GetText( "OPTIONS" )
                            ),
                        onTap:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        SetPageIndex( build_context, PAGE_INDEX.SettingList );
                                    }
                                    );
                            }
                        )
                    ]
                )
            );
    }

    // ~~

    MaterialColor GetThemeColor(
        )
    {
        Color
            primary_color;

        primary_color = widget.Data.PrimaryColor;

        return MaterialColor(
            primary_color.value,
            <int, Color>{
                50: primary_color.withOpacity( 0.1 ),
                100: primary_color.withOpacity( 0.2 ),
                200: primary_color.withOpacity( 0.3 ),
                300: primary_color.withOpacity( 0.4 ),
                400: primary_color.withOpacity( 0.5 ),
                500: primary_color.withOpacity( 0.6 ),
                600: primary_color.withOpacity( 0.7 ),
                700: primary_color.withOpacity( 0.8 ),
                800: primary_color.withOpacity( 0.9 ),
                900: primary_color.withOpacity( 1.0 )
            }
            );
    }

    // ~~

    @override
    Widget build(
        BuildContext build_context
        )
    {
        ViewManager.instance.addView( this );

        widget.State = this;

        var theme_data
            = ThemeData.light();

        theme_data = theme_data.copyWith(
            colorScheme: ColorScheme.fromSwatch( primarySwatch: GetThemeColor() )
            );

        return MaterialApp(
            title: "ReMind",
            theme: theme_data,
            localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
                ],
            supportedLocales: widget.Data.LocaleList,
            locale: widget.Data.Locale_,
            navigatorObservers: <NavigatorObserver>[ ViewNavigatorObserver.instance ],
            home: GetView()
            );
    }
    // ~~

    @override
    void dispose(
        )
    {
        WidgetsBinding.instance.removeObserver(this);
        ViewManager.instance.removeView( this );

        super.dispose();
    }

    // ~~

    @override
    List<dynamic> getViewData(
        )
    {
        return [];
    }

    // ~~

    @override
    void updateView(
        )
    {
        setState( () {} );
    }
}
