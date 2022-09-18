// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class ITALIAN_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    ITALIAN_LANGUAGE(
        ) : super()
    {
        Name = "Italian";
        DotCharacter = '.';
        TranslationMap[ "Color:" ] = TRANSLATION( "Colore:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Dimensione del font:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Data:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Durate:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Lingua:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Nome:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Prossime date:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Ultima data:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Capitoli:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Numero di ripetizioni:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Pianificazione:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Stato:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Corso:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Attivo" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Attivo" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "capitoli attivi" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Corsi attivi" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Tutte i capitoli" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Tutti i corsi" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inattivo" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inattivo" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Nuova pianificazione" );
        TranslationMap[ "New course" ] = TRANSLATION( "Nuovo corso" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nuovo capitolo" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Danese" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Olandese" );
        TranslationMap[ "English" ] = TRANSLATION( "Inglese" );
        TranslationMap[ "French" ] = TRANSLATION( "Francese" );
        TranslationMap[ "German" ] = TRANSLATION( "Tedesco" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italiano" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Giapponese" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Coreano" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norvegese" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portoghese" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Spagnolo" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Svedese" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Vuoi eliminare questo backup?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Vuoi eliminare questa pianificazione?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Vuoi eliminare questo corso?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Vuoi eliminare questo capitolo?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Vuoi esportare i dati dell'applicazione negli appunti?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Vuoi importare i dati dell'applicazione dagli appunti?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Vuoi ripristinare i dati dell'applicazione da questo backup?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Questa pianificazione non può essere eliminata perché è ancora utilizzata da un capitolo." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "I dati dell'applicazione non possono essere importati perché il contenuto degli appunti ha un formato non valido." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Tutti i dati attuali andranno persi." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "RIPRISTINA" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "ANNULLA" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "CONTINUA" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "ELIMINA" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "CONDIVIDERE" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "ESPORTA" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTA" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "BACKUP" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "CALENDARIO" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "CAPITOLO" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "CAPITOLI" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "OPZIONI" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PIANIFICAZIONE" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PIANIFICAZIONI" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "CORSO" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "CORSI" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetItalianCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetItalianOrdinalPlurality();
    }

    // ~~

}
