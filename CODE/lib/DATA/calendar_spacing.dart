// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "date.dart";

// -- TYPES

class CALENDAR_SPACING
{
    // -- ATTRIBUTES

    int
        DayCount;
    DATE?
        Date;
    bool
        IsNext,
        IsLate;
    int
        DelayDayCount;

    // -- CONSTRUCTORS

    CALENDAR_SPACING(
        ) :
        DayCount = 0,
        Date = null,
        IsNext = false,
        IsLate = false,
        DelayDayCount = 0
    {
    }

    // -- INQUIRIES

    String GetText(
        )
    {
        if ( DelayDayCount == 0 )
        {
            return DayCount.toString();
        }
        else
        {
            return "$DayCount+$DelayDayCount";
        }
    }
}
