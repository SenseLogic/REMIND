// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class SWEDISH_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    SWEDISH_LANGUAGE(
        ) : super()
    {
        Name = "Swedish";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Färg:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Textstorlek:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Datum:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Varaktigheter:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Språk:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Namn:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Nästa datum:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Sista datum:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Kapitel:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Antal repetitioner:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planering:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Kurs:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Aktiva" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Aktiva" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Aktiva kapitel" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Aktiva kurser" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Alla kapitel" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Alla kurser" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inaktiv" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Ny planering" );
        TranslationMap[ "New course" ] = TRANSLATION( "Ny kurs" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nytt kapitel" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Danska" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Holländska" );
        TranslationMap[ "English" ] = TRANSLATION( "Engelska" );
        TranslationMap[ "French" ] = TRANSLATION( "Franska" );
        TranslationMap[ "German" ] = TRANSLATION( "Tyska" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italienska" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japanska" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Koreanska" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norska" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugisiska" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Spanska" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Svenska" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Vill du ta bort den här säkerhetskopian?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Vill du ta bort den här planeringen?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Vill du ta bort den här kursen?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Vill du ta bort det här kapitlet?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Vill du exportera programdata till Urklipp?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Vill du Importera programdata från Urklipp?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Vill du återställa programdata från den här säkerhetskopian?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Den här planeringen kan inte tas bort eftersom den fortfarande används av ett kapitel." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Programdata kan inte importeras eftersom innehållet i Urklipp har ett ogiltigt format." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Alla aktuella data kommer att gå förlorade." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "ÅTERSTÄLL" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "AVBRYT" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "FORTSÄTT" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "TA BORT" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "DELA" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORTERA" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTERA" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "SÄKERHETSKOPIOR" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "KALENDER" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "KAPITEL" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "KAPITEL" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "INSTÄLLNINGAR" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANERING" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANERINGEN" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "KURS" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "KURSER" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetSwedishCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetSwedishOrdinalPlurality();
    }

    // ~~

}
