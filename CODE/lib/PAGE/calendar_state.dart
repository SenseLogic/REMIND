// -- IMPORTS

// ignore_for_file: non_constant_identifier_names, camel_case_types, empty_constructor_bodies, avoid_renaming_method_parameters

import "package:flutter/material.dart";
import "../DATA/calendar.dart";
import "../DATA/calendar_chapter.dart";
import "../DATA/calendar_course.dart";
import "../DATA/calendar_spacing.dart";
import "../DATA/chapter.dart";
import "../DATA/course.dart";
import "../DATA/date.dart";
import "calendar_page.dart";
import "chapter_page.dart";
import "course_page.dart";

// -- TYPES

class CALENDAR_STATE extends State<CALENDAR_PAGE>
{
    // -- CONSTRUCTORS

    CALENDAR_STATE(
        ) :
        super()
    {
    }

    // -- INQUIRIES

    String GetDate(
        )
    {
        return widget.Data.Language.GetDate( widget.Data.CalendarDate );
    }

    // -- OPERATIONS

    Widget GetDateWidget(
        BuildContext build_context
        )
    {
        return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                widget.Data.GetColoredButton(
                    IconButton(
                        icon: const Icon(
                            Icons.remove,
                            size: 32.0
                            ),
                        onPressed:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        widget.Data.DecreaseCalendarDate();
                                    }
                                    );
                            }
                        )
                    ),
                Expanded(
                    child: GestureDetector(
                        child: Center(
                            child: widget.Data.GetPaddedBoxedButton(
                                widget.Data.GetLargeText(
                                    GetDate()
                                    )
                                )
                            ),
                        onTap:
                            ()
                            {
                                showDatePicker(
                                    context: build_context,
                                    initialDate: widget.Data.CalendarDate.GetDateTime(),
                                    firstDate: DateTime( widget.Data.CalendarDate.Year - 5, 1 ),
                                    lastDate: DateTime( widget.Data.CalendarDate.Year + 5, 12 )
                                    ).then(
                                        ( DateTime? date_time )
                                        {
                                            if ( date_time != null )
                                            {
                                                setState(
                                                    ()
                                                    {
                                                        widget.Data.CalendarDate = DATE.FromDateTime( date_time );
                                                    }
                                                    );
                                            }
                                        }
                                        );
                            }
                        )
                    ),
                widget.Data.GetColoredButton(
                    IconButton(
                        icon: const Icon(
                            Icons.add,
                            size: 32.0
                            ),
                        onPressed:
                            ()
                            {
                                setState(
                                    ()
                                    {
                                        widget.Data.IncreaseCalendarDate();
                                    }
                                    );

                            }
                            )
                        )
                ]
            );
    }

    // ~~

    Widget GetCourseWidget(
        BuildContext build_context,
        COURSE course
        )
    {
        return Row(
            children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedBoxedButton(
                            Row(
                                children: <Widget>[
                                    Expanded(
                                        child: widget.Data.GetMediumText(
                                            widget.Data.GetCourseName( course ),
                                            font_weight: FontWeight.bold
                                            )
                                        )
                                    ]
                                )
                            ),
                        onTap:
                            ()
                            {
                                Navigator.of( build_context ).push(
                                    MaterialPageRoute<dynamic>(
                                        builder:
                                            ( BuildContext build_context )
                                            {
                                                return COURSE_PAGE(
                                                    widget.ApplicationState,
                                                    widget.Data,
                                                    course
                                                    );
                                            }
                                        )
                                    );
                            }
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetCalendarSpacingWidget(
        List<CALENDAR_SPACING> calendar_spacing_list
        )
    {
        return RichText(
            text: TextSpan(
                children: calendar_spacing_list.map<TextSpan>(
                    ( CALENDAR_SPACING calendar_spacing )
                    {
                        return TextSpan(
                            text: calendar_spacing.GetText() + " ",
                            style: widget.Data.GetMediumTextStyle(
                                color: calendar_spacing.IsLate ? Colors.red : Colors.grey,
                                font_weight: calendar_spacing.IsNext ? FontWeight.normal : FontWeight.bold
                                )
                            );
                    }
                    ).toList()
                )
            );
    }
    
    // ~~

    void AddRepetition(
        BuildContext build_context,
        CHAPTER chapter
        )
    {
        showDatePicker(
            context: build_context,
            initialDate: widget.Data.CalendarDate.GetDateTime(),
            firstDate: chapter.Date.GetDateTime(),
            lastDate: widget.Data.CalendarDate.GetSum( 365 ).GetDateTime()
            ).then(
                ( DateTime? date_time )
                {
                    if ( date_time != null )
                    {
                        setState(
                            ()
                            {
                                chapter.AddRepetition( DATE.FromDateTime( date_time ) );
                            }
                            );
                    }
                }
                );
    }

    // ~~

    Widget GetChapterWidget(
        BuildContext build_context,
        COURSE course,
        CHAPTER chapter,
        CALENDAR_CHAPTER calendar_chapter
        )
    {
        return Column(
            children: <Widget>[
              const SizedBox(
                    height: 8.0
                    ),
                Row(
                    children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                                child: widget.Data.GetPaddedColoredButton(
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                            widget.Data.GetMediumText(
                                                widget.Data.GetChapterName( chapter )
                                                ),
                                          const SizedBox( height: 4.0 ),
                                            GetCalendarSpacingWidget( calendar_chapter.SpacingList )
                                            ]
                                        )
                                    ),
                                onTap:
                                    ()
                                    {
                                        Navigator.of( build_context ).push(
                                            MaterialPageRoute<dynamic>(
                                                builder:
                                                    ( BuildContext build_context )
                                                    {
                                                        return CHAPTER_PAGE(
                                                            widget.ApplicationState,
                                                            widget.Data,
                                                            course,
                                                            chapter
                                                            );
                                                    }
                                                )
                                            );
                                    },
                                onLongPress:
                                ()
                                {
                                    AddRepetition( build_context, chapter );
                                }
                                )
                            ),
                        GestureDetector(
                            child: widget.Data.GetPaddedIcon(
                                const Icon( Icons.check )
                                ),
                            onTap:
                                ()
                                {
                                    setState(
                                        ()
                                        {
                                            AddRepetition( build_context, chapter );
                                        }
                                        );
                                }
                            )
                        ]
                    )
                ]
            );
    }

    // ~~

    @override
    Widget build(
        BuildContext build_context
        )
    {
        CALENDAR
            calendar;

        calendar = widget.Data.GetCalendar();

        return Scaffold(
            appBar: AppBar(
                title: widget.Data.GetTitleText(
                    widget.Data.GetText( "CALENDAR" )
                    )
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        GetDateWidget( build_context ),
                        Column(
                            children: calendar.CourseList.map<Widget>(
                                ( CALENDAR_COURSE calendar_course )
                                {
                                    List<Widget>
                                        widget_list;

                                    widget_list = <Widget>[
                                        const SizedBox(
                                            height: 8.0
                                            ),
                                        GetCourseWidget( build_context, calendar_course.Course! )
                                        ];

                                    widget_list.addAll(
                                        calendar_course.ChapterList.map<Widget>(
                                            ( CALENDAR_CHAPTER calendar_chapter )
                                            {
                                                return GetChapterWidget(
                                                    build_context,
                                                    calendar_course.Course!,
                                                    calendar_chapter.Chapter!,
                                                    calendar_chapter
                                                    );
                                            }
                                            ).toList()
                                        );

                                    return Column(
                                        children: widget_list
                                        );
                                }
                                ).toList()
                            )
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
