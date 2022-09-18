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
