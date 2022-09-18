// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/course.dart";
import "../DATA/status.dart";
import "course_list_page.dart";
import "course_page.dart";

// -- TYPES

class COURSE_LIST_STATE extends State<COURSE_LIST_PAGE>
{
    // -- CONSTRUCTORS

    COURSE_LIST_STATE(
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
                                widget.Data.GetText( "Active courses" )
                                )
                            ),
                        PopupMenuItem<STATUS>(
                            value: STATUS.All,
                            child: widget.Data.GetMediumText(
                                widget.Data.GetText( "All courses" )
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
                        widget.Data.CourseStatus = status;
                    }
                    );
                }
            );
    }

    // ~~

    void RemoveCourse(
        BuildContext build_context,
        COURSE course
        )
    {
        showDialog<bool>(
            context: build_context,
            builder:
                ( BuildContext build_context )
                {
                    return AlertDialog(
                        title: widget.Data.GetAlertText(
                            widget.Data.GetText( "Do you want to delete this course?" )
                            ),
                        actions: <Widget>[
                            FlatButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "CANCEL" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        Navigator.pop( context, false);
                                    }
                                ),
                            FlatButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "DELETE" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        setState(
                                            ()
                                            {
                                                widget.Data.RemoveCourse( course );
                                            }
                                            );

                                        Navigator.pop( context, true );
                                    }
                                )
                        ]
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
                        child: widget.Data.GetPaddedColoredButton(
                            widget.Data.GetMediumText(
                                widget.Data.GetCourseName( course ),
                                color: widget.Data.GetStatusColor( course.Status )
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
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.delete )
                        ),
                    onTap:
                        ()
                        {
                            RemoveCourse( build_context, course );
                        }
                    )
                ]
            );
    }

    // ~~

    Center GetNewCourseWidget(
        )
    {
        return Center(
            child: widget.Data.GetColoredButton(
                IconButton(
                    icon: Icon(
                        Icons.add,
                        size: 32.0
                        ),
                    onPressed:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Data.GetAddedCourse();
                                }
                                );
                        }
                    )
                )
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
                    widget.Data.GetText( "COURSES" )
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
                            children: widget.Data.GetCourseListByStatus( widget.Data.CourseStatus ).map<Widget>(
                                ( COURSE course )
                                {
                                    return GetCourseWidget( build_context, course );
                                }
                                ).toList()
                            ),
                        SizedBox(
                            height: 8.0
                            ),
                        GetNewCourseWidget()
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
