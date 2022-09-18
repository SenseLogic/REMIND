// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "../DATA/planning.dart";
import "application_state.dart";
import "planning_state.dart";

// -- TYPES

class PLANNING_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;
    PLANNING
        Planning;

    // -- CONSTRUCTORS

    PLANNING_PAGE(
        APPLICATION_STATE application_state,
        DATA data,
        PLANNING planning
        ) :
        ApplicationState = application_state,
        Data = data,
        Planning = planning,
        super()
    {
    }

    // -- OPERATIONS

    @override
    PLANNING_STATE createState(
        )
    {
        return PLANNING_STATE();
    }
}
