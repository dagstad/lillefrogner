

Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Namespace KDM.Utilities

    Public Class Util
        Dim QID As String

        'Hvis overført url er blank returneres en alternativ url som imgURL  
        Public Shared Function imgURL(ByVal url As String, ByVal alt As String) As String
            If url > "" Then imgURL = url Else imgURL = alt
        End Function

        'Returnerer en åpnet tilknytning til lillefrogner databasen
        Public Shared Function LFConn() As SqlConnection
            Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("lillefrognerConnectionString").ConnectionString)
            conn.Open() 'tilknytning åpnet
            Return conn
        End Function

        'Utfører en spørring mot lillefrogner og returnerer en enkeltverdi
        'Hvis spørringen ikke genererer resultat, returneres blank streng
        Public Shared Function LFExec(ByVal SQL As String) As String
            Dim cmd As New SqlCommand(SQL, LFConn)
            LFExec = Convert.ToString(cmd.ExecuteScalar())
            cmd.Connection.Close()
        End Function

        ''Returnerer en åpnet tilknytning til lillefrogner databasen
        'Public Shared Function UsersConn() As SqlConnection
        '    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("users").ConnectionString)
        '    conn.Open() 'tilknytning åpnet
        '    Return conn
        'End Function

        ''Utfører en spørring mot lillefrogner og returnerer en enkeltverdi
        ''Hvis spørringen ikke genererer resultat, returneres blank streng
        'Public Shared Function UsersExec(ByVal SQL As String) As String
        '    Dim cmd As New SqlCommand(SQL, UsersConn)
        '    UsersExec = Convert.ToString(cmd.ExecuteScalar())
        '    cmd.Connection.Close()
        'End Function

        

    End Class
    
End Namespace

