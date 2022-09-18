// -- IMPORTS

// -- TYPES

class DATE
{
    // -- ATTRIBUTES

    int
        Year,
        Month,
        Day;

    // -- CONSTRUCTORS

    DATE(
        int year,
        int month,
        int day
        ) :
        Year = year,
        Month = month,
        Day = day
    {
    }

    // ~~

    DATE.FromDateTime(
        DateTime date_time
        ) :
        Year = date_time.year,
        Month = date_time.month,
        Day = date_time.day
    {
    }

    // -- OPERATORS

    bool IsEqual(
        DATE date
        )
    {
        return
            Year == date.Year
            && Month == date.Month
            && Day == date.Day;
    }

    // ~~

    bool IsLower(
        DATE date
        )
    {
        return
            Year < date.Year
            || ( Year == date.Year
                 && ( Month < date.Month
                      || ( Month == date.Month
                           && Day < date.Day ) ) );
    }

    // ~~

    bool IsHigher(
        DATE date
        )
    {
        return date.IsLower( this );
    }

    // ~~

    bool IsLowerEqual(
        DATE date
        )
    {
        return !IsHigher( date );
    }

    // ~~

    bool IsHigherEqual(
        DATE date
        )
    {
        return !IsLower( date );
    }

    // -- INQUIRIES

    int GetComparison(
        DATE date
        )
    {
        if ( IsEqual( date ) )
        {
            return 0;
        }
        else if ( IsLower( date ) )
        {
            return -1;
        }
        else
        {
            return 1;
        }
    }

    // ~~

    DateTime GetDateTime(
        )
    {
        return DateTime.utc( Year, Month, Day );
    }

    // ~~

    DATE GetSum(
        int day_count
        )
    {
        return DATE.FromDateTime( GetDateTime().add( Duration( days: day_count ) ) );
    }

    // ~~

    int GetDifference(
        DATE date
        )
    {
        return GetDateTime().difference( date.GetDateTime() ).inDays;
    }

    // ~~

    static DATE GetCurrentDate(
        )
    {
        DateTime
            current_date_time;

        current_date_time = DateTime.now();

        return DATE( current_date_time.year, current_date_time.month, current_date_time.day );
    }
}
