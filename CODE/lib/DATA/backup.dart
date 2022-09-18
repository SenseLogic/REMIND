// -- TYPES

class BACKUP
{
    // -- ATTRIBUTES

    String
        FilePath;
    DateTime
        DateTime_;

    // -- CONSTRUCTORS

    BACKUP(
        ) :
        FilePath = "",
        DateTime_ = DateTime.now()
    {
    }
}
