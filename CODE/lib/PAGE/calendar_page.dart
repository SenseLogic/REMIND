// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "calendar_state.dart";

// -- TYPES

class CALENDAR_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    CALENDAR_PAGE(
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
    CALENDAR_STATE createState(
        )
    {
        return CALENDAR_STATE();
    }
}
