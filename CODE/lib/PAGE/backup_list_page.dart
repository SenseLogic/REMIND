// -- IMPORTS

// ignore_for_file: non_constant_identifier_names, camel_case_types, empty_constructor_bodies

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "backup_list_state.dart";

// -- TYPES

class BACKUP_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    BACKUP_LIST_PAGE(
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
    BACKUP_LIST_STATE createState(
        )
    {
        return BACKUP_LIST_STATE();
    }
}
