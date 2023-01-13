// -- IMPORTS

// ignore_for_file: empty_constructor_bodies, non_constant_identifier_names, camel_case_types, avoid_renaming_method_parameters

import "package:flutter/material.dart";
import "../DATA/language.dart";
import "option_list_page.dart";

// -- TYPES

class OPTION_LIST_STATE extends State<OPTION_LIST_PAGE>
{
    // -- CONSTRUCTORS

    OPTION_LIST_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    Widget GetLanguageWidget(
        )
    {
        return Row(
            children: <Widget>[
                const SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<LANGUAGE>(
                            value: widget.Data.Language,
                            isExpanded: true,
                            onChanged:
                                ( LANGUAGE? language )
                                {
                                    widget.ApplicationState.setState(
                                        ()
                                        {
                                            if ( language != null )
                                            {
                                                widget.Data.SetLanguage( language );
                                            }
                                        }
                                        );
                                },
                            items: widget.Data.LanguageList.map<DropdownMenuItem<LANGUAGE>>(
                                ( LANGUAGE language )
                                {
                                    return DropdownMenuItem<LANGUAGE>(
                                        value: language,
                                        child: widget.Data.GetDropdownMenuText(
                                            widget.Data.GetText( language.Name )
                                            )
                                        );
                                }
                                ).toList()
                            )
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetColorWidget(
        )
    {
        return Row(
            children: <Widget>[
                const SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: Slider(
                        value: widget.Data.Hue,
                        min: 0.0,
                        max: 1.0,
                        onChanged:
                            ( double hue )
                            {
                                widget.ApplicationState.setState(
                                    ()
                                    {
                                        widget.Data.SetHue( hue );
                                    }
                                    );
                            }
                        )
                    )
                ]
            );
    }

    // ~~

    Widget GetFontSizeWidget(
        )
    {
        return Row(
            children: <Widget>[
                const SizedBox(
                    width: 15.0
                    ),
                Expanded(
                    child: Slider(
                        value: widget.Data.MediumFontSize,
                        min: 10.0,
                        max: 20.0,
                        onChanged:
                            ( double font_size )
                            {
                                widget.ApplicationState.setState(
                                    ()
                                    {
                                        widget.Data.SetFontSize( font_size );
                                    }
                                    );
                            }
                        )
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
        return Scaffold(
            appBar: AppBar(
                title: widget.Data.GetTitleText(
                    widget.Data.GetText( "OPTIONS" )
                    ),
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Language:" )
                                    ),
                                GetLanguageWidget(),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Color:" )
                                    ),
                                GetColorWidget(),
                                widget.Data.GetLabelText(
                                    widget.Data.GetText( "Font size:" )
                                    ),
                                GetFontSizeWidget()
                                ]
                            )
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }
}
