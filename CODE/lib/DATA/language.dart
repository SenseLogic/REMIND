// -- IMPORTS

import "base_language.dart";
import "genre.dart";
import "plurality.dart";
import "translation.dart";
import "date.dart";

// -- TYPES

class LANGUAGE extends BASE_LANGUAGE
{
    // -- CONSTRUCTORS

    LANGUAGE(
        ) : super()
    {
    }

    // -- INQUIRIES

    String GetDate( DATE date )
    {
        return "${date.Day}/${date.Month}/${date.Year}";
    }

    // ~~

    String GetDateTime( DateTime date_time )
    {
        return "${date_time.day}/${date_time.month}/${date_time.year} ${date_time.hour}:${GetIntegerText(date_time.minute,2)}:${GetIntegerText(date_time.second,2)}";
    }
}
