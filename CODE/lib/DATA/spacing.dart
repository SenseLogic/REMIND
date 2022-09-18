// -- IMPORTS

import "language.dart";

// -- TYPES

class SPACING
{
    // -- ATTRIBUTES

    int
        Value;
    bool
        IsMultiplicative;

    // -- CONSTRUCTORS

    SPACING(
        ) :
        Value = 1,
        IsMultiplicative = false
    {
    }

    // ~~

    SPACING.from(
        SPACING spacing
        ) :
        Value = spacing.Value,
        IsMultiplicative = spacing.IsMultiplicative
    {
    }

    // -- INQUIRIES

    Map<String, dynamic> toJson(
        )
    {
        return
            {
                "Value" : Value,
                "IsMultiplicative" : IsMultiplicative
            };
    }

    // ~~

    int GetDayCount(
        int prior_day_count
        )
    {
        if ( IsMultiplicative )
        {
            return ( prior_day_count.toDouble() * ( Value.toDouble() * 0.1 ) + 0.5 ).toInt();
        }
        else
        {
            return Value;
        }
    }

    // ~~

    String GetOperatorText(
        )
    {
        if ( IsMultiplicative )
        {
            return "x";
        }
        else
        {
            return "+";
        }
    }

    // ~~

    String GetValueText(
        LANGUAGE language
        )
    {
        String
            value_text;

        if ( IsMultiplicative )
        {
            value_text = language.GetRealText( Value.toDouble() * 0.1, 0, 1 );
        }
        else
        {
            value_text = Value.toString();
        }

        return value_text;
    }

    // ~~

    String GetText(
        LANGUAGE language
        )
    {
        return
            GetOperatorText()
            + GetValueText( language );
    }

    // -- OPERATIONS

    void SetFromJson(
        Map<String, dynamic> json_dynamic_map
        )
    {
        Value = json_dynamic_map[ "Value" ];
        IsMultiplicative = json_dynamic_map[ "IsMultiplicative" ];
    }

    // ~~

    void Fix(
        )
    {
        if ( IsMultiplicative )
        {
            if ( Value < 10 )
            {
                Value = 10;
            }
            else if ( Value > 50 )
            {
                Value = 50;
            }
        }
        else
        {
            if ( Value < 1 )
            {
                Value = 1;
            }
        }
    }
}
