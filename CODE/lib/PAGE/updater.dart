// -- IMPORTS

import "package:flutter/material.dart";
import "updatable.dart";

// -- TYPES

class Updater extends NavigatorObserver
{
    // -- ATTRIBUTES

    static List<Updatable>
        updatableList = [];
    static Map<Updatable, Set<String>>
        updatableSourceSetMap = {};
    static Updater
        navigatorObserver = Updater();

    // -- CONSTRUCTORS

    Updater(
        ) :
        super();

    // -- OPERATIONS

    static void add(
        Updatable updatable,
        {
            List<String> sourceList = const []
        }
        )
    {
        if ( !updatableList.contains( updatable ) )
        {
            Set<String> sourceSet = {};

            for ( var source in sourceList )
            {
                sourceSet.add( source );
            }

            updatableList.add( updatable );
            updatableSourceSetMap[ updatable ] = sourceSet;
        }
    }

    // ~~

    static void remove(
        Updatable updatable
        )
    {
        updatableList.remove( updatable );
        updatableSourceSetMap.remove( updatable );
    }

    // ~~

    static void update(
        {
            List<String> sourceList = const []
        }
        )
    {
        if ( sourceList.isEmpty )
        {
            for ( var updatable in updatableList )
            {
                updatable.update();
            }
        }
        else
        {
            for ( var updatable in updatableList )
            {
                var updatableSourceSet = updatableSourceSetMap[ updatable ];

                if ( updatableSourceSet == null
                     || updatableSourceSet.isEmpty )
                {
                    updatable.update();
                }
                else
                {
                    for ( var source in sourceList )
                    {
                        if ( updatableSourceSet.contains( source ) )
                        {
                            updatable.update();

                            break;
                        }
                    }
                }
            }
        }
    }

    // ~~

    @override
    void didPop(
        Route<dynamic> route,
        Route<dynamic>? previousRoute
        )
    {
        update();

        super.didPop( route, previousRoute );
    }
}
