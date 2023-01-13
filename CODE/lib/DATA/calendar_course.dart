// -- IMPORTS

// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types

import "calendar_chapter.dart";
import "course.dart";

// -- TYPES

class CALENDAR_COURSE
{
    // -- ATTRIBUTES

    COURSE?
        Course;
    List<CALENDAR_CHAPTER>
        ChapterList;

    // -- CONSTRUCTORS

    CALENDAR_COURSE(
        ) :
        Course = null,
        ChapterList = []
    {
    }
}
