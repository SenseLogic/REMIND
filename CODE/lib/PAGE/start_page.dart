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

    APPLICATION_STATE
        ApplicationState;

    // -- CONSTRUCTORS

    START_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        ApplicationState = application_state,
        super()
    {

        Timer.periodic(
            Duration( milliseconds: 100 ),
            ( Timer timer )
            {
                if ( data.DocumentFolderPath != null )
                {
                    timer.cancel();

                    data.Load();
                    data.BuildBackupList();

                    ApplicationState.SetPageIndex( null, PAGE_INDEX.Calendar );
                }
            }
            );
    }

    // -- OPERATIONS

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
