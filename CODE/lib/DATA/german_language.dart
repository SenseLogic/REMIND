// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class GERMAN_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    GERMAN_LANGUAGE(
        ) : super()
    {
        Name = "German";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Farbe:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Schriftartengröße:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Datum:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Dauern:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Sprache:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Name:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Nächsten Daten:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Letzte Datum:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Kapitel:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Anzahl der Wiederholungen:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planung:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Kurs:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Aktiv" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Aktiv" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Aktive Kapitel" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Aktive Kurse" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Alle Kapitel" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Alle Kurse" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Neue Planung" );
        TranslationMap[ "New course" ] = TRANSLATION( "Neuer Kurs" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Neues Kapitel" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Dänisch" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Niederländisch" );
        TranslationMap[ "English" ] = TRANSLATION( "Englisch" );
        TranslationMap[ "French" ] = TRANSLATION( "Französisch" );
        TranslationMap[ "German" ] = TRANSLATION( "Deutsch" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italienisch" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japanisch" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Koreanisch" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norwegisch" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugiesisch" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Spanisch" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Schwedisch" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Wollen Sie diese Backup löschen?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Wollen Sie diese Planung löschen?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Wollen Sie diesen Kurs löschen?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Wollen Sie dieses Kapitel löschen?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Wollen Sie die Anwendungsdaten in die Zwischenablage exportieren?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Wollen Sie die Anwendungsdaten aus der Zwischenablage importieren?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Wollen Sie die Anwendungsdaten aus diesem Backup wiederherstellen?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Diese Planung kann nicht gelöscht werden, da sie noch von einem Kapitel verwendet wird." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Die Anwendungsdaten können nicht importiert werden, da der Inhalt der Zwischenablage ein ungültiges Format hat." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Alle aktuellen Daten gehen verloren." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "WIEDERHERSTELLEN" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "ABBRECHEN" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "WEITER" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "LÖSCHEN" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "TEILEN" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORTIEREN" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTIEREN" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "BACKUPS" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "KALENDER" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "KAPITEL" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "KAPITEL" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "EINSTELLUNGEN" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANUNG" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANUNGEN" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "KURS" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "KURSE" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetGermanCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetGermanOrdinalPlurality();
    }

    // ~~

}
