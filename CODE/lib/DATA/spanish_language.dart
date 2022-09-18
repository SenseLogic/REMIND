// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class SPANISH_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    SPANISH_LANGUAGE(
        ) : super()
    {
        Name = "Spanish";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Color:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Tamaño de fuente:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Fecha:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Duraciones:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Idioma:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Nombre:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Próximas fechas:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Última fecha:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Capítulos:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Número de repeticiones:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planificación:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Curso:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Activo" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Activo" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Capítulos activos" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Cursos activos" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Todos los capítulos" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Todos los cursos" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inactivo" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inactivo" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Nueva planificación" );
        TranslationMap[ "New course" ] = TRANSLATION( "Nuevo curso" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Nuevo capítulo" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Danés" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Holandés" );
        TranslationMap[ "English" ] = TRANSLATION( "Inglés" );
        TranslationMap[ "French" ] = TRANSLATION( "Francés" );
        TranslationMap[ "German" ] = TRANSLATION( "Alemán" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italiano" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japonés" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Coreano" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Noruego" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugués" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Español" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Sueco" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "¿Quiere eliminar esta copia de seguridad?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "¿Quiere eliminar esta planificación?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "¿Quiere eliminar este curso?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "¿Quiere eliminar este capítulo?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "¿Quiere exportar los datos de la aplicación al portapapeles?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "¿Quiere importar los datos de la aplicación desde el portapapeles?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "¿Quiere restaurar los datos de la aplicación desde esta copia de seguridad?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Esta planificación no puede ser borrada porque todavía es usada por un capítulo." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Los datos de la aplicación no se pueden importar porque el contenido del portapapeles tiene un formato inválido." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Todos los datos actuales se perderán." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "RESTAURAR" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "CANCELAR" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "CONTINUAR" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "ELIMINAR" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "COMPARTIR" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORTAR" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTAR" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "COPIAS DE SEGURIDAD" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "CALENDARIO" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "CAPÍTULO" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "CAPÍTULOS" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "OPCIONES" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANIFICACIÓN" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANIFICACIONES" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "CURSO" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "CURSOS" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetSpanishCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetSpanishOrdinalPlurality();
    }

    // ~~

}
