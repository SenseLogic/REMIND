// -- TYPES

// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies

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
