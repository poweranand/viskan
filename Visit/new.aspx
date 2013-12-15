<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index"
    EnableEventValidation="false" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Kanchipuram, Kanchipuram Online Travel Guide, Kanchipuram Tourist Places, Kanchipuram History Tour, Kanchipuram Online Tour Guide</title>
	<meta name="description" content="Visitkanchi.org offers a comprehensive online tour guide on the history, tradition, culture,  temples, food, arts, lifestyle of people in Kanchipuram. The site has a catalog of the various spots to visit in kanchipuram with a detailed write up on each of the spots." />
    <link href="StyleSheet/StyleSheet.css" rel="Stylesheet" type="text/css" />
  

    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0" cellspacing="0" width="1000px">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
									
									<tr class="topbg"><td align="right" valign="middle"> <div class="twitter"><a href="download/Tour_ Guide-Historical_ Spots_at_Kanchipuram.pdf" target="_blank"><img src="images/PDF.png" alt="Download Kanchipuram-Tour Guide" title="Download Kanchipuram-Tour Guide"/></a><a href="http://www.twitter.com/visitkanchi" target="_blank"><img src="images/twitter.png" alt="Follow visitkanchi on Twitter" title="Follow visitkanchi on Twitter"/></a></div>
                                              
                                       </td>  
									</tr>
									
									
									
									
                                        <tr>
												<td>
                                                <asp:Image ID="imgBanner" runat="server" Width="1000px" Height="180px" /></td>
                                        </tr>
                                       
                                        <tr>
                                                                               <td  class="menubg" valign="middle">

                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                         <td  valign="top">
 <ul class="semiopaquemenu">
<li><a href="index.aspx" class="selected">Home</a></li>
<li><a href="aboutkanchipuram.html" >Kanchi At A Glance</a></li>
<li><a href="HistoricalSpots.aspx">Historical Spots</a></li>
<li><a href="LegendaryPersonalities.aspx">Legendary Personalities</a></li>
<li><a href="Festivals.aspx">Festivals</a></li>
<li><a href="touristinfo.html">Tourist Info</a></li>
<li><a href="Glossary.aspx">Glossary</a></li>
</ul>
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
                                                           Home 
                                                        </td>
                                                  </tr>
                                                </table>                                                  
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url('Images/Hori_Border.jpg'); height: 2px; background-position: top;
                                                background-repeat: repeat-x;">
                                                <img src="Images/Empty.jpg" /></td>
                                        </tr>
                                        <tr style="height: 12px">
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <table border="0" cellpadding="0" cellspacing="5" width="100%">
                                                    <tr>
                                                        <td style="width: 253px; background-image: url('Images/Search.png'); background-position: top;
                                                            background-repeat: repeat-x;" valign="top">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                            <ContentTemplate>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr style="height: 45px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center" style="height: 22px">
                                                                                                      <img src="Images/icon_filter.gif" title="Main Filter: Select category from this drop down box to filter the list below" style="float:left; margin-left:5px;"  /> 
		 <asp:DropDownList ID="ddlSearchCategory" Width="220px" runat="server"  Height="20px"                                                                              AutoPostBack="True" OnSelectedIndexChanged="ddlSearchCategory_SelectedIndexChanged">
                                                                                                      </asp:DropDownList>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr style="height: 10px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">
                                                                                                    <img src="Images/icon_filter.gif" title="Sub Filter: Select a category value from this drop down box to filter the list below"  style="float:left;margin-left:5px;" />  
																									 
																									  <asp:DropDownList ID="ddlSearchCategory1" Width="220px" runat="server" Height="20px"
                                                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlSearchCategory1_SelectedIndexChanged">
                                                                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                                      </asp:DropDownList>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 10px;">
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="254">
                                                                                                <tr>
                                                                                                    <td align="left" style="width: 255px">
                                                                                                    
                                                                                                     <asp:TreeView ID="TreeView1" runat="server" 
                                                                                                            onselectednodechanged="TreeView1_SelectedNodeChanged" >  </asp:TreeView>
                                                                                                     
                                                                                                        <asp:GridView ID="grdSpotName" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging1"
                                                                                                            AllowPaging="true" OnRowCommand="Gridview_OnRowCommand1" OnRowDataBound="Gridview_RowDataBound1"
                                                                                                           
                                                                                                            PagerStyle-HorizontalAlign="Center" runat="server" BackColor="#F5F4E2" BorderColor="#D8DBBC"
                                                                                                            BorderStyle="Solid" BorderWidth="1px" Width="254px" CssClass="Linktxt" AlternatingRowStyle-CssClass="Linktxt">
                                                                                                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                                                                                            <RowStyle BackColor="White" CssClass="Linktxt" />
                                                                                                            <Columns>
                                                                                                                <asp:ButtonField CommandName="spotshow" Text="SingleClick" Visible="False" />
                                                                                                                <asp:TemplateField>
                                                                                                                    <ItemTemplate>
                                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                            <tr>
                                                                                                                                <td align="left" style="padding-left: 7px;">
                                                                                                                                    <asp:Label ID="lnkgrdSpotName" runat="server" CssClass="Linktxt" Text='<%# bind("spotname") %>'></asp:Label>
                                                                                                                                    <asp:LinkButton ID="lblgrdSpotNameId" CssClass="Linktxt" Visible="false" runat="server"
                                                                                                                                        Text='<%# bind("spotid") %>'></asp:LinkButton>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                                                                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" CssClass="Linktxt" />
                                                                                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                                                                                            <AlternatingRowStyle CssClass="Linktxt" />
                                                                                                        </asp:GridView>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height: 20px;">
                                                                    <td style="width: 253px; background-image: url('Images/BottomSearch.png'); background-position: top;
                                                                        background-repeat: repeat-x; height: 15px;" valign="top">
                                                                    </td>
                                                                </tr>
                                                                 <tr style="height: 12px">
                                                                    <td>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                               <a href="mailto:info@visitkanchi.org" style="border:none;">         <img src="Images/EmailEnquiry.gif"  style="border:none;"/></a>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                <td>
                                                                
                                                                </td>
                                                                
                                                                </tr>    
                                                            </table>
                                                        </td>
                                                        <td style="background-image: url('Images/Verti_Border.jpg'); width: 2px; background-position: top;
                                                            background-repeat: repeat-y;">&nbsp;
                                                            
                                                        </td>
                                                        <td valign="top" style="padding-left: 2px;">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td valign="top">
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 260px;">
                                                                                        <tr>
                                                                                            <td valign="top">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">                                                                                        
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                    <td style="width: 91px; height: 85px;" valign="top">
                                                                                                                        <img src="Images/TextImage.jpg" alt="" /></td>
                                                                                                                    <td align="left" valign="top">
                                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                             <tr>
                                                                                                                                <td align="left" class="txt" style="padding-right: 8px; padding-left: 8px;  color:Black; font-weight:bold; font-size:14px;" valign="top">
                                                                                                                                     Welcome to the Historical Gateway of South India
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                             <tr style="height: 10px;">
                                                                                                                                <td>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                            <tr>
                                                                                                                                <td class="txt" style="padding-left: 8px; padding-right: 8px;">Kanchipuram, one of the ancient cities of India, has a continuous history of more than 2000 years. It breathed through the ancient, medieval and modern periods of history. Its location as a frontier </td>
                                                                                                                            </tr>
                                                                                                                        </table>                                                                                                           
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                            town in the northern border of Tamil Nadu has made it a ‘meeting point and melting pot’ of various historical currents of south India.
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style="height: 10px;">
                                                                                                        <td>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                             Kanchi was an important transit point, where traders and travelers from far away places came in and spread out. It was an unparallel learning centre where scholars from distant regions poured in to acquire knowledge.  It was a critical war zone, where rulers of southern dynasties settled scores first, before proceeding to expand their empires. It served as a broad forum, where saints of various religions debated their philosophies before proceeding to reign over the minds of the people.  
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style="height: 10px;">
                                                                                                        <td>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                            In Kanchi, goods as well as ideas were exchanged; dynasties as well as religions fought for supremacy.  It was a place of confluence and influence; convergence and divergence. It also became a fertile ground for new social forces to root and blossom.  In its long evolution, Kanchi got a mystic color of sacredness. The history of Kanchi has to be necessarily seen through the mist of mythical stories associated with it.  Ancient texts declare only seven places to be holy in India. Among them Kanchi is the only one in the south – most living and vibrant. Hence, it can rightly be called as the ‘Historical Gateway to South India’. Explore Kanchi – Discover the soul of South India.    
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style="height: 10px;">
                                                                                                        <td>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="padding-right: 5px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                    <td align="left" class="txt" style="padding-right: 8px; border: 1px solid #F3E2AF; padding: 10px; background-color: #FFFFCE" valign="top">
                                                                                                                        This portal has information about
                                                                                                                        <a href="HistoricalSpots.aspx" style="text-decoration:none;">
                                                                                                                            <b style="color: #000000">
                                                                                                                                <asp:Label ID="lblSpot" runat="server"></asp:Label>
                                                                                                                                Historical Spots
                                                                                                                            </b>
                                                                                                                        </a>, 
                                                                                                                        <a href="Festivals.aspx" style="text-decoration:none;">
                                                                                                                            <b style="color: #000000">
                                                                                                                               <asp:Label ID="lblFest" runat="server"></asp:Label>
                                                                                                                               Festivals
                                                                                                                            </b>
                                                                                                                        </a>and 
                                                                                                                        <a href="LegendaryPersonalities.aspx" style="text-decoration:none;"><b style="color: #000000">
                                                                                                                            <asp:Label ID="lblLp" runat="server"></asp:Label>
                                                                                                                            Legendary Personalities</b>
                                                                                                                        </a> associated with Kanchipuram.
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style="height: 10px;">
                                                                                                        <td>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="background-image: url('Images/Verti_Border.jpg'); width: 2px; background-position: top;
                                                                                    background-repeat: repeat-y;">&nbsp;
                                                                                    
                                                                                </td>
                                                                                <td style="width: 224px; height: 260px; padding-left: 7px;" valign="top">
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center"> 
                                                                                                <a href="HistoricalSpots.aspx">
                                                                                                    <img src="Images/Historical.jpg" width="224px" alt="Historical Spots" style="border: 0px solid #ffffff;" />
                                                                                                </a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center"> 
                                                                                                 <a href="LegendaryPersonalities.aspx">
                                                                                                    <img src="Images/Lengendary.jpg" width="224px" alt="Legendary Personalities" style="border: 0px solid #ffffff;" />
                                                                                                 </a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center"> 
                                                                                               <a href="Festivals.aspx">
                                                                                                    <img src="Images/Festivals.jpg" width="224px" alt="Festivals" style="border: 0px solid #ffffff;" />
                                                                                               </a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center"> 
                                                                                               <a href="performingarts.html">
                                                                                        <img src="Images/PERFORMING.jpg" alt="Performing Arts" width="224px" border="0" style="border: 0px solid #ffffff;" /></a>                                                                                            </td>
                                                                                        </tr>
                                                                                         <tr>
                                                                                            <td align="center"> 
                                                                                               <a href="HeritageHouses1.html">
                                                                                        <img src="Images/Heritage House.jpg" alt="Heritage House" width="224px" border="0" style="border: 0px solid #ffffff;" /></a>                                                                                            </td>
																						
																						
																						
																						
																						
																						<tr>
																						<td align="center"> 
                                                                                               <a href="silks.html">
                                                                                        <img src="Images/SILKS.jpg" alt="Heritage House" width="224px" border="0" style="border: 0px solid #ffffff;" /></a>                                                                                         </td>
																						</tr>
																						<tr><td align="center"> 
                                                                                               <a href="TraditionalFood.html">
                                                                                        <img src="Images/FOOD.jpg" alt="Heritage House" width="224px" border="0" style="border: 0px solid #ffffff;" /></a>                                                                                            </td>
																						</tr>
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																						
																					
                                                                                        <tr>
                                                                                            <td style="width: 224px; background-image: url('Images/Calender.png'); background-position: top;
                                                                                                background-repeat: repeat-x; height: 45px;" valign="top">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr style="height: 35px;">
                                                                                                        <td valign="middle" align="left">
                                                                                                            <asp:Label runat="server" ID="Lbl_Festival" CssClass="BannerHead"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="center">
                                                                                                            <asp:GridView ID="grdFestival" ShowHeader="false" AutoGenerateColumns="false" runat="server"
                                                                                                                BackColor="#F5F4E2" BorderColor="#D8DBBC" OnPageIndexChanging="gridPageChanging"
                                                                                                                AllowPaging="true" OnRowCommand="Gridview_OnRowCommand" OnRowDataBound="Gridview_RowDataBound"
                                                                                                                PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next"
                                                                                                                PagerSettings-PreviousPageText="Previous" PagerSettings-Mode="NextPreviousFirstLast"
                                                                                                                PagerStyle-HorizontalAlign="Center" BorderStyle="Solid" BorderWidth="1px" Width="224px"
                                                                                                                CssClass="Linktxt" AlternatingRowStyle-CssClass="Linktxt">
                                                                                                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                                                                                                <RowStyle BackColor="White" CssClass="Linktxt" />
                                                                                                                <Columns>
                                                                                                                    <asp:ButtonField CommandName="Festshow" Text="SingleClick" Visible="False" />
                                                                                                                    <asp:TemplateField>
                                                                                                                        <ItemTemplate>
                                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                                <tr>
                                                                                                                                    <td align="left" style="padding-left: 7px;">
                                                                                                                                        <asp:Label ID="grdFestName" runat="server" Text='<%# bind("name") %>'></asp:Label>
                                                                                                                                        <asp:LinkButton ID="lblgrdFestId" Visible="false" runat="server" Text='<%# bind("festivalid") %>'></asp:LinkButton>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </table>
                                                                                                                        </ItemTemplate>
                                                                                                                    </asp:TemplateField>
                                                                                                                </Columns>
                                                                                                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                                                                                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" CssClass="Linktxt" />
                                                                                                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                                                                                                <AlternatingRowStyle CssClass="Linktxt" />
                                                                                                            </asp:GridView>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style="height: 20px;">
                                                                                                        <td style="width: 224px; background-image: url(Images/FestivalBottom.png); background-position: top;
                                                                                                            background-repeat: repeat-x; height: 15px;" valign="top">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height: 7px;">
                                                                    <td>
                                                                    </td>
                                                                </tr>                                                                                                                              
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                       <tr><td colspan="3" align="center"  valign="top"><div class="footermenu">
									  <ul><li><a href="aboutus.html">About Us</a></li><li><a href="contact.html">Contact Us</a></li>
									  <li><a href="disclaimer.html">Disclaimer</a></li>
									  </ul></div></td></tr>
                                        <tr style="background-color: #55645D; height: 24px;">
                                            <td align="center" class="copy" style="color: White;">
                                                Powered by :  <span class="powered"><a href="http://www.p2softech.com"  target="_blank">P2Softech
                                    </a></span>
                                            </td>
                                        </tr>
                                  </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    
</body>
</html>

