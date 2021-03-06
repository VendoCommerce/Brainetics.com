﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomShippingList.aspx.cs"
    Inherits="CSWeb.Admin.CustomShippingList" MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">Define Versions</font> </span>
    <br />
    <br />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="Image4" runat="server" ImageUrl='//d1f7jvrzd4fora.cloudfront.net/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="link" NavigateUrl="CustomShipping.aspx"
                    Text="Add CustomShipping"></asp:HyperLink>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr>
            <td class="title" colspan="3">
                Custom Shipping List
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="40%" class="ibn-sectionheader">
                Country
            </td>
            <td align="left" width="30%" class="ibn-sectionheader">
                State
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlVersionList" OnItemCommand="dlVersionList_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlVersionList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                               <asp:Literal runat="server" ID='lblCountryTitle'></asp:Literal>
                               <asp:Label runat="server" ID='lblPrefId' Visible="false"></asp:Label>
                    </td>
                    <td class="body" align="left" width="30%">
                           <asp:Literal runat="server" ID='lblStateTitle'></asp:Literal>
                    </td>
                    <td nowrap align="center" width="10%">
                        <asp:HyperLink ID="hlEdit" runat="Server"><img title='Modify CustomShipping Options' src='//d1f7jvrzd4fora.cloudfront.net/images/admin/edit.gif' alt="Edit Shipping" border="0"></asp:HyperLink>&#160;
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="//d1f7jvrzd4fora.cloudfront.net/images/admin/delete.gif" BorderWidth="0"
                                ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:DataList>
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
        </tr>
    </table>
    <br />
</asp:Content>
