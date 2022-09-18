// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/calendar_spacing.dart";
import "../DATA/chapter.dart";
import "../DATA/course.dart";
import "../DATA/status.dart";
import "chapter_list_page.dart";
import "chapter_page.dart";
import "course_page.dart";

// -- TYPES

class CHAPTER_LIST_STATE extends State<CHAPTER_LIST_PAGE>
{
    // -- CONSTRUCTORS

    CHAPTER_LIST_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    PopupMenuButton<STATUS> GetStatusWidget(
        BuildContext build_context
        )
    {
        return PopupMenuButton<STATUS>(
            itemBuilder:
                ( BuildContext build_context )
                {
                    return <PopupMenuItem<STATUS>>[
                        PopupMenuItem<STATUS>(
                            value: STATUS.Active,
                            child: widget.Data.GetMediumText(
                                widget.Data.GetText( "Active chapters" )
                                )
                            ),
                        PopupMenuItem<STATUS>(
                            value: STATUS.All,
                            child: widget.Data.GetMediumText(
                                widget.Data.GetText( "All chapters" )
                                )
                            ),
                        ];
                },
            onSelected:
                ( STATUS status )
                {
                    setState(
                    ()
                    {
                        widget.Data.ChapterStatus = status;
                    }
                    );
                }
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
                                            font_weight: FontWeight.bold,
                                            color: widget.Data.GetStatusColor( course.Status )
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
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.arrow_downward )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Data.MoveCourseDown( course );
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.arrow_upward )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Data.MoveCourseUp( course );
                                }
                                );
                        }
                    )
                ]
            );
    }

    // ~~

    Widget GetCalendarSpacingWidget(
        CHAPTER chapter
        )
    {
        return Row(
            children: <Widget>[
                Expanded(
                    child: RichText(
                        text: TextSpan(
                            children: chapter.GetCurrentSpacingList().map<TextSpan>(
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
                        )
                    ),
                widget.Data.GetMediumText(
                    widget.Data.Language.GetDate( chapter.GetNextDate() ),
                    color: Colors.grey
                    )
                ]
            );
    }

    // ~~

    Widget GetChapterWidget(
        BuildContext build_context,
        COURSE course,
        CHAPTER chapter
        )
    {
        return Column(
            children: <Widget>[
                SizedBox(
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
                                                widget.Data.GetChapterName( chapter ),
                                                color: widget.Data.GetStatusColor( chapter.Status )
                                                ),
                                            SizedBox(
                                                height: 4.0
                                                ),
                                            GetCalendarSpacingWidget( chapter )
                                            ]
                                        ),
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
                                    }
                                )
                            ),
                        GestureDetector(
                            child: widget.Data.GetPaddedIcon(
                                Icon( Icons.arrow_downward )
                                ),
                            onTap:
                                ()
                                {
                                    setState(
                                        ()
                                        {
                                            course.MoveChapterDown( chapter );
                                        }
                                        );
                                }
                            ),
                        GestureDetector(
                            child: widget.Data.GetPaddedIcon(
                                Icon( Icons.arrow_upward )
                                ),
                            onTap:
                                ()
                                {
                                    setState(
                                        ()
                                        {
                                            course.MoveChapterUp( chapter );
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

    Widget build(
        BuildContext build_context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: widget.Data.GetTitleText(
                    widget.Data.GetText( "CHAPTERS" )
                    ),
                actions: <Widget>[
                    GetStatusWidget( build_context )
                    ],
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        Column(
                            children: widget.Data.GetCourseListByStatus( widget.Data.ChapterStatus ).map<Widget>(
                                ( COURSE course )
                                {
                                    List<Widget>
                                        widget_list;

                                    widget_list = <Widget>[
                                        SizedBox(
                                            height: 8.0
                                            ),
                                        GetCourseWidget( build_context, course )
                                        ];

                                    widget_list.addAll(
                                        course.GetChapterListByStatus( widget.Data.ChapterStatus ).map<Widget>(
                                            ( CHAPTER chapter )
                                            {
                                                return GetChapterWidget( build_context, course, chapter );
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
