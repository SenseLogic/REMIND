// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/chapter.dart";
import "../DATA/status.dart";
import "chapter_page.dart";
import "course_page.dart";

// -- TYPES

class COURSE_STATE extends State<COURSE_PAGE>
{
    // -- ATTRIBUTES

    TextEditingController?
        NameTextEditingController;

    // -- CONSTRUCTORS

    COURSE_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    @override
    void initState(
        )
    {
        super.initState();

        NameTextEditingController = TextEditingController( text: widget.Course.Name );
    }

    // ~~

    Widget GetNameWidget(
        )
    {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                const SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: TextField(
                        maxLines: null,
                        decoration: widget.Data.GetInputDecoration(),
                        controller: NameTextEditingController,
                        onChanged:
                            ( String text )
                            {
                                widget.Course.Name = text;
                            }
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetStatusWidget(
        )
    {
        return Row(
            children: <Widget>[
                const SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<STATUS>(
                            value: widget.Course.Status,
                            isExpanded: true,
                            items: <DropdownMenuItem<STATUS>>[
                                DropdownMenuItem<STATUS>(
                                    value: STATUS.Active,
                                    child: widget.Data.GetPaddedColoredButton(
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    child: widget.Data.GetMediumText(
                                                        widget.Data.GetText( "Active (course)" )
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    ),
                                DropdownMenuItem<STATUS>(
                                    value: STATUS.Inactive,
                                    child: widget.Data.GetPaddedColoredButton(
                                        Row(
                                            children: <Widget>[
                                                Expanded(
                                                    child: widget.Data.GetMediumText(
                                                        widget.Data.GetText( "Inactive (course)" )
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    )
                                ],
                            onChanged:
                                ( STATUS? status )
                                {
                                    setState(
                                        ()
                                        {
                                            if ( status != null )
                                            {
                                                widget.Course.Status = status;
                                            }
                                        }
                                        );
                                }
                            )
                        )
                    )
                ]
            );
    }

    // ~~

    void RemoveChapter(
        BuildContext build_context,
        CHAPTER chapter
        )
    {
        showDialog<bool>(
            context: build_context,
            builder:
                ( BuildContext build_context )
                {
                    return AlertDialog(
                        title: widget.Data.GetAlertText(
                            widget.Data.GetText( "Do you want to delete this chapter?" )
                            ),
                        actions: <Widget>[
                            TextButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "CANCEL" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        Navigator.pop( context, false );
                                    }
                                ),
                            TextButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "DELETE" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        setState(
                                            ()
                                            {
                                                widget.Course.RemoveChapter( chapter );
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

    Widget GetChapterWidget(
        BuildContext build_context,
        CHAPTER chapter
        )
    {
        return Row(
            children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            widget.Data.GetMediumText(
                                widget.Data.GetChapterName( chapter )
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
                                                    widget.Course,
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
                        const Icon( Icons.arrow_downward )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Course.MoveChapterDown( chapter );
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        const Icon( Icons.arrow_upward )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Course.MoveChapterUp( chapter );
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        const Icon( Icons.delete )
                        ),
                    onTap:
                        ()
                        {
                            RemoveChapter( build_context, chapter );
                        }
                    )
                ]
            );
    }

    // ~~

    Center GetNewChapterWidget(
        )
    {
        return Center(
            child: widget.Data.GetColoredButton(
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
                                    widget.Course.GetAddedChapter( widget.Data );
                                }
                                );
                        }
                    )
                )
            );
    }

    // ~~

    @override
    Widget build(
        BuildContext build_context
        )
    {
        return Scaffold(
            appBar: AppBar(
                title: widget.Data.GetTitleText(
                    widget.Data.GetText( "COURSE" )
                    )
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Name:" )
                                    ),
                                const SizedBox(
                                    height: 8.0
                                    ),
                                GetNameWidget(),
                                const SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Status:" )
                                    ),
                                const SizedBox(
                                    height: 8.0
                                    ),
                                GetStatusWidget(),
                                const SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Chapters:" )
                                    ),
                                const SizedBox(
                                    height: 8.0
                                    ),
                                Column(
                                    children: widget.Course.ChapterList.map<Widget>(
                                        ( CHAPTER chapter )
                                        {
                                            return GetChapterWidget( build_context, chapter );
                                        }
                                        ).toList()
                                    ),
                                const SizedBox(
                                    height: 8.0
                                    ),
                                GetNewChapterWidget()
                                ]
                            )
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
