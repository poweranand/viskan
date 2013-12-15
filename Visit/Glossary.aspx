<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Glossary.aspx.cs" Inherits="HistoricalSpots" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Kanchipuram City, Kanchipuram History, Kanchipuram Mythology, Kanchipuram Glory, Kanchipuram Tour Guide, Pallava Dynasty, Pallava Capital</title>
    <link href="StyleSheet/StyleSheet.css" rel="Stylesheet" type="text/css" />
    
    <!--Google Analytics code-->
    <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-23756596-1']);
          _gaq.push(['_trackPageview']);
          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
           })();

    </script>
    <!--ends here-->

</head>
<body>
    <form id="form1" runat="server">
  
        <div>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="center">
							
                                    <table border="0" cellpadding="0" cellspacing="0" width="1000px">
									
									<tr class="topbg"><td align="right" valign="middle" > <div class="twitter"><a href="download/Tour_ Guide-Historical_ Spots_at_Kanchipuram.pdf" target="_blank"><img src="images/PDF.png" alt="Download Kanchipuram-Tour Guide" title="Download Kanchipuram-Tour Guide"/></a><a href="http://www.twitter.com/visitkanchi" target="_blank"><img src="images/twitter.png" alt="Follow visitkanchi on Twitter" title="Follow visitkanchi on Twitter"/></a></div>
                                           
                                       </td>  
									</tr>
									
                                        <tr>
                                            <td >
                                                <div class="staticheader"></div> </td>
                                        </tr>
                                       
                                        <tr>
                                                                              <td  class="menubg" valign="middle" >

                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                      <td  valign="top">
 <ul class="semiopaquemenu">
<li><a href="index.aspx" >Home</a></li>
<li><a href="aboutkanchipuram.html" >Kanchi At A Glance</a></li>
<li><a href="HistoricalSpots.aspx">Historical Spots</a></li>
<li><a href="LegendaryPersonalities.aspx">Legendary Personalities</a></li>
<li><a href="Festivals.aspx">Festivals</a></li>
<li><a href="touristinfo.html" >Tourist Info</a></li>
<li><a href="Glossary.aspx" class="selected">Glossary</a></li>
</ul>
                                    </td>
                                                      
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
										
										        <tr style="height: 10px">
                                    <td >
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="txtHead" style="font-size: 20px;">
                                        
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                             Glossary
                                            </td>
                                           
                                        </tr>
                                   </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-image: url('Images/Hori_Border.jpg'); height: 2px; background-position: top;
                                        background-repeat: repeat-x; ">                                        
                                    </td>
                                </tr>
                                <tr style="height: 12px">
                                    <td >
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" >
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>                                                
                                                <td style="width:200px; text-align:left; vertical-align:middle;">
                                                    <asp:TextBox ID="txtSearchTerm" CssClass="textbox" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align:left; vertical-align:middle; padding-top:4px;">&nbsp;<asp:ImageButton ImageUrl="Images/SearchBtn.png" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />&nbsp;<asp:ImageButton ImageUrl="Images/ClearBtn.png" ID="btnClear" runat="server" OnClick="btnClear_Click" /></td>
                                            </tr>
                                        </table>                                         
                                        <asp:Label ID="Label1" runat="server" CssClass="BannerHead" Text="No Matches Found." Visible="False"></asp:Label></td>
                                </tr>
                                <tr style="height: 12px">
                                    <td >
                                    </td>
                                </tr>                               
                                <tr>
                                    <td valign="top" align="left" >
                                        <asp:GridView ID="grdGlossary" runat="server"  AutoGenerateColumns="false" Width="98%" BorderColor="#ECE9D8" BorderWidth="1">
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
                                                        <table border="0" cellpadding="0" cellspacing="0" width="840">
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
                                    <td align="center" class="copy" style="color: White; ">
                                        Powered by : <span class="powered"><a href="http://www.p2softech.com"  target="_blank">P2Softech
                                    </a></span>
                                    </td>
                                </tr>
                            </table>
                        
              
        </table>
    </div>
    </form>
</body>
</html>

