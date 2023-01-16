// -- IMPORTS

import "dart:async";
import "package:flutter/material.dart";
import "../DATA/data.dart";
import "../DATA/page_index.dart";
import "application_state.dart";
import "start_state.dart";

// -- TYPES

class START_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    final APPLICATION_STATE
        ApplicationState;

    // -- CONSTRUCTORS

    START_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        ApplicationState = application_state,
        super( key: UniqueKey() )
    {

        Timer.periodic(
            const Duration( milliseconds: 100 ),
            ( Timer timer )
            {
                timer.cancel();

                data.Load();
                data.BuildBackupList();

                ApplicationState.SetPageIndex( null, PAGE_INDEX.Calendar );
            }
            );
    }

    // -- OPERATIONS

    @override
    START_STATE createState(
        )
    {
        return START_STATE();
    }

    // ~~

    void Exit(
        )
    {
    }
}
