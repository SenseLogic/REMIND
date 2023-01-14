// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "view_state.dart";

class VIEW_MANAGER extends NavigatorObserver
{
    // -- ATTRIBUTES

    List<VIEW_STATE>
        ViewStateList;
    static VIEW_MANAGER
        Instance = VIEW_MANAGER();

    // -- CONSTRUCTORS

    VIEW_MANAGER(
        ) :
        ViewStateList = [],
        super()
    {
    }

    // -- OPERATIONS

    static VIEW_MANAGER GetInstance(
        )
    {
        return Instance;
    }

    // ~~

    void Add(
        VIEW_STATE view_state
        )
    {
        if ( !ViewStateList.contains( view_state ) )
        {
          ViewStateList.add( view_state );
        }
    }

    // ~~

    void Remove(
        VIEW_STATE view_state
        )
    {
        ViewStateList.remove( view_state );
    }

    // ~~

    void Refresh(
        )
    {
        VIEW_STATE
            view_state;

        for ( view_state in ViewStateList )
        {
            view_state.Refresh();
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
