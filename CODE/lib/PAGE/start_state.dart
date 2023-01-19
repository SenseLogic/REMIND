// -- IMPORTS

import "package:flutter/material.dart";
import "start_page.dart";

// -- TYPES

class START_STATE extends State<START_PAGE>
{
    // -- CONSTRUCTORS

    START_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    @override
    Widget build(
        BuildContext build_context
        )
    {
        return Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                child: const Image(
                    image: AssetImage( "media/image/remind_logo.png" )
                    )
                )
            );
    }
}
