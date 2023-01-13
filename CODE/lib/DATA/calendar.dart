// -- IMPORTS

// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies

import "calendar_course.dart";
import "date.dart";

// -- TYPES

class CALENDAR
{
    // -- ATTRIBUTES

    List<CALENDAR_COURSE>
        CourseList;
    DATE
        CurrentDate;

    // -- CONSTRUCTORS

    CALENDAR(
        ) :
        CourseList = [],
        CurrentDate = DATE.GetCurrentDate()
    {
    }
}
