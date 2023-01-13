// -- IMPORTS

// ignore_for_file: camel_case_types, non_constant_identifier_names, empty_constructor_bodies

import "dart:math";
import "package:flutter/material.dart";

// -- TYPES

class HSL_COLOR
{
    // -- ATTRIBUTES

    late double
        Hue,
        Saturation,
        Lightness;

    // -- CONSTRUCTORS

    HSL_COLOR(
        double hue,
        double saturation,
        double lightness
        ) :
        Hue = hue,
        Saturation = saturation,
        Lightness = lightness
    {
    }

    // ~~

    HSL_COLOR.fromColor(
        Color color
        )
    {
        double
            average,
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

        average = ( maximum + minimum ) * 0.5;

        Hue = average;
        Saturation = average;
        Lightness = average;

        if ( maximum == minimum )
        {
            Hue = 0.0;
            Saturation = 0.0;
        }
        else
        {
            difference = maximum - minimum;

            if ( Lightness > 0.5 )
            {
                Saturation = difference / ( 2.0 - maximum - minimum );
            }
            else
            {
                Saturation = difference / ( maximum + minimum );
            }

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

    double GetComponent(
        double p,
        double q,
        double t
        )
    {
        if ( t < 0 )
        {
            t += 1;
        }

        if ( t > 1 )
        {
            t -= 1;
        }

        if ( t < 1.0 / 6.0 )
        {
            return p + ( q - p ) * 6.0 * t;
        }
        else if ( t < 1.0 / 2.0 )
        {
            return q;
        }
        else if ( t < 2.0 / 3.0 )
        {
            return p + ( q - p ) * ( 2.0 / 3.0 - t ) * 6.0;
        }
        else
        {
            return p;
        }
    }

    // ~~

    Color GetColor(
        )
    {
        double
            blue,
            green,
            p,
            q,
            red;

        if ( Saturation == 0.0 )
        {
            return Color.fromARGB(
                255,
                ( Lightness * 255.0 + 0.5 ).toInt(),
                ( Lightness * 255.0 + 0.5 ).toInt(),
                ( Lightness * 255.0 + 0.5 ).toInt()
                );
        }
        else
        {
            if ( Lightness < 0.5 )
            {
                q = Lightness * ( 1.0 + Saturation );
            }
            else
            {
                q = Lightness + Saturation - Lightness * Saturation;
            }

            p = 2.0 * Lightness - q;

            red = GetComponent( p, q, Hue + 1.0 / 3.0 );
            green = GetComponent( p, q, Hue );
            blue = GetComponent( p, q, Hue - 1.0 / 3.0 );

            return Color.fromARGB(
                255,
                ( red * 255.0 + 0.5 ).toInt(),
                ( green * 255.0 + 0.5 ).toInt(),
                ( blue * 255.0 + 0.5 ).toInt()
                );
        }
    }

    // ~~

    String GetText(
        )
    {
        return Hue.toString() + "," + Saturation.toString() + "," + Lightness.toString();
    }
}

