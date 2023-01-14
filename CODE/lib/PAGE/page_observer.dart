// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "package:flutter/material.dart";
import "page.dart";
import "dart:developer" as developer;

class PAGE_OBSERVER extends NavigatorObserver
{
    // -- ATTRIBUTES

    List<PAGE>
        PageList;
    static PAGE_OBSERVER?
        Instance;

    // -- CONSTRUCTORS

    PAGE_OBSERVER(
        ) :
        PageList = [],
        super()
    {
developer.log('PAGE_OBSERVER', name: 'PAGE_OBSERVER');
        Instance = this;
    }

    // -- OPERATIONS

    void AddPage(
        PAGE page
        )
    {
developer.log('AddPage', name: 'PAGE_OBSERVER');
        if ( !PageList.contains( page ) )
        {
            PageList.add(page);
        }
    }

    // ~~

    void RemovePage(
        PAGE page
        )
    {
developer.log('RemovePage', name: 'PAGE_OBSERVER');
        PageList.remove( page );
    }

    // ~~

    @override
    void didPop(
        Route<dynamic> route, 
        Route<dynamic>? previousRoute
        )
    {
        PAGE
            page;

developer.log('didPop', name: 'PAGE_OBSERVER');

        for ( page in PageList)
        {
            page.Refresh();
        }

        super.didPop(route, previousRoute);
    }
}