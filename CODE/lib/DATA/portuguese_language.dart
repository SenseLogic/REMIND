// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";

// -- TYPES

class PORTUGUESE_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    PORTUGUESE_LANGUAGE(
        ) : super()
    {
        Name = "Portuguese";
        DotCharacter = ',';
        TranslationMap[ "Color:" ] = TRANSLATION( "Cor:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "Tamanho da fonte:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "Data:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "Durações:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "Idioma:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "Nome:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "Próximas datas:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "Última data:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "Capítulos:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "Número de repetições:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "Planejamento:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "Status:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "Curso:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "Ativo" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "Ativo" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "Capítulos ativos" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "Cursos ativos" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "Todas os capítulos" );
        TranslationMap[ "All courses" ] = TRANSLATION( "Todos os cursos" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "Inativo" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "Inativo" );
        TranslationMap[ "New planning" ] = TRANSLATION( "Novo planejamento" );
        TranslationMap[ "New course" ] = TRANSLATION( "Novo curso" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "Novo capítulo" );
        TranslationMap[ "Danish" ] = TRANSLATION( "Dinamarquês" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "Holandês" );
        TranslationMap[ "English" ] = TRANSLATION( "Inglês" );
        TranslationMap[ "French" ] = TRANSLATION( "Francês" );
        TranslationMap[ "German" ] = TRANSLATION( "Alemão" );
        TranslationMap[ "Italian" ] = TRANSLATION( "Italiano" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "Japonês" );
        TranslationMap[ "Korean" ] = TRANSLATION( "Coreano" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "Norueguês" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "Portugues" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "Espanhol" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "Sueco" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "Você deseja excluir este cópia de segurança?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "Você deseja excluir este planejamento?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "Você deseja excluir este curso?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "Você deseja excluir este capítulo?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "Você deseja exportar os dados do aplicativo para a área de transferência?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "Você deseja importar os dados do aplicativo da área de transferência?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "Você deseja restaurar os dados do aplicativo deste backup?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "Esse planejamento não pode ser excluído porque ainda é usado por um capítulo." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "Os dados do aplicativo não podem ser importados porque o conteúdo da área de transferência tem um formato inválido." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "Todos os dados atuais serão perdidos." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "RESTAURAR" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "CANCELAR" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "CONTINUAR" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "EXCLUIR" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "COMPARTILHAR" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "EXPORTAR" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "IMPORTAR" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "BACKUPS" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "CALENDÁRIO" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "CAPÍTULO" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "CAPÍTULOS" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "OPÇÕES" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "PLANEJAMENTO" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "PLANEJAMENTOS" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "CURSO" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "CURSOS" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetPortugueseCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetPortugueseOrdinalPlurality();
    }

    // ~~

}
