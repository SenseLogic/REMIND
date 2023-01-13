// -- IMPORTS

// ignore_for_file: camel_case_types, non_constant_identifier_names, empty_constructor_bodies

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "option_list_state.dart";

// -- TYPES

class OPTION_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    OPTION_LIST_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        ApplicationState = application_state,
        Data = data,
        super()
    {
    }

    // -- OPERATIONS

    @override
    OPTION_LIST_STATE createState(
        )
    {
        return OPTION_LIST_STATE();
    }
}
