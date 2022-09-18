// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";
import "date.dart";

// -- TYPES

class JAPANESE_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    JAPANESE_LANGUAGE(
        ) : super()
    {
        Name = "Japanese";
        DotCharacter = '.';
        TranslationMap[ "Color:" ] = TRANSLATION( "色:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "フォントサイズ:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "日付:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "期間:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "言語:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "名前:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "次の日付:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "最後の日付:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "章:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "繰返しの数:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "計画:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "ステータス:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "コース:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "アクティブ" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "アクティブ" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "アクティブ章" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "アクティブコース" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "すべての章" );
        TranslationMap[ "All courses" ] = TRANSLATION( "すべてのコース" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "非アクティブ" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "非アクティブ" );
        TranslationMap[ "New planning" ] = TRANSLATION( "新しい計画" );
        TranslationMap[ "New course" ] = TRANSLATION( "新しいコース" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "新しい章" );
        TranslationMap[ "Danish" ] = TRANSLATION( "デンマーク語" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "オランダ語" );
        TranslationMap[ "English" ] = TRANSLATION( "英語" );
        TranslationMap[ "French" ] = TRANSLATION( "フランス語" );
        TranslationMap[ "German" ] = TRANSLATION( "ドイツ語" );
        TranslationMap[ "Italian" ] = TRANSLATION( "イタリア語" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "日本語" );
        TranslationMap[ "Korean" ] = TRANSLATION( "韓国語" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "ノルウェー語" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "ポルトガル語" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "スペイン語" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "スウェーデン語" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "このバックアップを削除しますか？" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "この計画を削除しますか？" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "このコースを削除しますか？" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "この章を削除しますか？" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "アプリケーションデータをクリップボードにエクスポートしますか?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "アプリケーションのデータをクリップボードからインポートしますか?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "このバックアップからアプリケーションデータを復元しますか?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "この計画はまだ章によって使用されるので取除くことができない。" );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "クリップボードの内容に無効な形式があるため、アプリケーションデータをインポートできません。" );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "すべての現在のデータは失われます。" );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "復元" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "キャンセル" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "続行" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "削除" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "共有" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "エクスポート" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "インポート" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "バックアップ" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "カレンダー" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "章" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "章" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "設定" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "計画" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "計画" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "コース" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "コース" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetJapaneseCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetJapaneseOrdinalPlurality();
    }

    // ~~

    String GetDate( DATE date )
    {
        return "${date.Year}年${date.Month}月${date.Day}日";
    }

    // ~~

    String GetDateTime( DateTime date_time )
    {
        return "${date_time.year}年${date_time.month}月${date_time.day}日 ${date_time.hour}時${date_time.minute}分${date_time.second}秒";
    }
}
