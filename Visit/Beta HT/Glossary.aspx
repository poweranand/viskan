<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Glossary.aspx.cs" Inherits="HistoricalSpots" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Glossary</title>
    <link href="StyleSheet/StyleSheet.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td align="center">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" width="1000px">
                                <tr>
                                    <td>
                                        <%--<asp:Image ID="imgBanner" runat="server" />--%>
                                        <img src="Images/Banner.jpg" width="1000px" height="212px" alt="Banner" />
                                    </td>
                                </tr><tr style="height: 1px">
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url('Images/Linkbg.png'); background-position: center;
                                        background-repeat: repeat-x; height: 37px;">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 13%; border-right: 1px solid #ffffff; text-align: center;">
                                                    <a href="index.aspx" class="links">Home</a>
                                                </td>
                                               <td style="width: 13%; border-right: 1px solid #ffffff; text-align: center;">
                                                     <a href="aboutkanchipuram.html" class="links">Kanchi At A Glance</a>
													
                                                </td>
                                                <td style="width: 13%; border-right: 1px solid #ffffff; text-align: center;">
												<a href="HistoricalSpots.aspx" class="links">Historical Spots</a>
                                                                                                   </td>
                                                <td style="width: 20%; border-right: 1px solid #ffffff; text-align: center;">
                                                    <a href="LegendaryPersonalities.aspx" class="links">Legendary Personalities</a>
                                                </td>
                                                <td style="width: 13%; border-right: 1px solid #ffffff; text-align: center;">
                                                    <a href="Festivals.aspx" class="links">Festivals</a>
                                                </td>
                                                <td style="width: 13%; border-right: 1px solid #ffffff; text-align: center;">
                                                    <a href="touristinfo.html" class="links">Tourist Info</a>                                                </td>
                                                <td style="width: 14%; text-align: center;">
                                                    <a href="#" class="links" style="color: Yellow;">Glossary</a>
                                                </td>
                                                 
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="height: 10px">
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="txtHead" style="font-size: 20px;">
                                        
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                             Glossary
                                            </td>
                                            <td align="right" valign="middle" style="float:right;">
                                                <div style="float:right;">
                                                    <a href="http://www.twitter.com/visitkanchi" target="_blank" name="" style="position:relative;"><img border="0" src="http://twitter-badges.s3.amazonaws.com/twitter-c.png" alt="Follow visitkanchi on Twitter" title=""></a>
                                                </div> 
                                                <div style="float:right;">
                                                    <strong class="contentcenter txt" style="font-weight:bold;  text-align:inherit; font-size:13px;">Follow Us:</strong>    
                                                </div>                                                            
                                            </td>
                                        </tr>
                                   </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url('Images/Hori_Border.jpg'); height: 2px; background-position: top;
                                        background-repeat: repeat-x;">                                        
                                    </td>
                                </tr>
                                <tr style="height: 12px">
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>                                                
                                                <td style="width:200px; text-align:left; vertical-align:middle;">
                                                    <asp:TextBox ID="txtSearchTerm" CssClass="textbox" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align:left; vertical-align:middle; padding-top:4px;">&nbsp;<asp:ImageButton ImageUrl="~/Images/SearchBtn.png" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />&nbsp;<asp:ImageButton ImageUrl="~/Images/ClearBtn.png" ID="btnClear" runat="server" OnClick="btnClear_Click" /></td>
                                            </tr>
                                        </table>                                         
                                        <asp:Label ID="Label1" runat="server" CssClass="BannerHead" Text="No Matches Found." Visible="False"></asp:Label></td>
                                </tr>
                                <tr style="height: 12px">
                                    <td>
                                    </td>
                                </tr>                               
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:GridView ID="grdGlossary" runat="server"  AutoGenerateColumns="false" Width="100%" BorderColor="#ECE9D8" BorderWidth="1">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Term" HeaderStyle-CssClass="Gridheadertext">
                                                    <ItemTemplate>
                                                          <table border="0" cellpadding="0" cellspacing="0" width="150">
                                                            <tr>
                                                                <td class="Gridtxt">
                                                                   <asp:Label ID="lblGrdGlossaryID" runat="server" Visible="false" Text='<%# bind("GlossaryID") %>'></asp:Label>
                                                                   <asp:Label ID="lblGrdGlossaryTerm" runat="server" Text='<%# bind("Term") %>'></asp:Label> 
                                                                </td>
                                                            </tr>
                                                          </table>                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description" HeaderStyle-CssClass="Gridheadertext">
                                                    <ItemTemplate>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="850px">
                                                            <tr>
                                                                <td class="Gridtxt"><asp:Label ID="lblGrdGlossaryDescription" runat="server" Text='<%# bind("Description") %>'></asp:Label></td>
                                                            </tr>
                                                        </table>                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                               <tr><td colspan="3" align="center"  valign="top"><div class="footermenu">
									  <ul><li><a href="aboutus.html">About Us</a></li><li><a href="contact.html">Contact Us</a></li>
									  <li><a href="disclaimer.html">Disclaimer</a></li>
									  </ul></div></td></tr>
                                <tr style="background-color: #55645D; height: 24px;">
                                    <td align="center" class="copy" style="color: White;">
                                        Powered by : <span class="powered"><a href="http://www.p2softech.com"  target="_blank">P2Softech
                                    </a></span>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

