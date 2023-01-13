// -- IMPORTS

// ignore_for_file: non_constant_identifier_names

import "dart:convert";
import 'dart:io';
import "package:flutter/material.dart";
import "backup.dart";
import "calendar.dart";
import "calendar_chapter.dart";
import "calendar_course.dart";
import "chapter.dart";
import "course.dart";
import "danish_language.dart";
import "date.dart";
import "dutch_language.dart";
import "english_language.dart";
import "french_language.dart";
import "german_language.dart";
import "hsl_color.dart";
import "italian_language.dart";
import "japanese_language.dart";
import "json.dart";
import "korean_language.dart";
import "language.dart";
import "norwegian_language.dart";
import "page_index.dart";
import "planning.dart";
import "portuguese_language.dart";
import "spanish_language.dart";
import "status.dart";
import "swedish_language.dart";

// -- TYPES

class DATA
{
    // -- ATTRIBUTES

    int
        FileVersion;
    late double
        Hue;
    late Color
        PrimaryColor,
        AccentColor,
        ButtonColor,
        BoxColor,
        CanvasColor,
        BackgroundColor;
    late double
        FontSize,
        SmallFontSize,
        MediumFontSize,
        LargeFontSize,
        BigFontSize,
        HugeFontSize,
        GiantFontSize,
        ButtonFontSize,
        PagePadding,
        IconPadding,
        ButtonPadding,
        ButtonRadius;
    List<LANGUAGE>
        LanguageList;
    List<Locale>
        LocaleList;
    late LANGUAGE
        Language;
    late Locale
        Locale_;
    List<PLANNING>
        PlanningList;
    List<COURSE>
        CourseList;
    STATUS
        CourseStatus,
        ChapterStatus;
    DATE
        CalendarDate;
    int
        LastIdentifier;
    PAGE_INDEX
        PageIndex;
    List<BACKUP>
        BackupList;
    String
        JsonText;
    String
        DocumentFolderPath;

    // -- CONSTRUCTORS

    DATA(
        ) :
        FileVersion = 1,
        LanguageList = [],
        LocaleList = [
            const Locale( "en" ),
            const Locale( "ja" ),
            const Locale( "ko" ),
            const Locale( "de" ),
            const Locale( "fr" ),
            const Locale( "es" ),
            const Locale( "pt" ),
            const Locale( "it" ),
            const Locale( "nl" ),
            const Locale( "sv" ),
            const Locale( "nb" ),
            const Locale( "da" )
        ],
        PlanningList = [],
        CourseList = [],
        CourseStatus = STATUS.All,
        ChapterStatus = STATUS.All,
        CalendarDate = DATE.GetCurrentDate(),
        LastIdentifier = 0,
        PageIndex = PAGE_INDEX.Start,
        BackupList = [],
        JsonText = "",
        DocumentFolderPath = ""
    {
        SetHue( 0.5 );
        SetFontSize( 15.0 );

        LanguageList.add( ENGLISH_LANGUAGE() );
        LanguageList.add( JAPANESE_LANGUAGE() );
        LanguageList.add( KOREAN_LANGUAGE() );
        LanguageList.add( GERMAN_LANGUAGE() );
        LanguageList.add( FRENCH_LANGUAGE() );
        LanguageList.add( SPANISH_LANGUAGE() );
        LanguageList.add( PORTUGUESE_LANGUAGE() );
        LanguageList.add( ITALIAN_LANGUAGE() );
        LanguageList.add( DUTCH_LANGUAGE() );
        LanguageList.add( SWEDISH_LANGUAGE() );
        LanguageList.add( NORWEGIAN_LANGUAGE() );
        LanguageList.add( DANISH_LANGUAGE() );

        Language = LanguageList.first;
        Locale_ = LocaleList.first;
    }

    // -- INQUIRIES

    Map<String, dynamic> toJson(
        )
    {
        return
            {
                "FileVersion" : FileVersion,
                "Hue" : Hue,
                "FontSize" : FontSize,
                "Language" : Language.Name,
                "PlanningList" : PlanningList.map( ( planning ) => planning.toJson() ).toList(),
                "CourseList" : CourseList.map( ( course ) => course.toJson() ).toList(),
                "CourseStatus" : JSON.GetStatusText( CourseStatus ),
                "ChapterStatus" : JSON.GetStatusText( ChapterStatus ),
                "LastIdentifier" : LastIdentifier
            };
    }

    // ~~

    String GetJsonText(
        )
    {
        return jsonEncode( toJson() );
    }

    // ~~

    String GetIndentedJsonText(
        )
    {
        return JSON.GetIndentedText( jsonEncode( toJson() ) );
    }

    // ~~

    String GetText(
        String key
        )
    {
        return Language.GetText( key );
    }

    // ~~

    int GetLanguageIndex(
        LANGUAGE language
        )
    {
        int
            language_index;

        for ( language_index = 0;
              language_index < LanguageList.length;
              ++language_index )
        {
            if ( identical( LanguageList[ language_index ], language ) )
            {
                return language_index;
            }
        }

        return -1;
    }

    // ~~

    LANGUAGE? GetLanguageByName(
        String language_name
        )
    {
        LANGUAGE
            language;

        for ( language in LanguageList )
        {
            if ( language.Name == language_name )
            {
                return language;
            }
        }

        return null;
    }

    // ~~

    PLANNING? GetPlanningById(
        int planning_id
        )
    {
        PLANNING
            planning;

        for ( planning in PlanningList )
        {
            if ( planning.Identifier == planning_id )
            {
                return planning;
            }
        }

        return null;
    }

    // ~~

    COURSE? GetCourseById(
        int course_id
        )
    {
        COURSE
            course;

        for ( course in CourseList )
        {
            if ( course.Identifier == course_id )
            {
                return course;
            }
        }

        return null;
    }

    // ~~

    bool CanRemovePlanning(
        PLANNING planning
        )
    {
        CHAPTER
            chapter;
        COURSE
            course;

        for ( course in CourseList )
        {
            for ( chapter in course.ChapterList )
            {
                if ( identical( chapter.Planning, planning ) )
                {
                    return false;
                }
            }
        }

        return true;
    }

    // ~~

    CALENDAR GetCalendar(
        )
    {
        List<CALENDAR_CHAPTER>
            calendar_chapter_list;
        CALENDAR
            calendar;
        CALENDAR_COURSE
            calendar_course;
        COURSE
            course;

        calendar = CALENDAR();

        for ( course in CourseList )
        {
            if ( course.Status == STATUS.Active )
            {
                calendar_chapter_list = course.GetCalendarChapterList( CalendarDate, calendar.CurrentDate );

                if ( calendar_chapter_list.isNotEmpty )
                {
                    calendar_course = CALENDAR_COURSE();
                    calendar_course.Course = course;
                    calendar_course.ChapterList = calendar_chapter_list;

                    calendar.CourseList.add( calendar_course );
                }
            }
        }

        return calendar;
    }

    // ~~

    List<COURSE> GetCourseListByStatus(
        STATUS status
        )
    {
        List<COURSE>
            course_list;

        course_list = [];

        for ( var course in CourseList )
        {
            if ( status == STATUS.All
                 || course.Status == status )
            {
                course_list.add( course );
            }
        }

        return course_list;
    }

    // ~~

    String GetPlanningName(
        PLANNING planning
        )
    {
        if ( planning.Name.isEmpty )
        {
            if ( planning.SpacingList.isEmpty )
            {
                return GetText( "New planning" );
            }
            else
            {
                return planning.GetText( Language );
            }
        }
        else
        {
            return planning.Name;
        }
    }

    // ~~

    String GetCourseName(
        COURSE course
        )
    {
        if ( course.Name.isEmpty )
        {
            return GetText( "New course" );
        }
        else
        {
            return course.Name;
        }
    }

    // ~~

    String GetChapterName(
        CHAPTER chapter
        )
    {
        if ( chapter.Name.isEmpty )
        {
            return GetText( "New chapter" );
        }
        else
        {
            return chapter.Name;
        }
    }

    // ~~

    double GetColorBrightness(
        Color color
        )
    {
        double
            red,
            green,
            blue;

        red = color.red.toDouble() / 255.0;
        green = color.green.toDouble() / 255.0;
        blue = color.blue.toDouble() / 255.0;

        return 0.2 * red + 0.7 * green + 0.1 * blue;
    }

    // ~~

    Color GetPalerColor(
        Color color,
        double white_factor
        )
    {
        return Color.lerp( color, Colors.white, white_factor )!;
    }

    // ~~

    Color GetDarkerColor(
        Color color,
        double black_factor
        )
    {
        return Color.lerp( color, Colors.white, black_factor )!;
    }

    // ~~

    BoxDecoration GetButtonDecoration(
        )
    {
        return BoxDecoration(
            color: ButtonColor,
            borderRadius: BorderRadius.all( Radius.circular( ButtonRadius ) )
            );
    }

    // ~~

    BoxDecoration GetBoxedDecoration(
        )
    {
        return BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular( ButtonRadius ) ),
            border: Border.all(
                color: BoxColor,
                width: 1.0
                )
            );
    }

    // ~~

    InputDecoration GetInputDecoration(
        )
    {
        return InputDecoration(
            filled: true,
            fillColor: ButtonColor,
            contentPadding: EdgeInsets.all( ButtonPadding )
            );
    }

    // ~~

    Color GetStatusColor(
        STATUS status
        )
    {
        if ( status == STATUS.Inactive )
        {
            return Colors.grey;
        }
        else
        {
            return Colors.black;
        }
    }

    // ~~

    Widget GetPaddedIcon(
        Widget child
        )
    {
        return Container(
            padding: EdgeInsets.all( ButtonPadding ),
            child: child
            );
    }

    // ~~

    Widget GetPaddedButton(
        Widget child
        )
    {
        return Container(
            padding: EdgeInsets.all( ButtonPadding ),
            child: child
            );
    }

    // ~~

    Widget GetColoredButton(
        Widget child
        )
    {
        return Container(
            decoration: GetButtonDecoration(),
            child: child
            );
    }

    // ~~

    Widget GetPaddedColoredButton(
        Widget child
        )
    {
        return Container(
            padding: EdgeInsets.all( ButtonPadding ),
            decoration: GetButtonDecoration(),
            child: child
            );
    }

    // ~~

    Widget GetPaddedBoxedButton(
        Widget child
        )
    {
        return Container(
            padding: EdgeInsets.all( ButtonPadding ),
            decoration: GetBoxedDecoration(),
            child: child
            );
    }

    // ~~

    TextStyle GetSmallTextStyle(
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return TextStyle(
            color : color,
            fontSize: SmallFontSize,
            fontWeight : font_weight
            );
    }

    // ~~

    TextStyle GetMediumTextStyle(
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return TextStyle(
            color : color,
            fontSize: MediumFontSize,
            fontWeight : font_weight
            );
    }

    // ~~

    TextStyle GetLargeTextStyle(
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return TextStyle(
            color : color,
            fontSize: LargeFontSize,
            fontWeight : font_weight
            );
    }

    // ~~

    TextStyle GetBigTextStyle(
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return TextStyle(
            color : color,
            fontSize: BigFontSize,
            fontWeight : font_weight
            );
    }

    // ~~

    TextStyle GetHugeTextStyle(
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return TextStyle(
            color : color,
            fontSize: HugeFontSize,
            fontWeight : font_weight
            );
    }

    // ~~

    TextStyle GetGiantTextStyle(
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return TextStyle(
            color : color,
            fontSize: GiantFontSize,
            fontWeight : font_weight
            );
    }

    // ~~

    Text GetSmallText(
        String text,
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return Text(
            text,
            style: TextStyle(
                color : color,
                fontSize: SmallFontSize,
                fontWeight : font_weight
                )
            );
    }

    // ~~

    Text GetMediumText(
        String text,
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return Text(
            text,
            style: TextStyle(
                color : color,
                fontSize: MediumFontSize,
                fontWeight : font_weight
                )
            );
    }

    // ~~

    Text GetLargeText(
        String text,
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return Text(
            text,
            style: TextStyle(
                color : color,
                fontSize: LargeFontSize,
                fontWeight : font_weight
                )
            );
    }

    // ~~

    Text GetBigText(
        String text,
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return Text(
            text,
            style: TextStyle(
                color : color,
                fontSize: BigFontSize,
                fontWeight : font_weight
                )
            );
    }

    // ~~

    Text GetHugeText(
        String text,
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return Text(
            text,
            style: TextStyle(
                color : color,
                fontSize: HugeFontSize,
                fontWeight : font_weight
                )
            );
    }

    // ~~

    Text GetGiantText(
        String text,
        {
            color = Colors.black,
            font_weight = FontWeight.normal
        }
        )
    {
        return Text(
            text,
            style: TextStyle(
                color : color,
                fontSize: GiantFontSize,
                fontWeight : font_weight
                )
            );
    }

    // ~~

    Text GetLabelText(
        String text
        )
    {
        return GetMediumText(
            text,
            color: Colors.grey
            );
    }

    // ~~

    Text GetAlertText(
        String text
        )
    {
        return GetMediumText(
            text,
            font_weight: FontWeight.bold
            );
    }

    // ~~

    Text GetButtonText(
        String text
        )
    {
        return GetMediumText(
            text,
            font_weight: FontWeight.bold
            );
    }

    // ~~

    Text GetTitleText(
        String text
        )
    {
        return GetLargeText(
            text,
            font_weight: FontWeight.bold
            );
    }

    // ~~

    Widget GetDropdownMenuText(
        String text
        )
    {
        return Container(
            padding: EdgeInsets.all( ButtonPadding ),
            decoration: GetButtonDecoration(),
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: GetMediumText(
                            text
                            )
                        )
                    ]
                )
            );
    }

    // -- OPERATIONS

    void SetHue(
        double hue
        )
    {
        Color
            color;

        Hue = hue;
        color = HSL_COLOR( hue, 1.0, 0.7 ).GetColor();
        PrimaryColor = color;
        AccentColor = HSL_COLOR( hue, 1.0, 0.35 ).GetColor();
        ButtonColor = HSL_COLOR( hue, 1.0, 1.0 - GetColorBrightness( color ) * 0.1 ).GetColor();
        BoxColor = color;
        CanvasColor = Colors.white;
        BackgroundColor = Colors.white;
    }

    // ~~

    void SetFontSize(
        double font_size
        )
    {
        FontSize = font_size;
        SmallFontSize = font_size * 0.75;
        MediumFontSize = font_size;
        LargeFontSize = font_size * 1.25;
        BigFontSize = font_size * 1.5;
        HugeFontSize = font_size * 1.75;
        GiantFontSize = font_size * 2.0;
        PagePadding = 10.0;
        IconPadding = FontSize * 0.2;
        ButtonPadding = FontSize * 0.4;
        ButtonRadius = FontSize * 0.2;
    }

    // ~~

    void Set(
        DATA data
        )
    {
        FileVersion = data.FileVersion;
        SetHue( data.Hue );
        SetFontSize( data.FontSize );
        SetLanguageByName( data.Language.Name );
        PlanningList = data.PlanningList;
        CourseList = data.CourseList;
        CourseStatus = data.CourseStatus;
        ChapterStatus = data.ChapterStatus;
        LastIdentifier = data.LastIdentifier;
    }

    // ~~

    void SetPlanningListFromJson(
        List<dynamic> json_dynamic_list
        )
    {
        dynamic
            json_dynamic;
        PLANNING
            planning;

        PlanningList = [];

        for ( json_dynamic in json_dynamic_list )
        {
            planning = PLANNING();
            planning.SetFromJson( json_dynamic );

            AddPlanning( planning );
        }
    }

    // ~~

    void SetCourseListFromJson(
        List<dynamic> json_dynamic_list
        )
    {
        dynamic
            json_dynamic;
        COURSE
            course;

        CourseList = [];

        for ( json_dynamic in json_dynamic_list )
        {
            course = COURSE();
            course.SetFromJson( json_dynamic, this );

            AddCourse( course );
        }
    }

    // ~~

    void SetFromJson(
        Map<String, dynamic> json_dynamic_map
        )
    {
        FileVersion = json_dynamic_map[ "FileVersion" ];
        SetHue( json_dynamic_map[ "Hue" ] );
        SetFontSize( json_dynamic_map[ "FontSize" ] );
        SetLanguageByName( json_dynamic_map[ "Language" ] );
        SetPlanningListFromJson( json_dynamic_map[ "PlanningList" ] );
        SetCourseListFromJson( json_dynamic_map[ "CourseList" ] );
        CourseStatus = JSON.GetStatusFromText( json_dynamic_map[ "CourseStatus" ] );
        ChapterStatus = JSON.GetStatusFromText( json_dynamic_map[ "ChapterStatus" ] );
        LastIdentifier = json_dynamic_map[ "LastIdentifier" ];
    }

    // ~~

    void SetFromJsonText(
        String json_text
        )
    {
        DATA
            data;

        try
        {
            data = DATA();
            data.SetFromJson( jsonDecode( json_text ) );

            Set( data );
        }
        catch ( exception )
        {
            debugPrint( exception.toString() );
        }
    }

    // ~~

    int GetNextId(
        )
    {
        ++LastIdentifier;

        return LastIdentifier;
    }

    // ~~

    void SetLanguage(
        LANGUAGE language
        )
    {
        Language = language;
        Locale_ = LocaleList[ GetLanguageIndex( language ) ];
    }

    // ~~

    void SetLanguageByName(
        String language_name
        )
    {
        SetLanguage( GetLanguageByName( language_name )! );
    }

    // ~~

    void AddPlanning(
        PLANNING added_planning
        )
    {
        PlanningList.add( added_planning );
    }

    // ~~

    PLANNING GetAddedPlanning(
        )
    {
        PLANNING
            added_planning;

        added_planning = PLANNING();
        added_planning.Identifier = GetNextId();

        AddPlanning( added_planning );

        return added_planning;
    }

    // ~~

    void RemovePlanning(
        PLANNING removed_planning
        )
    {
        assert( CanRemovePlanning( removed_planning ) );

        PlanningList.removeWhere(
            ( planning ) => identical( planning, removed_planning )
            );
    }

    // ~~

    void MovePlanningUp(
        PLANNING planning
        )
    {
        int
            planning_index;
        PLANNING
            prior_planning;

        for ( planning_index = 1;
              planning_index < PlanningList.length;
              ++planning_index )
        {
            if ( identical( PlanningList[ planning_index ], planning ) )
            {
                prior_planning = PlanningList[ planning_index - 1 ];

                PlanningList[ planning_index - 1 ] = planning;
                PlanningList[ planning_index ] = prior_planning;

                return;
            }
        }
    }

    // ~~

    void MovePlanningDown(
        PLANNING planning
        )
    {
        int
            planning_index;
        PLANNING
            next_planning;

        for ( planning_index = 0;
              planning_index < PlanningList.length - 1;
              ++planning_index )
        {
            if ( identical( PlanningList[ planning_index ], planning ) )
            {
                next_planning = PlanningList[ planning_index + 1 ];

                PlanningList[ planning_index ] = next_planning;
                PlanningList[ planning_index + 1 ] = planning;

                return;
            }
        }
    }

    // ~~

    void AddCourse(
        COURSE added_course
        )
    {
        CourseList.add( added_course );
    }

    // ~~

    COURSE GetAddedCourse(
        )
    {
        COURSE
            added_course;

        added_course = COURSE();
        added_course.Identifier = GetNextId();

        AddCourse( added_course );

        return added_course;
    }

    // ~~

    void RemoveCourse(
        COURSE removed_course
        )
    {
        CourseList.removeWhere(
            ( course ) => identical( course, removed_course )
            );
    }

    // ~~

    void ChangeCourse(
        CHAPTER chapter,
        COURSE old_course,
        COURSE new_course
        )
    {
        old_course.RemoveChapter( chapter );
        new_course.AddChapter( chapter );
    }

    // ~~

    void MoveCourseUp(
        COURSE course
        )
    {
        int
            course_index;
        COURSE
            prior_course;

        for ( course_index = 1;
              course_index < CourseList.length;
              ++course_index )
        {
            if ( identical( CourseList[ course_index ], course ) )
            {
                prior_course = CourseList[ course_index - 1 ];

                CourseList[ course_index - 1 ] = course;
                CourseList[ course_index ] = prior_course;

                return;
            }
        }
    }

    // ~~

    void MoveCourseDown(
        COURSE course
        )
    {
        int
            course_index;
        COURSE
            next_course;

        for ( course_index = 0;
              course_index < CourseList.length - 1;
              ++course_index )
        {
            if ( identical( CourseList[ course_index ], course ) )
            {
                next_course = CourseList[ course_index + 1 ];

                CourseList[ course_index ] = next_course;
                CourseList[ course_index + 1 ] = course;

                return;
            }
        }
    }

    // ~~

    void DecreaseCalendarDate(
        )
    {
        CalendarDate = CalendarDate.GetSum( -1 );
    }

    // ~~

    void IncreaseCalendarDate(
        )
    {
        CalendarDate = CalendarDate.GetSum( 1 );
    }

    // ~~

    bool IsValidJsonText(
        String json_text
        )
    {
        return
            json_text.startsWith( "{\"FileVersion\":" )
            && json_text.endsWith( "}" );
    }

    // ~~

    void Save(
        )
    {
        String
            file_path,
            json_text;

        if ( DocumentFolderPath != null )
        {
            file_path = DocumentFolderPath + "remind.json";
            json_text = GetJsonText();

            if ( json_text != JsonText )
            {
                try
                {
                    File( file_path ).writeAsStringSync( json_text );

                    JsonText = json_text;
                }
                catch ( exception )
                {
                    debugPrint( exception.toString() );
                }
            }
        }
    }

    // ~~

    void Load(
        )
    {
        String
            file_path,
            json_text;
        File
            file;

        if ( DocumentFolderPath != null )
        {
            file_path = DocumentFolderPath + "remind.json";
            file = File( file_path );

            if ( file.existsSync() )
            {
                try
                {
                    json_text = File( file_path ).readAsStringSync();
                    //json_text = '{"FileVersion":1,"Hue":0.5,"FontSize":16.0,"Language":"French","PlanningList":[{"Identifier":1,"Name":"+1 +7 +15 +30 x1","SpacingList":[{"Value":1,"IsMultiplicative":false},{"Value":7,"IsMultiplicative":false},{"Value":15,"IsMultiplicative":false},{"Value":30,"IsMultiplicative":false},{"Value":10,"IsMultiplicative":true}]},{"Identifier":2,"Name":"+1 +3 +7 +14 +28 x1.5","SpacingList":[{"Value":1,"IsMultiplicative":false},{"Value":3,"IsMultiplicative":false},{"Value":7,"IsMultiplicative":false},{"Value":14,"IsMultiplicative":false},{"Value":28,"IsMultiplicative":false},{"Value":15,"IsMultiplicative":true}]}],"CourseList":[{"Identifier":3,"Name":"Biology","Status":"Active","ChapterList":[{"Identifier":4,"Name":"Chapter 1","Status":"Active","Planning":1,"Date":"2018-10-1","RepetitionCount":3,"OffsetDayCount":0},{"Identifier":5,"Name":"Chapter 2","Status":"Active","Planning":1,"Date":"2018-10-5","RepetitionCount":1,"OffsetDayCount":0},{"Identifier":6,"Name":"Chapter 3","Status":"Inactive","Planning":1,"Date":"2018-10-15","RepetitionCount":1,"OffsetDayCount":0}]},{"Identifier":7,"Name":"Chemistry","Status":"Active","ChapterList":[{"Identifier":8,"Name":"Chapter 1","Status":"Active","Planning":2,"Date":"2018-8-15","RepetitionCount":2,"OffsetDayCount":0},{"Identifier":9,"Name":"Chapter 2","Status":"Active","Planning":2,"Date":"2018-8-1","RepetitionCount":3,"OffsetDayCount":0},{"Identifier":10,"Name":"Chapter 3","Status":"Inactive","Planning":2,"Date":"2018-9-15","RepetitionCount":4,"OffsetDayCount":0}]}],"CourseStatus":"All","ChapterStatus":"All","LastIdentifier":10}';

                    SetFromJsonText( json_text );
                    JsonText = json_text;
                }
                catch ( exception )
                {
                    debugPrint( exception.toString() );
                }
            }
        }
    }

    // ~~

    void BuildBackupList(
        )
    {
        File
            backup_file;
        FileSystemEntity
            file_system_entity;
        List<FileSystemEntity>
            file_system_entity_list;
        String
            backup_file_path;
        BACKUP
            backup;

        BackupList = [];

        if ( DocumentFolderPath != null )
        {
            try
            {
                file_system_entity_list = Directory( DocumentFolderPath ).listSync( recursive: false, followLinks: false );

                for ( file_system_entity in file_system_entity_list )
                {
                    if ( file_system_entity is File )
                    {
                        backup_file = file_system_entity;
                        backup_file_path = backup_file.path;

                        if ( backup_file_path.contains( "remind_backup_" ) )
                        {
                            backup = BACKUP();
                            backup.FilePath = backup_file_path;
                            backup.DateTime_ = backup_file.lastModifiedSync();

                            BackupList.add( backup );
                        }
                    }
                }
            }
            catch ( exception )
            {
                debugPrint( exception.toString() );
            }
        }

        BackupList.sort(
            ( BACKUP first_backup, BACKUP second_backup )
            {
                return first_backup.DateTime_.compareTo( second_backup.DateTime_ );
            }
            );
    }

    // ~~

    void Backup(
        )
    {
        String
            backup_file_path;

        if ( DocumentFolderPath != null )
        {
            backup_file_path = DocumentFolderPath + "remind_backup_" + JSON.GetDateTimeText( DateTime.now() ) + ".json";

            try
            {
                File( backup_file_path ).writeAsStringSync( GetJsonText() );
            }
            catch ( exception )
            {
                debugPrint( exception.toString() );
            }
        }

        BuildBackupList();
    }

    // ~~

    void Restore(
        String file_path
        )
    {
        String
            json_text;
        File
            file;

        if ( DocumentFolderPath != null )
        {
            file = File( file_path );

            if ( file.existsSync() )
            {
                try
                {
                    json_text = File( file_path ).readAsStringSync();
                    SetFromJsonText( json_text );
                    JsonText = "";
                }
                catch ( exception )
                {
                    debugPrint( exception.toString() );
                }
            }
        }
    }

    // ~~

    void RemoveBackup(
        BACKUP backup
        )
    {
        try
        {
            File( backup.FilePath ).deleteSync();
        }
        catch ( exception )
        {
            debugPrint( exception.toString() );
        }

        BuildBackupList();
    }

    // ~~

    void Initialize(
        )
    {
        GetAddedCourse().GetAddedChapter( this );
    }
}
