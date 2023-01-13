// -- IMPORTS

// ignore_for_file: camel_case_types, non_constant_identifier_names, empty_constructor_bodies

import "package:flutter/material.dart";
import "../DATA/chapter.dart";
import "../DATA/course.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "chapter_state.dart";

// -- TYPES

class CHAPTER_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;
    COURSE
        Course;
    CHAPTER
        Chapter;

    // -- CONSTRUCTORS

    CHAPTER_PAGE(
        APPLICATION_STATE application_state,
        DATA data,
        COURSE course,
        CHAPTER chapter
        ) :
        ApplicationState = application_state,
        Data = data,
        Course = course,
        Chapter = chapter,
        super()
    {
    }

    // -- OPERATIONS

    @override
    CHAPTER_STATE createState(
        )
    {
        return CHAPTER_STATE();
    }
}
