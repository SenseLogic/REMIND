// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "page.dart";
import "application_state.dart";
import "course_list_state.dart";

// -- TYPES

class COURSE_LIST_PAGE extends PAGE
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    COURSE_LIST_PAGE(
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
    COURSE_LIST_STATE createState(
        )
    {
        return COURSE_LIST_STATE();
    }
}
