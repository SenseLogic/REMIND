// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import 'dart:developer' as developer;

// -- TYPES

abstract class PAGE extends StatefulWidget with RouteAware
{
    // -- ATTRIBUTES

    BuildContext?
        BuildContext_;

    // -- CONSTRUCTORS

    PAGE(
        ) :
        super( key: UniqueKey() )
    {
    }

    // -- OPERATIONS

    void SetBuildContext(
        BuildContext build_context
        )
    {
developer.log('SetBuildContext', name: 'PAGE');
        BuildContext_ = build_context;
    }
    
    // ~~

    void RebuildElements(
        Element element
        )
    {
        void RebuildElement(
            Element element
            )
        {
            element.markNeedsBuild();
            element.visitChildren( RebuildElement );
        }

        element.visitChildren( RebuildElement );
    }
    
    // ~~

    @override
    void didPopNext(
        )
    {
developer.log('didPopNext', name: 'PAGE');
        if ( BuildContext_ != null )
        {
            RebuildElements( this as Element );
        }
    }
}
