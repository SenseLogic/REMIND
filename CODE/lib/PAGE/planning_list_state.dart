// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/planning.dart";
import "planning_list_page.dart";
import "planning_page.dart";

// -- TYPES

class PLANNING_LIST_STATE extends State<PLANNING_LIST_PAGE>
{
    // -- CONSTRUCTORS

    PLANNING_LIST_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    void RemovePlanning(
        BuildContext build_context,
        PLANNING planning
        )
    {
        if ( widget.Data.CanRemovePlanning( planning ) )
        {
            showDialog<bool>(
                context: build_context,
                builder:
                    ( BuildContext build_context )
                    {
                        return AlertDialog(
                            content: widget.Data.GetAlertText(
                                widget.Data.GetText( "Do you want to delete this planning?" )
                                ),
                            actions: <Widget>[
                                FlatButton(
                                    child: widget.Data.GetButtonText(
                                        widget.Data.GetText( "CANCEL" )
                                        ),
                                    onPressed:
                                        ()
                                        {
                                            Navigator.pop( context, false );
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
                                                    widget.Data.RemovePlanning( planning );
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
        else
        {
            showDialog<bool>(
                context: build_context,
                builder:
                    ( BuildContext build_context )
                    {
                        return AlertDialog(
                            title: widget.Data.GetTitleText(
                                widget.Data.GetText( "This planning can't be deleted because it is still used by a chapter." )
                                ),
                            actions: <Widget>[
                                FlatButton(
                                    child: widget.Data.GetButtonText(
                                        widget.Data.GetText( "CONTINUE" )
                                        ),
                                    onPressed:
                                        ()
                                        {
                                            Navigator.pop( context, false );
                                        }
                                    )
                            ]
                            );
                    }
                );
        }
    }

    // ~~

    Widget GetPlanningWidget(
        BuildContext build_context,
        PLANNING planning
        )
    {
        return Row(
            children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            widget.Data.GetMediumText(
                                widget.Data.GetPlanningName( planning )
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
                                                return PLANNING_PAGE(
                                                    widget.ApplicationState,
                                                    widget.Data,
                                                    planning
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
                                    widget.Data.MovePlanningDown( planning );
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
                                    widget.Data.MovePlanningUp( planning );
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
                            RemovePlanning( build_context, planning );
                        }
                    )
                ]
            );
    }

    // ~~

    Center GetNewPlanningWidget(
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
                                    widget.Data.GetAddedPlanning();
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
                    widget.Data.GetText( "PLANNINGS" )
                    )
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.Data.PlanningList.map<Widget>(
                                ( PLANNING planning )
                                {
                                    return GetPlanningWidget( build_context, planning );
                                }
                                ).toList()
                            ),
                        SizedBox(
                            height: 8.0
                            ),
                        GetNewPlanningWidget()
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
