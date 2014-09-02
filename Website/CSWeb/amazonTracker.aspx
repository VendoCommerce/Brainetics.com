<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="amazonTracker.aspx.cs" Inherits="CSWeb.amazonTracker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:SqlDataSource ID="dsClicks" runat="server" ConnectionString="Data Source=CS-DEVDB1\CSDEVSQL1;Initial Catalog=Brainetics.com;Integrated Security=True" DeleteCommand="DELETE FROM [AmazonClicks] WHERE [ID] = @ID" InsertCommand="INSERT INTO [AmazonClicks] ([VersionID], [ClickDate], [Url]) VALUES (@VersionID, getdate(), @Url)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [AmazonClicks]" UpdateCommand="UPDATE [AmazonClicks] SET [VersionID] = @VersionID, [ClickDate] = @ClickDate, [Url] = @Url WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="VersionID" Type="Int32" />
                <asp:Parameter Name="Url" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="VersionID" Type="Int32" />
                <asp:Parameter Name="ClickDate" Type="DateTime" />
                <asp:Parameter Name="Url" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
