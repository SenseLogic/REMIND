// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "page_state.dart";

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
        Instance = this;
    }

    // -- OPERATIONS

    void AddState(
        PAGE_STATE page_state
        )
    {
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
        PageStateList.remove( page_state );
    }

    // ~~

    void Refresh(
        )
    {
        PAGE_STATE
            page_state;

        for ( page_state in PageStateList )
        {
            page_state.Refresh();
        }
    }

    // ~~

    @override
    void didPop(
        Route<dynamic> route, 
        Route<dynamic>? previousRoute
        )
    {
        Refresh();

        super.didPop(route, previousRoute);
    }
}