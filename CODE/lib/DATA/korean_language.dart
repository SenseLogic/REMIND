// -- IMPORTS

import "language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";
import "date.dart";

// -- TYPES

class KOREAN_LANGUAGE extends LANGUAGE
{
    // -- CONSTRUCTORS

    KOREAN_LANGUAGE(
        ) : super()
    {
        Name = "Korean";
        DotCharacter = '.';
        TranslationMap[ "Color:" ] = TRANSLATION( "색상:" );
        TranslationMap[ "Font size:" ] = TRANSLATION( "글꼴 크기:" );
        TranslationMap[ "Date:" ] = TRANSLATION( "날짜:" );
        TranslationMap[ "Durations:" ] = TRANSLATION( "기간:" );
        TranslationMap[ "Language:" ] = TRANSLATION( "언어:" );
        TranslationMap[ "Name:" ] = TRANSLATION( "이름:" );
        TranslationMap[ "Next dates:" ] = TRANSLATION( "다음 날짜:" );
        TranslationMap[ "Last date:" ] = TRANSLATION( "마지막 날짜:" );
        TranslationMap[ "Chapters:" ] = TRANSLATION( "장:" );
        TranslationMap[ "Number of repetitions:" ] = TRANSLATION( "반복 횟수:" );
        TranslationMap[ "Planning:" ] = TRANSLATION( "계획:" );
        TranslationMap[ "Status:" ] = TRANSLATION( "상태:" );
        TranslationMap[ "Course:" ] = TRANSLATION( "코스:" );
        TranslationMap[ "Active (chapter)" ] = TRANSLATION( "활성" );
        TranslationMap[ "Active (course)" ] = TRANSLATION( "활성" );
        TranslationMap[ "Active chapters" ] = TRANSLATION( "활성 장" );
        TranslationMap[ "Active courses" ] = TRANSLATION( "활성 코스" );
        TranslationMap[ "All chapters" ] = TRANSLATION( "모든 장" );
        TranslationMap[ "All courses" ] = TRANSLATION( "모든 코스" );
        TranslationMap[ "Inactive (chapter)" ] = TRANSLATION( "비활성" );
        TranslationMap[ "Inactive (course)" ] = TRANSLATION( "비활성" );
        TranslationMap[ "New planning" ] = TRANSLATION( "새 계획" );
        TranslationMap[ "New course" ] = TRANSLATION( "새 코스" );
        TranslationMap[ "New chapter" ] = TRANSLATION( "새 장" );
        TranslationMap[ "Danish" ] = TRANSLATION( "덴마크어" );
        TranslationMap[ "Dutch" ] = TRANSLATION( "네덜란드어" );
        TranslationMap[ "English" ] = TRANSLATION( "영어" );
        TranslationMap[ "French" ] = TRANSLATION( "프랑스어" );
        TranslationMap[ "German" ] = TRANSLATION( "독일어" );
        TranslationMap[ "Italian" ] = TRANSLATION( "이탈리아어" );
        TranslationMap[ "Japanese" ] = TRANSLATION( "일본어" );
        TranslationMap[ "Korean" ] = TRANSLATION( "한국어" );
        TranslationMap[ "Norwegian" ] = TRANSLATION( "노르웨이어" );
        TranslationMap[ "Portuguese" ] = TRANSLATION( "포르투갈어" );
        TranslationMap[ "Spanish" ] = TRANSLATION( "스페인어" );
        TranslationMap[ "Swedish" ] = TRANSLATION( "스웨덴어" );
        TranslationMap[ "Do you want to delete this backup?" ] = TRANSLATION( "이 백업을 삭제 하 시겠습니까?" );
        TranslationMap[ "Do you want to delete this planning?" ] = TRANSLATION( "이 계획을 삭제 하 시겠습니까?" );
        TranslationMap[ "Do you want to delete this course?" ] = TRANSLATION( "이 코스를 삭제 하 시겠습니까?" );
        TranslationMap[ "Do you want to delete this chapter?" ] = TRANSLATION( "이 장을 삭제 하 시겠습니까?" );
        TranslationMap[ "Do you want to export the application data into the clipboard?" ] = TRANSLATION( "응용 프로그램 데이터를 클립보드로 내보내시겠습니까?" );
        TranslationMap[ "Do you want to import the application data from the clipboard?" ] = TRANSLATION( "클립 보드에서 응용 프로그램 데이터를 가져 오시겠습니까?" );
        TranslationMap[ "Do you want to restore the application data from this backup?" ] = TRANSLATION( "이 백업에서 응용 프로그램 데이터를 복원 하 시겠습니까?" );
        TranslationMap[ "This planning can't be deleted because it is still used by a chapter." ] = TRANSLATION( "이 계획은 장에서 계속 사용 되므로 삭제할 수 없습니다." );
        TranslationMap[ "The application data can't be imported because the clipboard content has an invalid format." ] = TRANSLATION( "응용 프로그램 데이터는 오림판 내용에는 부당한 체재가 있기 때문에 수입될 수 없다." );
        TranslationMap[ "All current data will be lost." ] = TRANSLATION( "모든 현재 데이터가 손실 됩니다." );
        TranslationMap[ "RESTORE" ] = TRANSLATION( "복원" );
        TranslationMap[ "CANCEL" ] = TRANSLATION( "취소" );
        TranslationMap[ "CONTINUE" ] = TRANSLATION( "계속" );
        TranslationMap[ "DELETE" ] = TRANSLATION( "삭제" );
        TranslationMap[ "SHARE" ] = TRANSLATION( "공유" );
        TranslationMap[ "EXPORT" ] = TRANSLATION( "내보내기" );
        TranslationMap[ "IMPORT" ] = TRANSLATION( "가져오기" );
        TranslationMap[ "BACKUPS" ] = TRANSLATION( "백업" );
        TranslationMap[ "CALENDAR" ] = TRANSLATION( "달력" );
        TranslationMap[ "CHAPTER" ] = TRANSLATION( "장" );
        TranslationMap[ "CHAPTERS" ] = TRANSLATION( "장" );
        TranslationMap[ "OPTIONS" ] = TRANSLATION( "옵션" );
        TranslationMap[ "PLANNING" ] = TRANSLATION( "계획" );
        TranslationMap[ "PLANNINGS" ] = TRANSLATION( "계획" );
        TranslationMap[ "COURSE" ] = TRANSLATION( "코스" );
        TranslationMap[ "COURSES" ] = TRANSLATION( "코스" );
    }

    // -- INQUIRIES

    PLURALITY GetCardinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetKoreanCardinalPlurality();
    }

    // ~~

    PLURALITY GetOrdinalPlurality(
        TRANSLATION translation
        )
    {
        return translation.GetKoreanOrdinalPlurality();
    }

    // ~~

    String GetDate( DATE date )
    {
        return "${date.Year}년 ${date.Month}월 ${date.Day}일";
    }

    // ~~

    String GetDateTime( DateTime date_time )
    {
        return "${date_time.year}년 ${date_time.month}월 ${date_time.day}일 ${date_time.hour}시 ${date_time.minute}분 ${date_time.second}초";
    }
}
