// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies, camel_case_types, avoid_renaming_method_parameters

// -- IMPORTS

import "dart:math";
import "package:flutter/material.dart";

// -- TYPES

class HSV_COLOR
{
    // -- ATTRIBUTES

    late double
        Hue,
        Saturation,
        Value;

    // -- CONSTRUCTORS

    HSV_COLOR(
        double hue,
        double saturation,
        double value
        ) :
        Hue = hue,
        Saturation = saturation,
        Value = value
    {
    }

    // ~~

    HSV_COLOR.fromColor(
        Color color
        )
    {
        double
            blue,
            difference,
            green,
            maximum,
            minimum,
            red;

        red = color.red.toDouble() / 255.0;
        green = color.green.toDouble() / 255.0;
        blue = color.blue.toDouble() / 255.0;

        minimum = min( min( red, green ), blue );
        maximum = max( max( red, green ), blue );

        difference = maximum - minimum;

        Hue = maximum;
        Saturation = maximum;
        Value = maximum;

        if ( maximum == 0.0 )
        {
            Saturation = 0.0;
        }
        else
        {
            Saturation = difference / maximum;
        }

        if ( maximum == minimum )
        {
            Hue = 0;
        }
        else
        {
            if ( maximum == red )
            {
                Hue = ( green - blue ) / difference + ( ( green < blue ) ? 6.0 : 0.0 );
            }
            else if ( maximum == green )
            {
                Hue = ( blue - red ) / difference + 2.0;
            }
            else
            {
                Hue = ( red - green ) / difference + 4.0;
            }

            Hue /= 6.0;
        }
    }

    // -- INQUIRIES

    Color GetColor(
        )
    {
        double
            f,
            p,
            q,
            t;
        int
            i;

        i = ( Hue * 6.0 ).toInt();
        f = Hue * 6.0 - i.toDouble();
        p = Value * ( 1.0 - Saturation );
        q = Value * ( 1.0 - f * Saturation );
        t = Value * ( 1.0 - ( 1.0 - f ) * Saturation );

        i = i % 6;

        if ( i == 0 )
        {
            return Color.fromARGB(
                255,
                ( Value * 255 + 0.5 ).toInt(),
                ( t * 255 + 0.5 ).toInt(),
                ( p * 255 + 0.5 ).toInt()
                );
        }
        else if ( i == 1 )
        {
            return Color.fromARGB(
                255,
                ( q * 255 + 0.5 ).toInt(),
                ( Value * 255 + 0.5 ).toInt(),
                ( p * 255 + 0.5 ).toInt()
                );
        }
        else if ( i == 2 )
        {
            return Color.fromARGB(
                255,
                ( p * 255 + 0.5 ).toInt(),
                ( Value * 255 + 0.5 ).toInt(),
                ( t * 255 + 0.5 ).toInt()
                );
        }
        else if ( i == 3 )
        {
            return Color.fromARGB(
                255,
                ( p * 255 + 0.5 ).toInt(),
                ( q * 255 + 0.5 ).toInt(),
                ( Value * 255 + 0.5 ).toInt()
                );
        }
        else if ( i == 4 )
        {
            return Color.fromARGB(
                255,
                ( t * 255 + 0.5 ).toInt(),
                ( p * 255 + 0.5 ).toInt(),
                ( Value * 255 + 0.5 ).toInt()
                );
        }
        else
        {
            return Color.fromARGB(
                255,
                ( Value * 255 + 0.5 ).toInt(),
                ( p * 255 + 0.5 ).toInt(),
                ( q * 255 + 0.5 ).toInt()
                );
        }
    }

    // ~~

    String GetText(
        )
    {
        return Hue.toString() + "," + Saturation.toString() + "," + Value.toString();
    }
}
