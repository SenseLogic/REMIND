// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class NORWEGIAN_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    NORWEGIAN_LANGUAGE(
        ) : super()
    {
        Name = "Norwegian";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Farge:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Skriftstørrelse:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Dato:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Varigheten:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Språk:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Navn:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Neste datoer:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Siste dato:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Kapitler:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Antall repetisjoner:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planlegging:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Kurs:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Aktiv" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Aktiv" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Aktive kapitler" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Aktive kurs" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Alle kapitlene" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Alle kurs" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Ny planlegging" );
        TranslationMap[ "New course" ] = TRANSLATION( "Ny kurs" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nytt kapittel" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Dansk" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Nederlandsk" );
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
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Vil du slette denne sikkerhetskopien?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Vil du slette denne planleggingen?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Vil du slette dette kurset?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Vil du slette dette kapittelet?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Vil du eksportere programdataene til utklippstavlen? " );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Vil du importere programdataene fra utklippstavlen? " );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Vil du gjenopprette programdataene fra denne sikkerhetskopien? " );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Denne planleggingen kan ikke slettes fordi den fortsatt brukes av et kapittel." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Programdataene kan ikke importeres fordi innholdet på utklippstavlen har et ugyldig format. " );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Alle gjeldende data vil gå tapt." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "GJENOPPRETTE" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "AVBRYT" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "FORTSETT" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "SLETT" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "DEL" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EKSPORTERE" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTERE" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "SIKKERHETSKOPIER" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "KALENDER" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "KAPITTEL" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "KAPITLER" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "INNSTILLINGER" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANLEGGING" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANLEGGINGER" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "KURS" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "KURSER" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetNorwegianCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetNorwegianOrdinalPlurality();
    }

    // ~~

}
