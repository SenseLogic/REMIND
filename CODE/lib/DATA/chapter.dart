// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "calendar_spacing.dart";
import "data.dart";
import "date.dart";
import "json.dart";
import "planning.dart";
import "status.dart";

// -- TYPES

class CHAPTER
{
    // -- ATTRIBUTES

    int
        Identifier;
    String
        Name;
    STATUS
        Status;
    PLANNING?
        Planning;
    DATE
        Date;
    int
        RepetitionCount,
        OffsetDayCount;

    // -- CONSTRUCTORS

    CHAPTER(
        ) :
        Identifier = 0,
        Name = "",
        Status = STATUS.Active,
        Planning = null,
        Date = DATE.GetCurrentDate(),
        RepetitionCount = 0,
        OffsetDayCount = 0
    {
    }

    // -- INQUIRIES

    Map<String, dynamic> toJson(
        )
    {
        return
            {
                "Identifier" : Identifier,
                "Name" : Name,
                "Status" : JSON.GetStatusText( Status ),
                "Planning" : Planning?.Identifier,
                "Date" : JSON.GetDateText( Date ),
                "RepetitionCount" : RepetitionCount,
                "OffsetDayCount" : OffsetDayCount
            };
    }

    // ~~

    DATE GetFirstDate(
        )
    {
        return Date.GetSum( OffsetDayCount );
    }

    // ~~

    DATE GetPriorDate(
        )
    {
        return Planning!.GetDate( GetFirstDate(), RepetitionCount );
    }

    // ~~

    DATE GetNextDate(
        )
    {
        return Planning!.GetDate( GetFirstDate(), RepetitionCount + 1 );
    }

    // ~~

    List<CALENDAR_SPACING> GetCalendarSpacingList(
        DATE calendar_date
        )
    {
        return Planning!.GetCalendarSpacingList(
            GetFirstDate(),
            RepetitionCount,
            0,
            RepetitionCount + 1,
            calendar_date
            );
    }

    // ~~

    List<CALENDAR_SPACING> GetCurrentSpacingList(
        )
    {
        return Planning!.GetCalendarSpacingList(
            GetFirstDate(),
            RepetitionCount,
            0,
            RepetitionCount,
            null
            );
    }

    // ~~

    List<CALENDAR_SPACING> GetNextSpacingList(
        int next_repetition_count
        )
    {
        return Planning!.GetCalendarSpacingList(
            GetFirstDate(),
            RepetitionCount,
            RepetitionCount,
            RepetitionCount + next_repetition_count,
            null
            );
    }

    // -- OPERATIONS

    void SetFromJson(
        Map<String, dynamic> json_dynamic_map,
        DATA data
        )
    {
        Identifier = json_dynamic_map[ "Identifier" ];
        Name = json_dynamic_map[ "Name" ];
        Status = JSON.GetStatusFromText( json_dynamic_map[ "Status" ] );
        Planning = data.GetPlanningById( json_dynamic_map[ "Planning" ] );
        Date = JSON.GetDateFromText( json_dynamic_map[ "Date" ] );
        RepetitionCount = json_dynamic_map[ "RepetitionCount" ];
        OffsetDayCount = json_dynamic_map[ "OffsetDayCount" ];
    }

    // ~~

    void AddRepetition(
        DATE date
        )
    {
        DATE
            next_date;

        next_date = GetNextDate();
        ++RepetitionCount;
        OffsetDayCount += Date.GetDifference( next_date );
    }
}
