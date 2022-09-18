// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class FRENCH_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    FRENCH_LANGUAGE(
        ) : super()
    {
        Name = "French";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Couleur :" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Taille de police:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Date :" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Durées :" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Langue :" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Nom :" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Prochaines dates :" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Dernière date :" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Chapitres :" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Nombre de répétitions :" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planification :" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Statut :" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Cours :" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Actif" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Actif" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Chapitres actifs" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Cours actifs" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Tous les chapitres" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Tous les cours" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inactif" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inactif" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Nouvelle planification" );
        TranslationMap[ "New course" ] = TRANSLATION( "Nouveau cours" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nouveau chapitre" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Danois" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Néerlandais" );
        TranslationMap[ "English" ] = TRANSLATION( "Anglais" );
        TranslationMap[ "French" ] = TRANSLATION( "Français" );
        TranslationMap[ "German" ] = TRANSLATION( "Allemand" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italien" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japonais" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Coréen" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norvégien" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugais" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Espagnol" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Suédois" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Voulez-vous supprimer cette sauvegarde ?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Voulez-vous supprimer cette planification ?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Voulez-vous supprimer ce cours ?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Voulez-vous supprimer ce chapitre ?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Voulez-vous exporter les données d'application dans le presse-papiers?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Voulez-vous importer les données d'application à partir du presse-papiers?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Voulez-vous restaurer les données de l'application à partir de cette sauvegarde?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Cette planification ne peut pas être supprimée car elle est toujours utilisée par un chapitre." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Les données de l'application ne peuvent pas être importées car le contenu du presse-papiers a un format non valide." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Toutes les données actuelles seront perdues." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "RESTAURER" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "ANNULER" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "CONTINUER" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "SUPPRIMER" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "PARTAGER" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORTER" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTER" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "SAUVEGARDES" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "CALENDRIER" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "CHAPITRE" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "CHAPITRES" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "OPTIONS" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANIFICATION" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANIFICATIONS" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "COURS" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "COURS" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetFrenchCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetFrenchOrdinalPlurality();
    }

    // ~~

}
