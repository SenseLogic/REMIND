// -- IMPORTS

// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io';
import "package:flutter/material.dart";
import 'package:path_provider/path_provider.dart';
import "../DATA/data.dart";
import "application_state.dart";

// -- TYPES

class APPLICATION_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    DATA
        Data;
    APPLICATION_STATE?
        State;

    // -- CONSTRUCTORS

    APPLICATION_PAGE(
        ) :
        Data = DATA(),
        super( key: UniqueKey() )
    {
        Data.Initialize();

        getApplicationDocumentsDirectory().then(
            ( Directory directory )
            {
                Data.DocumentFolderPath = directory.path + "/";
            }
            );
    }

    // -- OPERATIONS

    @override
    APPLICATION_STATE createState(
        )
    {
        return APPLICATION_STATE();
    }
}
