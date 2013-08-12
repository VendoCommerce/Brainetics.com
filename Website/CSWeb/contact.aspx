<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.contact" EnableSessionState="True" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CycleVitamins - A Complete Multivitamin designed for where your body is at in your cycle!</title>
<meta name="description" content="CycleVitamins are a multivitamin system for women formulated for each day of your cycle." />
<meta name="keywords" content="Vitamins, multivitamins, PMS, bloating, low energy, bone health, brain health, heart health" />
<link href="/Styles/cyclevitaminsglobal.css" rel="stylesheet" type="text/css" media="all" />


</head>
<body>
<form runat="server" id="billing1">
            <asp:ScriptManager ID="Scriptmanager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

<uc:Header ID="Header" runat="server" />


<div id="stretch_container">
<div id="content_bottom_bg">
  <div id="other_left">
  <div id="left_txt">
     <h2>Contact Us</h2>
     <p><strong>Customer Service:</strong> 1-877-355-6637; M-F 5a-5p PST<br />
       <strong>Email:</strong> <a href="mailto:cyclevitamins@webcsr.info">cyclevitamins@webcsr.info</a>     </p>
     <p>&nbsp;</p>
     <div id="contact_form" runat="server" visible="false">
       
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="address_table">
  
  <tr>
    <td><span class="error">Sample error message</span>
    <label for="textfield" class="address_label">* First Name</label>
      <input type="text" name="textfield" class="address_input" /></td>
    <td><label for="textfield" class="address_label">* Last  Name</label>
      <input type="text" name="textfield" class="address_input"  /></td>
  </tr>
  <tr>
    <td><label for="textfield" class="address_label">* Email Address</label>
      <input type="text" name="textfield" class="address_input"  /></td>
    <td><span class="address_label">* Re-type Email Address</span>      <input type="text" name="textfield" class="address_input"  /></td>
  </tr>
  <tr>
    <td><label for="textfield" class="address_label">Phone Number</label>
      <input type="text" name="textfield" class="address_input"  /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><label for="textfield" class="address_label">* Message</label>
      <textarea class="address_input2" cols="" rows=""></textarea></td>
    </tr>
  <tr>
    <td colspan="2" align="right"><input name="" type="image" src="/Content/images/btn_submit.gif" /></td>
  </tr>
 
  </table>

</div>
     <p>&nbsp;</p>
     <p>&nbsp;</p>
  </div>
  
  </div> 
 <div id="home_right">
 
               


</div><div id="clear"></div>
  

</div>
</div>
<!-- end stretch_container -->
<uc:BottomCTA ID="BottomCTA" runat="server" />

<div id="footer">
<uc:Footer ID="Footer" runat="server" />
</div>
<!-- end footer -->


<uc:TrackingPixels ID="TrackingPixels" runat="server" />

</ContentTemplate>
            </asp:UpdatePanel>
            </form>
</body>
</html>
