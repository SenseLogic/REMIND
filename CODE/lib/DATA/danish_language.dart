// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class DANISH_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    DANISH_LANGUAGE(
        ) : super()
    {
        Name = "Danish";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Farve:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Skriftstørrelse:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Dato:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Varigheder:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Sprog:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Navn:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Næste datoer:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Sidste dato:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Kapitler:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Antal gentagelser:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planlægning:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Kursus:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Aktiv" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Aktiv" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Aktiv kapitler" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Aktive kurser" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Alle kapitler" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Alle kurser" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Ny planlægning" );
        TranslationMap[ "New course" ] = TRANSLATION( "Nyt kursus" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nyt kapitel" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Dansk" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Hollandsk" );
        TranslationMap[ "English" ] = TRANSLATION( "Engelsk" );
        TranslationMap[ "French" ] = TRANSLATION( "Fransk" );
        TranslationMap[ "German" ] = TRANSLATION( "Tysk" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italiensk" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japansk" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Koreansk" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norsk" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugisisk" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Spansk" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Svensk" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Vil du slette denne sikkerhedskopi?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Vil du slette denne planlægning?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Vil du slette dette kursus?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Vil du slette dette kapitel?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Vil du eksportere programdataene til udklipsholder?" + "Do you want to import the application data from the clipboard?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Do you want to import the application data from the clipboard?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Vil du gendanne programdataene fra denne sikkerhedskopi?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Denne planlægning kan ikke slettes fordi den stadig bruges af et kapitel." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Programdataene kan ikke importeres, fordi udklipsholderens indhold har et ugyldigt format." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Alle aktuelle data vil gå tabt." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "GENDAN" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "ANNULLER" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "FORTSÆT" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "SLET" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "DEL" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EKSPORT" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORT" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "SIKKERHEDSKOPIER" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "KALENDER" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "KAPITEL" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "KAPITLER" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "INDSTILLINGER" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANLÆGNING" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANLÆGNINGEN" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "KURSUS" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "KURSER" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetDanishCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetDanishOrdinalPlurality();
    }

    // ~~

}
