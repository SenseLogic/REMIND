// -- IMPORTS

import "package:flutter/material.dart";
import "package:influx/influx.dart";
import "package:flutter/services.dart";
import "package:share_plus/share_plus.dart";
import "../DATA/backup.dart";
import "../DATA/json.dart";
import "backup_list_page.dart";

// -- TYPES

class BACKUP_LIST_STATE extends State<BACKUP_LIST_PAGE> implements ModelView
{
    // -- CONSTRUCTORS

    BACKUP_LIST_STATE(
        ) :
        super()
    {
    }

    // -- OPERATIONS

    void RestoreBackup(
        BuildContext build_context,
        BACKUP backup
        )
    {
        showDialog<bool>(
            context: build_context,
            builder:
                ( BuildContext build_context )
                {
                    return AlertDialog(
                        title: widget.Data.GetAlertText(
                            widget.Data.GetText( "Do you want to restore the application data from this backup?" )
                            ),
                        content: widget.Data.GetMediumText(
                            widget.Data.GetText( "All current data will be lost." )
                            ),
                        actions: <Widget>[
                            TextButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "CANCEL" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        Navigator.pop( context, false);
                                    }
                                ),
                            TextButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "RESTORE" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        setState(
                                            ()
                                            {
                                                widget.Data.Restore( backup.FilePath );
                                            }
                                            );

                                        Navigator.pop( context, true );
                                    }
                                )
                        ]
                        );
                }
            );

    }

    // ~~

    void DeleteBackup(
        BuildContext build_context,
        BACKUP backup
        )
    {
        showDialog<bool>(
            context: build_context,
            builder:
                ( BuildContext build_context )
                {
                    return AlertDialog(
                        title: widget.Data.GetMediumText(
                            widget.Data.GetText( "Do you want to delete this backup?" )
                            ),
                        actions: <Widget>[
                            TextButton(
                                child: widget.Data.GetMediumText(
                                    widget.Data.GetText( "CANCEL" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        Navigator.pop( context, false);
                                    }
                                ),
                            TextButton(
                                child: widget.Data.GetMediumText(
                                    widget.Data.GetText( "DELETE" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        setState(
                                            ()
                                            {
                                                widget.Data.RemoveBackup( backup );
                                            }
                                            );

                                        Navigator.pop( context, true );
                                    }
                                )
                        ]
                        );
                }
            );
    }

    // ~~

    Widget GetBackupWidget(
        BuildContext build_context,
        BACKUP backup
        )
    {
        return Row(
            children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            widget.Data.GetMediumText(
                                widget.Data.Language.GetDateTime( backup.DateTime_ )
                                )
                            ),
                        onTap:
                            ()
                            {
                                RestoreBackup( build_context, backup );
                            }
                        )
                    ),
                GestureDetector(
                    child: widget.Data.GetPaddedIcon(
                        const Icon( Icons.delete )
                        ),
                    onTap:
                        ()
                        {
                            DeleteBackup( build_context, backup );
                        }
                    )
                ]
            );
    }

    // ~~

    Center GetNewBackupWidget(
        )
    {
        return Center(
            child: widget.Data.GetColoredButton(
                IconButton(
                    icon: const Icon(
                        Icons.add,
                        size: 32.0
                        ),
                    onPressed:
                        ()
                        {
                            setState(
                                ()
                                {
                                    widget.Data.Backup();
                                }
                                );
                        }
                    )
                )
            );
    }

    // ~~

    void ShareDatabase(
        )
    {
        Share.share(
            widget.Data.GetIndentedJsonText()
            );
    }

    // ~~

    void ExportDatabase(
        BuildContext build_context
        )
    {
        showDialog<bool>(
            context: build_context,
            builder:
                ( BuildContext build_context )
                {
                    return AlertDialog(
                        title: widget.Data.GetAlertText(
                            widget.Data.GetText( "Do you want to export the application data into the clipboard?" )
                            ),
                        actions: <Widget>[
                            TextButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "CANCEL" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        Navigator.pop( context, false);
                                    }
                                ),
                            TextButton(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "EXPORT" )
                                    ),
                                onPressed:
                                    ()
                                    {
                                        setState(
                                            ()
                                            {
                                                Clipboard.setData(
                                                    ClipboardData( text: widget.Data.GetIndentedJsonText() )
                                                    );
                                            }
                                            );

                                        Navigator.pop( context, true );
                                    }
                                )
                            ]
                        );
                }
            );
    }

    // ~~

    void ImportDatabase(
        BuildContext build_context
        )
    {
        String
            json_text;

        Clipboard.getData( "text/plain" ).then(
            ( ClipboardData? clipboard_data )
            {
                if ( clipboard_data != null )
                {
                    json_text = JSON.GetPackedText( clipboard_data.text! );

                    if ( widget.Data.IsValidJsonText( json_text ) )
                    {
                        showDialog<bool>(
                            context: build_context,
                            builder:
                                ( BuildContext build_context )
                                {
                                    return AlertDialog(
                                        title: widget.Data.GetAlertText(
                                            widget.Data.GetText( "Do you want to import the application data from the clipboard?" )
                                            ),
                                        actions: <Widget>[
                                            TextButton(
                                                child: widget.Data.GetButtonText(
                                                    widget.Data.GetText( "CANCEL" )
                                                    ),
                                                onPressed:
                                                    ()
                                                    {
                                                        Navigator.pop( context, false);
                                                    }
                                                ),
                                            TextButton(
                                                child: widget.Data.GetButtonText(
                                                    widget.Data.GetText( "IMPORT" )
                                                    ),
                                                onPressed:
                                                    ()
                                                    {
                                                        setState(
                                                            ()
                                                            {
                                                                widget.Data.SetFromJsonText( json_text );
                                                                widget.Data.JsonText = "";
                                                            }
                                                            );

                                                        Navigator.pop( context, true );
                                                    }
                                                )
                                            ]
                                        );
                                }
                            );
                    }
                    else
                    {
                        showDialog<bool>(
                            context: build_context,
                            builder:
                                ( BuildContext build_context )
                                {
                                    return AlertDialog(
                                        title: widget.Data.GetAlertText(
                                            widget.Data.GetText( "The application data can't be imported because the clipboard content has an invalid format." )
                                            ),
                                        actions: <Widget>[
                                            TextButton(
                                                child: widget.Data.GetButtonText(
                                                    widget.Data.GetText( "CONTINUE" )
                                                    ),
                                                onPressed:
                                                    ()
                                                    {
                                                        Navigator.pop( context, false);
                                                    }
                                                )
                                            ]
                                        );
                                }
                            );
                    }
                }
            }
            );
    }

    // ~~

    Widget GetDatabaseWidget(
        BuildContext build_context
        )
    {
        return Row(
            children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            Center(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "SHARE" )
                                    )
                                )
                            ),
                        onTap:
                            ()
                            {
                                ShareDatabase();
                            }
                        )
                    ),
                const SizedBox( width: 10.0 ),
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            Center(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "EXPORT" )
                                    )
                                )
                            ),
                        onTap:
                            ()
                            {
                                ExportDatabase( build_context );
                            }
                        )
                    ),
                const SizedBox( width: 10.0 ),
                Expanded(
                    child: GestureDetector(
                        child: widget.Data.GetPaddedColoredButton(
                            Center(
                                child: widget.Data.GetButtonText(
                                    widget.Data.GetText( "IMPORT" )
                                    )
                                )
                            ),
                        onTap:
                            ()
                            {
                                ImportDatabase( build_context );
                            }
                        )
                    )
                ]
            );
    }

    // ~~

    @override
    Widget build(
        BuildContext build_context
        )
    {
        ModelViewManager.addView( this );

        return Scaffold(
            appBar: AppBar(
                title: widget.Data.GetTitleText(
                    widget.Data.GetText( "BACKUPS" )
                    )
                ),
            body: SafeArea(
                minimum: EdgeInsets.all( widget.Data.PagePadding ),
                child: ListView(
                    children: <Widget>[
                        Column(
                            children: widget.Data.BackupList.map<Widget>(
                                ( BACKUP backup )
                                {
                                    return GetBackupWidget( build_context, backup );
                                }
                                ).toList()
                            ),
                        const SizedBox(
                            height: 8.0
                            ),
                        GetNewBackupWidget(),
                        const SizedBox(
                            height: 8.0
                            ),
                        GetDatabaseWidget( build_context )
                        ]
                    )
                ),
            drawer: widget.ApplicationState.GetDrawer( build_context )
            );
    }

    // ~~

    @override
    void dispose(
        )
    {
        ModelViewManager.removeView( this );

        super.dispose();
    }

    // ~~

    @override
    List<dynamic> getModelList(
        )
    {
        return [];
    }

    // ~~

    @override
    void updateView(
        )
    {
        setState( () {} );
    }
}
