// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class DUTCH_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    DUTCH_LANGUAGE(
        ) : super()
    {
        Name = "Dutch";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Kleur:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Lettergrootte:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Datum:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Duren:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Taal:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Naam:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Volgende data:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Laatste datum:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Hoofdstukken:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Aantal herhalingen:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planning:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Cursus:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Actief" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Actief" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Actieve hoofdstukken" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Actieve cursussen" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Alle hoofdstukken" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Alle cursussen" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inactief" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inactief" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Nieuwe planning" );
        TranslationMap[ "New course" ] = TRANSLATION( "Nieuwe cursus" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nieuw hoofdstuk" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Deens" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Nederlands" );
        TranslationMap[ "English" ] = TRANSLATION( "Engels" );
        TranslationMap[ "French" ] = TRANSLATION( "Frans" );
        TranslationMap[ "German" ] = TRANSLATION( "Duits" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italiaans" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japans" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Koreaans" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Noors" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugees" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Spaans" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Zweeds" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Wilt u deze back-up verwijderen?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Wilt u deze planning verwijderen?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Wilt u deze cursus verwijderen?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Wilt u deze hoofdstuk verwijderen?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Wilt u de applicatiegegevens naar het klembord exporteren?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Wilt u de applicatiegegevens van het klembord importeren?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Wilt u de applicatiegegevens van deze back-up herstellen?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Deze planning kan niet verwijderd worden omdat ze nog steeds door een hoofdstuk wordt gebruikt." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "De applicatiegegevens kunnen niet worden geïmporteerd omdat de inhoud van het klembord een ongeldig formaat heeft." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Alle huidige gegevens gaan verloren." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "HERSTELLEN" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "ANNULEREN" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "DOORGAAN" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "VERWIJDEREN" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "DELEN" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORTEREN" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTEREN" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "BACK-UPS" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "KALENDER" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "HOOFDSTUK" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "HOOFDSTUKKEN" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "INSTELLINGEN" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANNING" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANNINGEN" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "CURSUS" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "CURSUSSEN" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetDutchCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetDutchOrdinalPlurality();
    }

    // ~~

}
