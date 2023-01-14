// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "page_state.dart";
import "dart:developer" as developer;

class PAGE_OBSERVER extends NavigatorObserver
{
    // -- ATTRIBUTES

    List<PAGE_STATE>
        PageStateList;
    static PAGE_OBSERVER?
        Instance;

    // -- CONSTRUCTORS

    PAGE_OBSERVER(
        ) :
        PageStateList = [],
        super()
    {
developer.log('PAGE_OBSERVER', name: 'PAGE_OBSERVER');
        Instance = this;
    }

    // -- OPERATIONS

    void AddState(
        PAGE_STATE page_state
        )
    {
developer.log('AddPage', name: 'PAGE_OBSERVER');
        if ( !PageStateList.contains( page_state ) )
        {
          PageStateList.add( page_state );
        }
    }

    // ~~

    void RemoveState(
        PAGE_STATE page_state
        )
    {
developer.log('RemovePage', name: 'PAGE_OBSERVER');
        PageStateList.remove( page_state );
    }

    // ~~

    @override
    void didPop(
        Route<dynamic> route, 
        Route<dynamic>? previousRoute
        )
    {
        PAGE_STATE
            page_state;

developer.log('didPop', name: 'PAGE_OBSERVER');
        for ( page_state in PageStateList )
        {
            page_state.Refresh();
        }

        super.didPop(route, previousRoute);
    }
}