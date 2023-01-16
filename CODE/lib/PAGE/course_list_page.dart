// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "course_list_state.dart";

// -- TYPES

class COURSE_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    final APPLICATION_STATE
        ApplicationState;
    final DATA
        Data;

    // -- CONSTRUCTORS

    COURSE_LIST_PAGE(
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
    COURSE_LIST_STATE createState(
        )
    {
        return COURSE_LIST_STATE();
    }
}
