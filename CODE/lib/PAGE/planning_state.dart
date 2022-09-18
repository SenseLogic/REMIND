// -- IMPORTS

import "dart:math";
import "package:flutter/material.dart";
import "../DATA/spacing.dart";
import "planning_page.dart";

// -- TYPES

class PLANNING_STATE extends State<PLANNING_PAGE>
{
    // -- ATTRIBUTES

    TextEditingController?
        NameTextEditingController;

    // -- CONSTRUCTORS

    PLANNING_STATE(
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

        NameTextEditingController = TextEditingController( text: widget.Planning.Name );
    }

    // ~~

    Widget GetNameWidget(
        )
    {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                SizedBox(
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
                                widget.Planning.Name = text;
                            }
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetSpacingWidget(
        SPACING spacing
        )
    {
        String
            spacing_value_text;
        TextEditingController
            text_editing_controller;

        spacing_value_text = spacing.GetValueText( widget.Data.Language );

        text_editing_controller
            = TextEditingController.fromValue(
                    TextEditingValue(
                        text: spacing_value_text,
                        selection: TextSelection.collapsed( offset: spacing_value_text.length )
                        )
                   );

        return Row(
            children: <Widget>[
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Transform.rotate(
                            angle: spacing.IsMultiplicative ? pi / 4 : 0.0,
                            child: Icon( Icons.add_circle_outline )
                            )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    if ( spacing.IsMultiplicative )
                                    {
                                        spacing.IsMultiplicative = false;
                                        spacing.Value ~/= 10;
                                    }
                                    else
                                    {
                                        spacing.IsMultiplicative = true;
                                        spacing.Value *= 10;
                                    }

                                    spacing.Fix();
                                }
                                );
                        }
                    ),
                Expanded(
                    child: TextField(
                        decoration: widget.Data.GetInputDecoration(),
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: spacing.IsMultiplicative,
                            signed : false
                            ),
                        controller: text_editing_controller,
                        onChanged:
                            ( String text )
                            {
                                double
                                    text_real;
                                int
                                    text_integer;

                                if ( spacing.IsMultiplicative )
                                {
                                    text_real = double.parse( text.replaceAll( ",", "." ) );

                                    if ( text_real != null )
                                    {
                                        spacing.Value = ( text_real * 10.0 + 0.5 ).toInt();
                                    }
                                }
                                else
                                {
                                    text_integer = int.parse( text );

                                    if ( text_integer != null )
                                    {
                                        spacing.Value = text_integer;
                                    }
                                }

                                spacing.Fix();
                            }
                        )
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.remove )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    spacing.Value -= 1;
                                    spacing.Fix();
                                }
                                );
                        }
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        Icon( Icons.add )
                        ),
                    onTap:
                        ()
                        {
                            setState(
                                ()
                                {
                                    spacing.Value += 1;
                                    spacing.Fix();
                                }
                                );
                        }
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
                                    widget.Planning.MoveSpacingDown( spacing );
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
                                    widget.Planning.MoveSpacingUp( spacing );
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
                            setState(
                                ()
                                {
                                    widget.Planning.RemoveSpacing( spacing );
                                }
                                );
                        }
                    )
                ]
            );
    }

    // ~~

    Center GetNewSpacingWidget(
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
                                    if ( widget.Planning.SpacingList.isEmpty )
                                    {
                                        widget.Planning.AddSpacing( SPACING() );
                                    }
                                    else
                                    {
                                        widget.Planning.AddSpacing( SPACING.from( widget.Planning.SpacingList.last ) );
                                    }
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
                    widget.Data.GetText( "PLANNING" )
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
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetNameWidget(),
                                SizedBox(
                                    height: 8.0
                                    ),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Durations:" )
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                Column(
                                    children: widget.Planning.SpacingList.map<Widget>(
                                        ( SPACING spacing )
                                        {
                                            return GetSpacingWidget( spacing );
                                        }
                                        ).toList()
                                    ),
                                SizedBox(
                                    height: 8.0
                                    ),
                                GetNewSpacingWidget()
                                ]
                            )
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
