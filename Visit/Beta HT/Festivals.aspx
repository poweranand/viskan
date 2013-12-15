<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Festivals.aspx.cs"
    Inherits="HistoricalSpots" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Festivals</title>
    <link href="StyleSheet/StyleSheet.css" rel="Stylesheet" type="text/css" />
     <style type="text/css">
     body
     {
        margin:0;
        padding:0;
        height:100%;
     }
     .modal
     {
        display: none;
        position: absolute;
        top: 0px;
        left: 0px;
        background-color:black;
        z-index:100;
        opacity: 0.8;
        filter: alpha(opacity=60);
        -moz-opacity:0.8;
        min-height: 100%;
     }
     #divImage
     {
        display: none;
        z-index: 1000;
        position: fixed;
        top: 0;
        left: 0;
        background-color:White;
        padding: 3px;
        border: solid 1px black;
     }
   </style> 
    
     <script type="text/javascript">
    
    function LoadDiv(url)
 {
    var img = new Image();
    var bcgDiv = document.getElementById("divBackground");
    var imgDiv = document.getElementById("divImage");
    var imgFull = document.getElementById("imgFull");
    var imgLoader= document.getElementById("imgLoader");
    imgLoader.style.display = "block";
    img.onload = function()
     {
        imgFull.src = img.src;
        imgFull.style.display = "block";
        imgLoader.style.display = "none";
        
    };
    img.src= url;
    var width = document.body.clientWidth;
    if (document.body.clientHeight > document.body.scrollHeight)
    {
        bcgDiv.style.height = document.body.clientHeight + "px";
    }
    else
    {
        bcgDiv.style.height = document.body.scrollHeight + "px" ;
    }
 
    imgDiv.style.left = (width-650)/2 + "px";
    imgDiv.style.top =  "20px";
    bcgDiv.style.width="100%";   
    bcgDiv.style.display="block";
    imgDiv.style.display="block";
    return false;
}
 function HideDiv()
 {
    var bcgDiv = document.getElementById("divBackground");
   var imgDiv = document.getElementById("divImage");
    var imgFull = document.getElementById("imgFull");
    
    if (bcgDiv != null)
    {
        bcgDiv.style.display="none";
        imgDiv.style.display="none";
        imgFull.style.display = "none";
       
    }
 }
</script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
         <div id="divBackground" class="modal" >

</div>

<div id="divImage"  >
    <table style="height: 100%; width: 100%" >
        <tr>
            <td valign="middle" align="center">
               <img id="imgLoader" alt=""
                 src="photo/ajax-loader1.gif" />
                <img id="imgFull" alt="" src=""
                 style="display: none"; height="500px" width="800px" />
            </td>
        </tr>
        <tr>
            <td align="center" valign="bottom">
                <input id="btnClose" type="button" value="close" 
                 onclick="HideDiv()"/>
            </td>                                                                  
        </tr>
    </table>
</div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0" cellspacing="0" width="1000px">
                            <tr>
                                <td>
                                    <asp:Image ID="imgBanner" runat="server" />
                                    <%--<img src="Images/Banner.jpg" width="1000px" height="212px" alt="Banner" />--%>
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
                                                <a href="#" class="links" style="color: Yellow;">Festivals</a>
                                            </td>
                                            <td style="width: 13%; border-right: 1px solid #ffffff; text-align: center;">
                                                <a href="touristinfo.html" class="links">Tourist Info</a>                                            </td>
                                            <td style="width: 14%;text-align: center;">
                                                <a href="Glossary.aspx" class="links">Glossary</a>
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
                                             Festivals
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
                                <td valign="top" style="padding-left: 2px;">
                                    <table border="0" cellpadding="0" cellspacing="5" width="100%">
                                        <tr>
                                            <td style="width: 253px; background-image: url('Images/Search_Festivsls.png'); background-position: top;
                                                background-repeat: repeat-x; height: 134px;" valign="top">
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
                                                                            <td align="center">
                                                                                 <img src="Images/icon_filter.gif" title="Main Filter:Select category from this drop down box to filter the list below" style="float:left; margin-left:5px;" />           <asp:DropDownList ID="ddlSearchCategory" Width="220px" runat="server" Height="20px"
                                                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlSearchCategory_SelectedIndexChanged">
                                                                                    <asp:ListItem>Select</asp:ListItem>
                                                                                    <asp:ListItem>Month</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 10px;">
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                           <img src="Images/icon_filter.gif" title="Sub Filter: Select a category value from this drop down box to filter the list below" style="float:left; margin-left:5px;" />         <asp:DropDownList ID="ddlSearchCategory1" Width="220px" runat="server" Height="20px"
                                                                                    AutoPostBack="True" Enabled="false" OnSelectedIndexChanged="ddlSearchCategory1_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                    <asp:ListItem>January</asp:ListItem>
                                                                                    <asp:ListItem>February</asp:ListItem>
                                                                                    <asp:ListItem>March</asp:ListItem>
                                                                                    <asp:ListItem>April</asp:ListItem>
                                                                                    <asp:ListItem>May</asp:ListItem>
                                                                                    <asp:ListItem>June</asp:ListItem>
                                                                                    <asp:ListItem>July</asp:ListItem>
                                                                                    <asp:ListItem>August</asp:ListItem>
                                                                                    <asp:ListItem>September</asp:ListItem>
                                                                                    <asp:ListItem>October</asp:ListItem>
                                                                                    <asp:ListItem>November</asp:ListItem>
                                                                                    <asp:ListItem>December </asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 11px;">
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                   <table border="0" cellpadding="0" cellspacing="0" width="254px">
                                                                      <tr>
                                                                           <td align="center">
                                                                                <asp:GridView ID="grdFestival" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging"
                                                                                    AllowPaging="true" OnRowCommand="Gridview_OnRowCommand" OnRowDataBound="Gridview_RowDataBound"
                                                                                   
                                                                                    PagerStyle-HorizontalAlign="Center" runat="server" BackColor="#F5F4E2" BorderColor="#D8DBBC"
                                                                                    BorderStyle="Solid" BorderWidth="1px" Width="254px" CssClass="Linktxt" AlternatingRowStyle-CssClass="Linktxt">
                                                                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                                                                    <RowStyle BackColor="White" CssClass="Linktxt" />
                                                                                    <Columns>
                                                                                        <asp:ButtonField CommandName="Festshow" Text="SingleClick" Visible="False" />
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="left" style="padding-left: 7px;">
                                                                                                            <asp:Label ID="lnkgrdFestName" runat="server" Text='<%# bind("name") %>'></asp:Label>
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
                                                                      </table>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 20px;">
                                                                <td style="width: 253px; background-image: url('Images/BottomSearch.png'); background-position: top;
                                                                    background-repeat: repeat-x; height: 15px;" valign="top">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td style="background-image: url('Images/Verti_Border.jpg'); width: 2px; background-position: top;
                                                background-repeat: repeat-y;">&nbsp;
                                                
                                            </td>
                                            <td valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td valign="top">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td valign="top" style="height: 662px">
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 260px;">
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                                                                        <ContentTemplate>
                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblName" ForeColor="Black" runat="server"></asp:Label><br />
                                                                                                        </b>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr style="height: 10px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr1" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                       <div class="txt">
                                                                                                            <asp:Label Visible="false" ID="lblDescription" ForeColor="Black" runat="server"></asp:Label><br />
                                                                                                       </div>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="trs1" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr2" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblMonth" Visible="false" ForeColor="Black" runat="server" Text="Month :"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label Visible="false" ID="lblMonthVal" runat="server"></asp:Label>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="trs2" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr3" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <b style="color: Black;">
                                                                                                                        <asp:Label ID="lblSpotName" Visible="false" ForeColor="Black" runat="server" Text="Spot Name :"></asp:Label><br />
                                                                                                                    </b>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td align="left" style="padding-left: 7px;" class="InsideLinktxt">
                                                                                                                    <asp:LinkButton ID="lnkSpotName" runat="server" ForeColor="#646464" Font-Underline="false"
                                                                                                                        OnClick="LinkButton1_Click">
                                                                                                                        <asp:Label ID="lblSpotNameVal" runat="server" Visible="false"></asp:Label>
                                                                                                                    </asp:LinkButton>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="trs3" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr4" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblDuration" runat="server" Text="Duration :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblDurationVal" runat="server" Visible="false"></asp:Label>
                                                                                                        Day(s)</td>
                                                                                                </tr>
                                                                                                <tr id="trs4" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <%--<tr id="tr10" runat="server" visible="false">
                                                                                                <td><img src="Images/1.jpg" width="250px" alt="" />
                                                                                                    <asp:Image Visible="false" ID="img2" runat="server" />
                                                                                                    
                                                                                                </td>
                                                                                            </tr>--%>
                                                                                            </table>
                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td style="background-image: url('Images/Verti_Border.jpg'); background-position: top;
                                                                        background-repeat: repeat-y; height: 662px;">&nbsp;
                                                                        
                                                                    </td>
                                                                    <td style="width: 224px; height: 662px;" valign="top">
                                                                        <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                                                                            <ContentTemplate>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr id="tr11" runat="server" visible="false">
                                                                                        <td>
                                                                                            <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="false"
                                                                                                ShowHeader="false" BorderWidth="0" RowStyle-BorderWidth="0px" AlternatingRowStyle-BorderWidth="0"
                                                                                                EditRowStyle-BorderWidth="0" EmptyDataRowStyle-BorderWidth="0" FooterStyle-Width="0">
                                                                                                <Columns>
                                                                                                    <asp:TemplateField ControlStyle-BorderWidth="0">
                                                                                                        <ItemTemplate>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                <tr>
                                                                                                                    <td align="left" class="ImageTxt">
                                                                                                                        <asp:Label ID="grdImgTitle" runat="server" Text='<%# bind("titlename") %>'></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td>
                                                                                                                        <asp:ImageButton ID="grdImg" Width="222px" runat="server" ImageUrl='<%# bind("title") %>' Onclientclick = "return LoadDiv(this.src);"/>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td class="txt">
                                                                                                                        <asp:Label ID="grdImgDescription" runat="server" Text='<%# bind("Description") %>'></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr style="height: 12px;">
                                                                                                                    <td>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
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
        </div>
    </form>
</body>
</html>
