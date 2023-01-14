// -- IMPORTS

// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies

import "calendar_chapter.dart";
import "calendar_spacing.dart";
import "chapter.dart";
import "data.dart";
import "date.dart";
import "json.dart";
import "planning.dart";
import "status.dart";

// -- TYPES

class COURSE
{
    // -- ATTRIBUTES

    int
        Identifier;
    String
        Name;
    STATUS
        Status;
    List<CHAPTER>
        ChapterList;

    // -- CONSTRUCTORS

    COURSE(
        ) :
        Identifier = 0,
        Name = "",
        Status = STATUS.Active,
        ChapterList = []
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
                "ChapterList" : ChapterList.map( ( chapter ) => chapter.toJson() ).toList()
            };
    }

    // ~~

    CHAPTER? GetChapterById(
        int id
        )
    {
        CHAPTER
            chapter;

        for ( chapter in ChapterList )
        {
            if ( chapter.Identifier == id )
            {
                return chapter;
            }
        }

        return null;
    }

    // ~~

    List<CALENDAR_CHAPTER> GetCalendarChapterList(
        DATE calendar_date,
        DATE current_date
        )
    {
        List<CALENDAR_CHAPTER>
            calendar_chapter_list;
        List<CALENDAR_SPACING>
            calendar_spacing_list;
        CALENDAR_CHAPTER
            calendar_chapter;
        CHAPTER
            chapter;

        calendar_chapter_list = [];

        for ( chapter in ChapterList )
        {
            if ( chapter.Status == STATUS.Active )
            {
                calendar_spacing_list = chapter.GetCalendarSpacingList( calendar_date );

                if ( calendar_spacing_list.isNotEmpty
                     && calendar_spacing_list.last.IsNext
                     && ( calendar_date.IsEqual( current_date )
                          || calendar_spacing_list.last.DelayDayCount == 0 ) )
                {
                    calendar_chapter = CALENDAR_CHAPTER();
                    calendar_chapter.Chapter = chapter;
                    calendar_chapter.SpacingList = calendar_spacing_list;
                    calendar_chapter_list.add( calendar_chapter );
                }
            }
        }

        return calendar_chapter_list;
    }

    // ~~

    List<CHAPTER> GetChapterListByStatus(
        STATUS status
        )
    {
        List<CHAPTER>
            chapter_list;
        CHAPTER
            chapter;

        chapter_list = [];

        for ( chapter in ChapterList )
        {
            if ( status == STATUS.All
                 || chapter.Status == status )
            {
                chapter_list.add( chapter );
            }
        }

        return chapter_list;
    }

    // -- OPERATIONS

    void SetChapterListFromJson(
        List<dynamic> json_dynamic_list,
        DATA data
        )
    {
        dynamic
            json_dynamic;
        CHAPTER
            chapter;

        ChapterList = [];

        for ( json_dynamic in json_dynamic_list )
        {
            chapter = CHAPTER();
            chapter.SetFromJson( json_dynamic, data );

            AddChapter( chapter );
        }
    }

    // ~~

    void SetFromJson(
        Map<String, dynamic> json_dynamic_map,
        DATA data
        )
    {
        Identifier = json_dynamic_map[ "Identifier" ];
        Name = json_dynamic_map[ "Name" ];
        Status = JSON.GetStatusFromText( json_dynamic_map[ "Status" ] );
        SetChapterListFromJson( json_dynamic_map[ "ChapterList" ], data );
    }

    // ~~

    void AddChapter(
        CHAPTER added_chapter
        )
    {
        ChapterList.add( added_chapter );
    }

    // ~~

    CHAPTER GetAddedChapter(
        DATA data
        )
    {
        CHAPTER
            added_chapter;
        PLANNING
            planning;

        if ( data.PlanningList.isEmpty )
        {
            planning = data.GetAddedPlanning();
            planning.AddAdditiveSpacing( 1 );
            planning.AddAdditiveSpacing( 7 );
            planning.AddAdditiveSpacing( 16 );
            planning.AddAdditiveSpacing( 35 );
            planning.AddMultiplicativeSpacing( 2.2 );
        }

        added_chapter = CHAPTER();
        added_chapter.Identifier = data.GetNextId();
        added_chapter.Planning = data.PlanningList.last;

        AddChapter( added_chapter );

        return added_chapter;
    }

    // ~~

    void RemoveChapter(
        CHAPTER removed_chapter
        )
    {
        ChapterList.removeWhere(
            ( chapter ) => identical( chapter, removed_chapter )
            );
    }

    // ~~

    void MoveChapterUp(
        CHAPTER chapter
        )
    {
        int
            chapter_index;
        CHAPTER
            prior_chapter;

        for ( chapter_index = 1;
              chapter_index < ChapterList.length;
              ++chapter_index )
        {
            if ( identical( ChapterList[ chapter_index ], chapter ) )
            {
                prior_chapter = ChapterList[ chapter_index - 1 ];

                ChapterList[ chapter_index - 1 ] = chapter;
                ChapterList[ chapter_index ] = prior_chapter;

                return;
            }
        }
    }

    // ~~

    void MoveChapterDown(
        CHAPTER chapter
        )
    {
        int
            chapter_index;
        CHAPTER
            next_chapter;

        for ( chapter_index = 0;
              chapter_index < ChapterList.length - 1;
              ++chapter_index )
        {
            if ( identical( ChapterList[ chapter_index ], chapter ) )
            {
                next_chapter = ChapterList[ chapter_index + 1 ];

                ChapterList[ chapter_index ] = next_chapter;
                ChapterList[ chapter_index + 1 ] = chapter;

                return;
            }
        }
    }
}
