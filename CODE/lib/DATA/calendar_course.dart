// -- IMPORTS

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
