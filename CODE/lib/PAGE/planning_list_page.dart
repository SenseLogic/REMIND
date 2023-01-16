// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "planning_list_state.dart";

// -- TYPES

class PLANNING_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    PLANNING_LIST_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        ApplicationState = application_state,
        Data = data,
        super( key: UniqueKey() )
    {
    }

    // -- OPERATIONS

    @override
    PLANNING_LIST_STATE createState(
        )
    {
        return PLANNING_LIST_STATE();
    }
}
