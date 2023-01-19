// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";

// -- TYPES

class APPLICATION_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE?
        State;
    final DATA
        Data;

    // -- CONSTRUCTORS

    APPLICATION_PAGE(
        ) :
        Data = DATA(),
        super( key: UniqueKey() )
    {
        Data.Initialize();
    }

    // -- OPERATIONS

    @override
    APPLICATION_STATE createState(
        )
    {
        return APPLICATION_STATE();
    }
}
