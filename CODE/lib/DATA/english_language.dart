// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";
import "date.dart";

// -- TYPES

class ENGLISH_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    ENGLISH_LANGUAGE(
        ) : super()
    {
        Name = "English";
        DotCharacter = '.';
        TranslationMap[ "Color:" ] = TRANSLATION( "Color:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Font size:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Date:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Durations:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Language:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Name:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Next dates:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Last date:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Chapters:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Number of repetitions:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planning:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Course:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Active" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Active" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Active chapters" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Active courses" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "All chapters" );
        TranslationMap[ "All courses" ] = TRANSLATION( "All courses" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inactive" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inactive" );
        TranslationMap[ "New planning" ] = TRANSLATION( "New planning" );
        TranslationMap[ "New course" ] = TRANSLATION( "New course" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "New chapter" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Danish" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Dutch" );
        TranslationMap[ "English" ] = TRANSLATION( "English" );
        TranslationMap[ "French" ] = TRANSLATION( "French" );
        TranslationMap[ "German" ] = TRANSLATION( "German" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italian" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japanese" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Korean" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norwegian" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portuguese" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Spanish" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Swedish" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Do you want to delete this backup?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Do you want to delete this planning?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Do you want to delete this course?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Do you want to delete this chapter?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Do you want to export the application data into the clipboard?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Do you want to import the application data from the clipboard?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Do you want to restore the application data from this backup?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "This planning can't be deleted because it is still used by a chapter." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "The application data can't be imported because the clipboard content has an invalid format." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "All current data will be lost." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "RESTORE" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "CANCEL" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "CONTINUE" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "DELETE" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "SHARE" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORT" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORT" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "BACKUPS" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "CALENDAR" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "CHAPTER" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "CHAPTERS" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "OPTIONS" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANNING" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANNINGS" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "COURSE" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "COURSES" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetEnglishCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetEnglishOrdinalPlurality();
    }

    // ~~

    String GetDate( DATE date )
    {
        return "${date.Month}-${date.Day}-${date.Year}";
    }

    // ~~

    String GetDateTime( DateTime date_time )
    {
        return "${date_time.month}-${date_time.day}-${date_time.year} ${date_time.hour}:${GetIntegerText(date_time.minute,2)}:${GetIntegerText(date_time.second,2)}";
    }
}
