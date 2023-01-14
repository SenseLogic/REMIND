// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "dart:developer" as developer;
import "page_observer.dart";

// -- TYPES

abstract class PAGE extends StatefulWidget
{
    // -- CONSTRUCTORS

    PAGE(
        ) :
        super( key: UniqueKey() )
    {
    }

    // -- OPERATIONS

    void Refresh(
        )
    {
developer.log('Refresh', name: 'PAGE');
    }
}
