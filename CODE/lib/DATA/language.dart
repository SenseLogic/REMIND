// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "base_language.dart";
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
