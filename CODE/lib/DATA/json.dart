// -- IMPORTS

// ignore_for_file: non_constant_identifier_names

import "package:flutter/material.dart";
import "date.dart";
import "status.dart";

// -- TYPES

class JSON
{
    static String GetDateTimeText(
        DateTime date_time
        )
    {
        return "${date_time.year}-${date_time.month}-${date_time.day}-${date_time.hour}-${date_time.minute}-${date_time.second}-${date_time.millisecond}-${date_time.microsecond}";
    }

    // ~~

    static DateTime GetDateTimeFromText(
        String text
        )
    {
        List<String>
            part_list;

        part_list = text.split( '-' );

        return DateTime(
            int.parse( part_list[ 0 ] ),
            int.parse( part_list[ 1 ] ),
            int.parse( part_list[ 2 ] ),
            int.parse( part_list[ 3 ] ),
            int.parse( part_list[ 4 ] ),
            int.parse( part_list[ 5 ] ),
            int.parse( part_list[ 6 ] ),
            int.parse( part_list[ 7 ] )
            );
    }

    // ~~

    static String GetDateText(
        DATE date
        )
    {
        return "${date.Year}-${date.Month}-${date.Day}";
    }

    // ~~

    static DATE GetDateFromText(
        String text
        )
    {
        List<String>
            part_list;

        part_list = text.split( '-' );

        return DATE(
            int.parse( part_list[ 0 ] ),
            int.parse( part_list[ 1 ] ),
            int.parse( part_list[ 2 ] )
            );
    }

    // ~~

    static String GetColorText(
        Color color
        )
    {
        return "${color.alpha},${color.red},${color.green},${color.blue}";
    }

    // ~~

    static Color GetColorFromText(
        String text
        )
    {
        List<String>
            part_list;

        part_list = text.split( ',' );

        return Color.fromARGB(
            int.parse( part_list[ 0 ] ),
            int.parse( part_list[ 1 ] ),
            int.parse( part_list[ 2 ] ),
            int.parse( part_list[ 3 ] )
            );
    }

    // ~~

    static String GetStatusText(
        STATUS status
        )
    {
        if ( status == STATUS.Active )
        {
            return "Active";
        }
        else if ( status == STATUS.Inactive )
        {
            return "Inactive";
        }
        else
        {
            assert( status == STATUS.All );

            return "All";
        }
    }

    // ~~

    static STATUS GetStatusFromText(
        String text
        )
    {
        if ( text == "Active" )
        {
            return STATUS.Active;
        }
        else if ( text == "Inactive" )
        {
            return STATUS.Inactive;
        }
        else
        {
            assert( text == "All" );

            return STATUS.All;
        }
    }

    // ~~

    static String GetIndentedText(
        String json_text
        )
    {
        bool
            character_is_in_string_literal,
            next_character_is_indented;
        int
            character_index;
        String
            character,
            next_character,
            delimiter_character,
            indentation_text;
        StringBuffer
            string_buffer;

        string_buffer = StringBuffer();
        indentation_text = "";
        character_is_in_string_literal = false;
        next_character_is_indented = false;
        delimiter_character = "";

        for ( character_index = 0;
              character_index < json_text.length;
              ++character_index )
        {
            character = json_text[ character_index ];

            if ( character_index + 1 < json_text.length - 1 )
            {
                next_character = json_text[ character_index + 1 ];
            }
            else
            {
                next_character = "";
            }

            if ( character_is_in_string_literal )
            {
                string_buffer.write( character );

                if ( character == delimiter_character )
                {
                    character_is_in_string_literal = false;
                }
                else if ( character == '\\' )
                {
                    ++character_index;
                    string_buffer.write( json_text[ character_index ] );
                }
            }
            else if ( character == '{'
                      || character == '[' )
            {
                if ( character_index > 0 )
                {
                    string_buffer.write( "\n" );
                }

                string_buffer.write( indentation_text + character );

                if ( next_character != '{'
                     && next_character != '[' )
                {
                    string_buffer.write( "\n" );
                    next_character_is_indented = true;
                }

                indentation_text += "    ";
            }
            else if ( character == ',' )
            {
                string_buffer.write( "," );

                if ( next_character != '{'
                     && next_character != '[' )
                {
                    string_buffer.write( "\n" );
                    next_character_is_indented = true;
                }
            }
            else if ( character == '}'
                      || character == ']' )
            {
                indentation_text = indentation_text.substring( 0, indentation_text.length - 4 );
                string_buffer.write( "\n" + indentation_text + character );

                if ( next_character != ','
                     && next_character != '}'
                     && next_character != ']' )
                {
                    string_buffer.write( "\n" );
                    next_character_is_indented = true;
                }
            }
            else if ( character == ':' )
            {
                string_buffer.write( " : " );
            }
            else
            {
                if ( next_character_is_indented )
                {
                    string_buffer.write( indentation_text );
                    next_character_is_indented = false;
                }

                string_buffer.write( character );

                if ( character == '\''
                     || character == '"' )
                {
                    character_is_in_string_literal = true;
                    delimiter_character = character;
                }
            }
        }

        return string_buffer.toString();
    }

    // ~~

    static String GetPackedText(
        String json_text
        )
    {
        bool
            character_is_in_string_literal;
        int
            character_index;
        String
            character,
            delimiter_character;
        StringBuffer
            string_buffer;

        string_buffer = StringBuffer();
        character_is_in_string_literal = false;
        delimiter_character = "";

        for ( character_index = 0;
              character_index < json_text.length;
              ++character_index )
        {
            character = json_text[ character_index ];

            if ( character_is_in_string_literal )
            {
                string_buffer.write( character );

                if ( character == delimiter_character )
                {
                    character_is_in_string_literal = false;
                }
                else if ( character == '\\' )
                {
                    ++character_index;
                    string_buffer.write( json_text[ character_index ] );
                }
            }
            else if ( character == '\''
                      || character == '"' )
            {
                string_buffer.write( character );
                character_is_in_string_literal = true;
                delimiter_character = character;
            }
            else if ( character != ' '
                      && character != '\t'
                      && character != '\r'
                      && character != '\n' )
            {
                string_buffer.write( character );
            }
        }

        return string_buffer.toString();
    }
}
