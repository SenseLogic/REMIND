// -- IMPORTS

import "calendar_spacing.dart";
import "date.dart";
import "language.dart";
import "spacing.dart";

// -- TYPES

class PLANNING
{
    // -- ATTRIBUTES

    int
        Identifier;
    String
        Name;
    List<SPACING>
        SpacingList;

    // -- CONSTRUCTORS

    PLANNING(
        ) :
        Identifier = 0,
        Name = "",
        SpacingList = []
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
                "SpacingList" : SpacingList.map( ( spacing ) => spacing.toJson() ).toList()
            };
    }

    // ~~

    DATE GetDate(
        DATE first_date,
        int repetition_count
        )
    {
        int
            day_count,
            repetition_index;
        DATE
            date;
        SPACING?
            spacing;

        date = first_date;

        if ( SpacingList.isNotEmpty )
        {
            day_count = 0;

            for ( repetition_index = 0;
                  repetition_index < repetition_count;
                  ++repetition_index )
            {
                if ( repetition_index < SpacingList.length )
                {
                    spacing = SpacingList[ repetition_index ];
                }

                day_count = spacing!.GetDayCount( day_count );
                date = date.GetSum( day_count );
            }
        }

        return date;
    }

    // ~~

    List<CALENDAR_SPACING> GetCalendarSpacingList(
        DATE first_date,
        int repetition_count,
        int minimum_repetition_index,
        int maximum_repetition_count,
        DATE? calendar_date
        )
    {
        int
            day_count,
            repetition_index;
        DATE
            date;
        List<CALENDAR_SPACING>
            calendar_spacing_list;
        CALENDAR_SPACING
            calendar_spacing;
        SPACING?
            spacing;

        if ( SpacingList.isNotEmpty
             && ( calendar_date == null
                  || first_date.IsLower( calendar_date ) ) )
        {
            calendar_spacing_list = [];

            date = first_date;
            day_count = 0;
            repetition_index = 0;

            for ( repetition_index = 0;
                  repetition_index < maximum_repetition_count;
                  ++repetition_index )
            {
                if ( repetition_index < SpacingList.length )
                {
                    spacing = SpacingList[ repetition_index ];
                }

                day_count = spacing!.GetDayCount( day_count );
                date = date.GetSum( day_count );

                if ( calendar_date == null
                     || date.IsLowerEqual( calendar_date ) )
                {
                    if ( repetition_index >= minimum_repetition_index )
                    {
                        calendar_spacing = CALENDAR_SPACING();
                        calendar_spacing.DayCount = day_count;
                        calendar_spacing.Date = date;
                        calendar_spacing.IsNext = ( repetition_index >= repetition_count );

                        if ( repetition_index == repetition_count
                             && calendar_date != null
                             && date.IsLower( calendar_date ) )
                        {
                            calendar_spacing.IsLate = true;
                            calendar_spacing.DelayDayCount = calendar_date.GetDifference( date );
                        }

                        calendar_spacing_list.add( calendar_spacing );
                    }
                }
                else
                {
                    break;
                }
            }

            return calendar_spacing_list;
        }
        else
        {
            return [];
        }
    }

    // ~~

    String GetText(
        LANGUAGE language
        )
    {
        int
            spacing_index;
        StringBuffer
            string_buffer;

        string_buffer = StringBuffer();

        for ( spacing_index = 0;
              spacing_index < SpacingList.length;
              ++spacing_index )
        {
            string_buffer.write( SpacingList[ spacing_index].GetText( language ) );

            if ( spacing_index + 1 < SpacingList.length )
            {
                string_buffer.write( " " );
            }
        }

        return string_buffer.toString();
    }

    // -- OPERATIONS

    void SetSpacingListFromJson(
        List<dynamic> json_dynamic_list
        )
    {
        dynamic
            json_dynamic;
        SPACING
            spacing;

        SpacingList = [];

        for ( json_dynamic in json_dynamic_list )
        {
            spacing = SPACING();
            spacing.SetFromJson( json_dynamic );

            SpacingList.add( spacing );
        }
    }

    // ~~

    void SetFromJson(
        Map<String, dynamic> json_dynamic_map
        )
    {
        Identifier = json_dynamic_map[ "Identifier" ];
        Name = json_dynamic_map[ "Name" ];
        SetSpacingListFromJson( json_dynamic_map[ "SpacingList" ] );
    }

    // ~~

    void AddSpacing(
        SPACING spacing
        )
    {
        SpacingList.add( spacing );
    }

    // ~~

    void AddAdditiveSpacing(
        int value
        )
    {
        SPACING
            spacing;

        spacing = SPACING();
        spacing.Value = value;
        spacing.IsMultiplicative = false;

        SpacingList.add( spacing );
    }

    // ~~

    void AddMultiplicativeSpacing(
        double value
        )
    {
        SPACING
            spacing;

        spacing = SPACING();
        spacing.Value = ( value * 10.0 + 0.5 ).toInt();
        spacing.IsMultiplicative = true;

        SpacingList.add( spacing );
    }

    // ~~

    void RemoveSpacing(
        SPACING removed_spacing
        )
    {
        SpacingList.removeWhere(
            ( spacing ) => identical( spacing, removed_spacing )
            );
    }

    // ~~

    void MoveSpacingUp(
        SPACING spacing
        )
    {
        int
            spacing_index;
        SPACING
            prior_spacing;

        for ( spacing_index = 1;
              spacing_index < SpacingList.length;
              ++spacing_index )
        {
            if ( identical( SpacingList[ spacing_index ], spacing ) )
            {
                prior_spacing = SpacingList[ spacing_index - 1 ];

                SpacingList[ spacing_index - 1 ] = spacing;
                SpacingList[ spacing_index ] = prior_spacing;

                return;
            }
        }
    }

    // ~~

    void MoveSpacingDown(
        SPACING spacing
        )
    {
        int
            spacing_index;
        SPACING
            next_spacing;

        for ( spacing_index = 0;
              spacing_index < SpacingList.length - 1;
              ++spacing_index )
        {
            if ( identical( SpacingList[ spacing_index ], spacing ) )
            {
                next_spacing = SpacingList[ spacing_index + 1 ];

                SpacingList[ spacing_index ] = next_spacing;
                SpacingList[ spacing_index + 1 ] = spacing;

                return;
            }
        }
    }
}
