// -- IMPORTS

import 'dart:io';
import "package:flutter/material.dart";
import 'package:path_provider/path_provider.dart';
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

    void InitializeDocumentPath(
        )
    {
        getApplicationDocumentsDirectory().then(
            ( Directory directory )
            {
                Data.DocumentFolderPath = directory.path + "/";
            }
            );
    }

    // ~~

    @override
    APPLICATION_STATE createState(
        )
    {
        return APPLICATION_STATE();
    }
}
