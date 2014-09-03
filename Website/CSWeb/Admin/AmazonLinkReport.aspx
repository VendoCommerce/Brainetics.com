<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmazonLinkReport.aspx.cs" Inherits="CSWeb.Admin.AmazonLinkReport" EnableSessionState="True" EnableEventValidation="false" %>

<%@ Register TagPrefix="usercontrols" TagName="RangeDateControl" Src="~/usercontrols/RangeDateControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Brainetics - SID Report</title>
    <script type="text/javascript">
        function removejscssfile(filename, filetype) {
            var targetelement = (filetype == "js") ? "script" : (filetype == "css") ? "link" : "none" //determine element type to create nodelist from
            var targetattr = (filetype == "js") ? "src" : (filetype == "css") ? "href" : "none" //determine corresponding attribute to test for
            var allsuspects = document.getElementsByTagName(targetelement)
            for (var i = allsuspects.length; i >= 0; i--) { //search backwards within nodelist for matching elements to remove
                if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(filename) != -1)
                    allsuspects[i].parentNode.removeChild(allsuspects[i]) //remove element by calling parentNode.removeChild()
            }
        }

    </script>
    <link href="/Styles/midstyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="outerwrap2">
        <div id="header2">
            <div id="logo">
                <img src="//d1f7jvrzd4fora.cloudfront.net/images/conversion_logo.jpg" width="238" height="62" />

            </div>
            <!-- end logo -->
           
            <!-- end log_link -->
            <div id="report_nav">
                <a href="VersionReport.aspx">Version Report</a> | <a href="Reports.aspx">
                    Standard Report</a> | <a href="SIDReport.aspx">SID Report</a> | <span class="current">Amazon Link Report</span> 
            </div>
            <div id="log_link">
                <a id="lnk_logout" href="Logout.aspx">Logout</a></div>
        </div>
        <!-- end header -->
        <div id="main2">
            <div id="date2">
                <p class="day">
                    <asp:Literal ID="liHeader" runat="server" />
                    </p>

                <p class="time">
                    <asp:Literal ID="liSubHeader" runat="server" /></p>
            </div>
            <div id="left">
                <div id="client">
                    <h2>
                    </h2>
                    <div id="client_logo">
                        <asp:Image ID="imgLogo" runat="server"  /></div>
                </div>
                <div id="retrieve_activity">
                    <h2>
                    </h2>
                    <div id="activity_select">
                        <p>
                            Select range:</p>
                        <p>
                            <usercontrols:RangeDateControl ID="rangeDateControlCriteria" runat="server" DisplayDropDown="true" StartDateWidth="115" EndDateWidth="115"
                                LabelStartText="From:" LabelEndText="To:" PostbackFunction="btnSubmit" />
                        <div class="clear">
                        </div>
                        
                        <p>
                            &nbsp;
                        </p>
                        <p>
                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" /></p>
                        <p>
                            &nbsp;
                        </p>
                    </div>
                </div>
            </div>
            <!-- end left -->
                        <div id="right2">
                <h2>
                </h2>
                <!-- end summary header -->
                <div class="table_pad2">
                    <br />
                    <asp:GridView ID="gvLinkReport" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="dsAmazonLinks" GridLines="Vertical" Height="108px" Width="203px">
                        <AlternatingRowStyle BackColor="Gainsboro" />
                        <Columns>
                            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                            <asp:BoundField DataField="Clicks" HeaderText="Clicks" ReadOnly="True" SortExpression="Clicks" />
                        </Columns>
                        <EmptyDataTemplate>
                            No data exists for the selected period.
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="dsAmazonLinks" runat="server" ConnectionString="Data Source=CS-DEVDB1\CSDEVSQL1;Initial Catalog=Brainetics.com;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT COUNT(AmazonClicks.ID) AS Clicks, Version.Title AS Version FROM AmazonClicks INNER JOIN Version ON AmazonClicks.VersionID = Version.VersionID WHERE (AmazonClicks.ClickDate &gt;= @from ) AND (AmazonClicks.ClickDate &lt;= @to ) GROUP BY Version.Title">
                        <SelectParameters>
                            <asp:Parameter Name="from" />
                            <asp:Parameter Name="to" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <!-- end summary table -->
                </div>
                <!-- end table_pad -->
                <!-- end right -->
                <div class="clear">
                </div>
            </div>
            <div class="clear">
            </div>
    </div>
    <!-- end outerwrap -->
     </form>
</body>
</html>
