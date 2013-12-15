<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="HistoricalSpots_old.aspx.cs"
    Inherits="HistoricalSpots2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Kanchipuram Historical Spots, Kanchipuram Tourist Spots, Kanchi Sankara Mutt, Kanchipuram Kailasanathar Temple, Varadarajaperumal Temple, Vaikuntha Perumal Temple, Kanchi Kamakshi Amman Temple, Mamandur Cave Temples, Mahendravadi Cave Temple, Govindavadi Cave Temple, Kuranganilmuttam Cave Temple</title>
	<meta name="description" content="An online guide on the various historical places of interest in and around Kanchipuram. Get to know the unknown facts about the temples, mosques, churches in kanchipuram. See the list of spots to visit in Kanchipuram. See the list of cave temples of the Pallave dynasty" />
    <link href="StyleSheet/StyleSheet.css" rel="Stylesheet" type="text/css" />
     <style type="text/css">

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
     function showBig()
      {
      debugger;
       var src=$('.clslbl').scr;
       alert(src);
      // window.open(document.getElementById('grdImg1').src, "mywindow");
       
     }
     </script>  
   
   <script type="text/javascript">
    function goImgWin(myImage, myWidth, myHeight, origLeft, origTop)
  {
     myHeight += 24;
     myWidth += 24;
TheImgWin = window.open(grdImg1, 'image', 'height=' + myHeight + ',width=' + myWidth + ',toolbar=no,directories=no,status=no,' +
'menubar=no,scrollbars=no,resizable=no');
     TheImgWin.resizeTo(myWidth + 2, myHeight + 30);
     TheImgWin.moveTo(origLeft, origTop);
     TheImgWin.focus();
   }
</script>  
 
    <script type="text/javascript">
    
    function LoadDiv(url)
 {
    var img = new Image();
    var bcgDiv = document.getElementById("divBackground");
    var imgDiv = document.getElementById("divImage");
    var imgFull = document.getElementById("imgFull");
    var imgLoader= document.getElementById("imgLoader");
    imgLoader.style.display = "block";
    img.onload = function() {
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
        
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <div id="divBackground" class="modal">

</div>

<div id="divImage" >
    <table>
        <tr>
            <td valign="middle" align="center">
               <img id="imgLoader" alt=""
                 src="images/loader.jpg" />
                <img id="imgFull" alt="" src=""
                 style="display: none";  />
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
            <table width="100%" border="0"  cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">
                        <table border="0" cellpadding="0" cellspacing="0" width="1000px">
						<tr class="topbg"><td align="right" valign="middle">
									   <div class="twitter"><a href="download/Tour_ Guide-Historical_ Spots_at_Kanchipuram.pdf" target="_blank"><img src="images/PDF.png" alt="Download Kanchipuram-Tour Guide" title="Download Kanchipuram-Tour Guide"/></a><a href="http://www.twitter.com/visitkanchi" target="_blank"><img src="images/twitter.png" alt="Follow visitkanchi on Twitter" title="Follow visitkanchi on Twitter"/></a></div>
                                              
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
<li><a href="index.aspx">Home</a></li>
<li><a href="aboutkanchipuram.html" >Kanchi At A Glance</a></li>
<li><a href="HistoricalSpots.aspx" class="selected">Historical Spots</a></li>
<li><a href="LegendaryPersonalities.aspx">Legendary Personalities</a></li>
<li><a href="Festivals.aspx">Festivals</a></li>
<li><a href="touristinfo.html" class="links">Tourist Info</a></li>
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
                                             Historical Spots
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
                                <td valign="top">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 254px; background-image: url('Images/Search.png'); background-position: top;
                                                background-repeat:no-repeat;" valign="top"><asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                              <ContentTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                  <tr>
                                                    <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr style="height: 45px;">
                                                          <td></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><img src="Images/icon_filter.gif" title="Main Filter: Select category from this drop down box to filter the list below" style="float:left; margin-left:5px;" />
                                                              <asp:DropDownList ID="ddlSearchCategory" Width="220px" runat="server" Height="20px"
                                                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlSearchCategory_SelectedIndexChanged"> </asp:DropDownList>                                                          </td>
                                                        </tr>
                                                        <tr style="height: 10px;">
                                                          <td></td>
                                                        </tr>
                                                        <tr>
                                                          <td align="center"><img src="Images/icon_filter.gif" title="Sub Filter: Select a category value from this drop down box to filter the list below" style="float:left; margin-left:5px;" />
                                                              <asp:DropDownList ID="ddlSearchCategory1" Width="220px" runat="server" Height="20px"
                                                                                    AutoPostBack="True" OnSelectedIndexChanged="ddlSearchCategory1_SelectedIndexChanged">
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                              </asp:DropDownList>                                                          </td>
                                                        </tr>
                                                    </table></td>
                                                  </tr>
                                                  <tr style="height: 11px;">
                                                    <td></td>
                                                  </tr>
                                                  <tr>
                                                    <td align="left"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr >
                                                          <td align="center">
                                                          <asp:GridView ID="grdSpotName" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging"
                                                                                AllowPaging="true" OnRowCommand="Gridview_OnRowCommand" OnRowDataBound="Gridview_RowDataBound"
                                                                               
                                                                                PagerStyle-HorizontalAlign="Center" runat="server" BackColor="#F5F4E2" BorderColor="#D8DBBC"
                                                                              
                      
                                                                                BorderStyle="Solid" BorderWidth="1px" Width="254px" CssClass="Linktxt" AlternatingRowStyle-CssClass="Linktxt" PagerSettings-Mode="Numeric">
                                                              <footerstyle BackColor="#FFFFCC" ForeColor="#330099" />                                            
                                                              <RowStyle BackColor="White" CssClass="Linktxt" />
                                                              <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                                              <pagerstyle HorizontalAlign="Center" />                                            
                                                              <columns>
                                                              <asp:ButtonField CommandName="spotshow" Text="SingleClick" Visible="False" />
                                                              <asp:TemplateField>
                                                                <itemtemplate>
                                                                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                      <td align="left" style="padding-left: 7px;"><asp:Label ID="lnkgrdSpotName" runat="server" Text='<%# bind("spotname") %>'></asp:Label>
                                                                          <asp:LinkButton ID="lblgrdSpotNameId" Visible="false" runat="server" Text='<%# bind("spotid") %>'></asp:LinkButton>                                                                      </td>
                                                                    </tr>
                                                                  </table>
                                                                </itemtemplate>
                                                              </asp:TemplateField>
                                                              </columns>
                                                              <pagerstyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />                                            
                                                              <SelectedRowStyle BackColor="#F8F8F8" Font-Bold="True" ForeColor="#663399" CssClass="Linktxt" />
                                                              <headerstyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="#FFFFCC" />                                            
                                                              <AlternatingRowStyle CssClass="Linktxt" />
                                                            </asp:GridView>                                                          </td>
                                                        </tr>
                                                    </table></td>
                                                  </tr>
                                                  <tr style="height: 20px;">
                                                    <td style="width: 254px; background-image: url('Images/BottomSearch.png'); background-position: top;
                                                                        background-repeat:no-repeat; height: 15px;" valign="top"></td><!--Finish the Filter-->
                                                  </tr>
                                                  <tr id="tr11" runat="server" visible="false">
                                                    <td align="left" style="width:254px" ><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeader="False" BorderWidth="0px" RowStyle-BorderWidth="0px" AlternatingRowStyle-BorderWidth="0" EditRowStyle-BorderWidth="0" EmptyDataRowStyle-BorderWidth="0" FooterStyle-Width="0" Width="254px">
                                                        <columns>
                                                        <asp:ButtonField CommandName="Mappath" Text="Mappath" Visible="False" SortExpression ="Mappath" />
                                                        <asp:TemplateField>
                                                          <itemtemplate>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                              <asp:ImageButton ID="grdImg1" Width="254"  Height = "180" BorderWidth="0" runat="server" ImageUrl='<%# bind("Mappath") %>' onclientclick = "return LoadDiv(this.src);"/>                                            
                                                            </table>
                                                          </itemtemplate>
                                                        </asp:TemplateField>
                                                        </columns>
                                                        <RowStyle BorderWidth="0px" />
                                                        <EmptyDataRowStyle BorderWidth="0px" />
                                                        <footerstyle Width="0px" />                                            
                                                        <EditRowStyle BorderWidth="0px" />
                                                        <AlternatingRowStyle BorderWidth="0px" />
                                                      </asp:GridView>                                                    </td>
                                                  </tr>
                                                </table>
                                              </ContentTemplate>
                                            </asp:UpdatePanel></td>
                                            <td valign="top" style="background-image: url('Images/Verti_Border.jpg');  background-position: top;
                                                background-repeat: repeat-y;">&nbsp;                                            </td>
                                            <td valign="top" style="padding-left: 2px;">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td valign="top">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td valign="top">
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" >
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                                                                        <ContentTemplate>
                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblName" ForeColor="Black" runat="server"></asp:Label><br />
                                                                                                            <asp:Label ID="lblSpotID" Visible="false" runat="server"></asp:Label>
                                                                                                        </b>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr1" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                            <asp:Label Visible="false" ID="lblDescription" ForeColor="Black" runat="server"></asp:Label><br />
                                                                                                  </td>
                                                                                                </tr>
                                                                                                <tr id="trs1" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr2" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblLocation" Visible="false" ForeColor="Black" runat="server" Text="Location :"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label Visible="false" ID="lblLocationVal" runat="server"></asp:Label>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="trs2" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr3" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblArchitecture" Visible="false" ForeColor="Black" runat="server"
                                                                                                                Text="Architecture :"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblArchitectureVal" runat="server" Visible="false"></asp:Label>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="trs3" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr4" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblSculpture" runat="server" Text="Sculpture :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblSculptureVal" runat="server" Visible="false"></asp:Label>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="trs4" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr5" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblPainting" runat="server" Text="Painting :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblPaintingVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                </tr>
                                                                                                <tr id="trs5" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr6" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblInscription" runat="server" Text="Inscription :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblInscriptionVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                </tr>
                                                                                                <tr id="trs6" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr7" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblHymns" runat="server" Text="Hymns :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblHymnsVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                </tr>
                                                                                                <tr id="trs7" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr8" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblMythology" runat="server" Text="Mythology :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblMythologyVal" runat="server"></asp:Label></td>
                                                                                                </tr>
                                                                                                <tr id="trs8" runat="server" visible="false" style="height: 10px;">
                                                                                                    <td>                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr id="tr9" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblEvents" runat="server" Text="Events :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:Label ID="lblEventsVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                </tr>
                                                                                                <tr id="trs9" runat="server" visible="false">
                                                                                                    <td style="width: 20px;">&nbsp;                                                                                                  </td>
                                                                                                </tr>
                                                                                                <tr id="tr19" runat="server" visible="false">
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                            <asp:Label ID="lblFestivals" runat="server" Text="Festivals :" Visible="false"></asp:Label><br />
                                                                                                        </b>
                                                                                                        <asp:GridView ID="grdFestival" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging1"
                                                                                                            AllowPaging="true" OnRowCommand="Gridview_OnRowCommand1" OnRowDataBound="Gridview_RowDataBound1"
                                                                                                            PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next"
                                                                                                            PagerSettings-PreviousPageText="Previous" PagerSettings-Mode="NextPreviousFirstLast"
                                                                                                            PagerStyle-HorizontalAlign="Center" runat="server" BackColor="#F5F4E2" BorderColor="#D8DBBC"
                                                                                                            BorderStyle="Solid" BorderWidth="0px" Width="254px" CssClass="Linktxt" AlternatingRowStyle-CssClass="Linktxt">
                                                                                                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                                                                                            <RowStyle BackColor="White" CssClass="Linktxt" />
                                                                                                            <Columns>
                                                                                                                <asp:ButtonField CommandName="Festshow" Text="SingleClick" Visible="False" />
                                                                                                                <asp:TemplateField>
                                                                                                                    <ItemTemplate>
                                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                            <tr>
                                                                                                                                <td align="left" style="padding-left: 7px;" class="InsideLinktxt">
                                                                                                                                    <asp:Label ID="lnkgrdFestName" runat="server" Text='<%# bind("name") %>'></asp:Label>
                                                                                                                                    <asp:LinkButton ID="lblgrdFestId" Visible="false" runat="server" Text='<%# bind("festivalid") %>'></asp:LinkButton>                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                                                                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" CssClass="Linktxt" />
                                                                                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                                                                                            <AlternatingRowStyle CssClass="Linktxt" />
                                                                                                            <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast"
                                                                                                                NextPageText="Next" PreviousPageText="Previous" />
                                                                                                        </asp:GridView>                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ContentTemplate>
                                                                                    </asp:UpdatePanel>                                                                                </td>
                                                                            </tr>
                                                                    </table>                                                                    </td>
                                                                    <td style="background-image: url('Images/Verti_Border.jpg'); background-position: top;
                                                                        background-repeat: repeat-y; height:auto">&nbsp;                                                                    </td>
                                                                    <td style="width: 224px;  padding-left: 2px;" valign="top">
                                                                        <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                                                                            <ContentTemplate>
                                                                                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                           <td align="center">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-image:url(Images/Side.png); background-position:top; width:224px; background-repeat:no-repeat;">
                                                                                                    <tr>
                                                                                                        <td style="padding-top:14px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="224px" style="border-left:1px solid #AEAEAE; background-color:#F4F4F4; border-right:1px solid #AEAEAE; padding-left:10px;">
                                                                                                                <tr id="tr12" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblReligion" runat="server" Text="Religion :" Visible="false"></asp:Label><br />
                                                                                                                        </b>&nbsp;<asp:Label ID="lblReligionVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs12" runat="server" visible="false" style="height: 10px;">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr id="tr13" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblTiming" runat="server" Text="Timing :" Visible="false"></asp:Label><br />
                                                                                                                        </b>&nbsp;<asp:Label ID="lblTimingVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs13" runat="server" visible="false" style="height: 10px;">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr id="tr14" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblDeity" runat="server" Text="Deity :" Visible="false"></asp:Label><br />
                                                                                                                        </b>
                                                                                                                        <asp:Label ID="lblDeityVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs14" runat="server" visible="false" style="height: 10px;">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr id="tr15" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblBuiltBy" runat="server" Text="Built By :" Visible="false"></asp:Label><br />
                                                                                                                        </b>
                                                                                                                        <asp:Label ID="lblBuiltByVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs15" runat="server" visible="false" style="height: 10px;">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr id="tr16" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblPeriod" runat="server" Text="Period :" Visible="false"></asp:Label><br />
                                                                                                                        </b>
                                                                                                                        <asp:Label ID="lblPeriodVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs16" runat="server" visible="false" style="height: 10px;">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr id="tr17" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblSanctifiedBy" runat="server" Text="Sanctified By :" Visible="false"></asp:Label><br />
                                                                                                                        </b>
                                                                                                                        <asp:Label ID="lblSanctifiedByVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs17" runat="server" visible="false">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr id="tr18" runat="server" visible="false">
                                                                                                                    <td align="left" class="txt"  valign="top">
                                                                                                                        <b style="color: Black;">
                                                                                                                            <asp:Label ID="lblSpotCategory" runat="server" Text="Category :" Visible="false"></asp:Label><br />
                                                                                                                        </b>
                                                                                                                        <asp:Label ID="lblSpotCategoryVal" runat="server" Visible="false"></asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr id="trs18" runat="server" visible="false">
                                                                                                                    <td>                                                                                                                    </td>
                                                                                                                </tr>                                                                                                                 
                                                                                                            </table>                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style=" background-image:url(Images/SideBottom.png); height:15px; background-position:bottom; background-repeat:no-repeat; ">
                                                                                                        <td></td>
                                                                                                    </tr>                                                                                                                                                                                                       
                                                                                             </table>                                                                                           </td> 
                                                                                        </tr>
                                                                                        <tr style="height:12px;">
                                                                                           <td style="height: 12px"></td>
                                                                                        </tr>
                                                                                        <tr id="tr10" runat="server" visible="false"  style="width:253px">
                                                                                            <td>                                                                                               
                                                                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false" BorderWidth="0" RowStyle-BorderWidth="0px" AlternatingRowStyle-BorderWidth="0" EditRowStyle-BorderWidth="0" EmptyDataRowStyle-BorderWidth="0" FooterStyle-Width="0">
                                                                                                    <Columns>
                                                                                                        <asp:TemplateField ControlStyle-BorderWidth="0">
                                                                                                            <ItemTemplate>
                                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                    <tr>
                                                                                                                        <td align="left" class="ImageTxt"  >
                                                                                                                             <asp:Label ID="grdImgTitle" runat="server" Text='<%# bind("titlename") %>'></asp:Label>                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                     <tr>
                                                                                                                        <td>
                                                                                                                             <asp:ImageButton ID="grdImg" Width="222px" Height="225px" BorderWidth="0" runat="server" ImageUrl='<%# bind("title") %>' Onclientclick = "return LoadDiv(this.src);"/>                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                     <tr>
                                                                                                                        <td class="txt">
                                                                                                                             <asp:Label ID="grdImgDescription" runat="server" Text='<%# bind("Description") %>'></asp:Label>                                                                                                                        </td>
                                                                                                                    </tr>
                                                                                                                    <tr style="height:12px;">
                                                                                                                        <td></td>
                                                                                                                    </tr>
                                                                                                                </table>                                                                                                        
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                    </Columns>
                                                                                                </asp:GridView>                                                                                            </td>
                                                                                        </tr>
                                                                                </table>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>                                                                    </td>
                                                                </tr>
                                                            </table>                                                        </td>
                                                    </tr>
                                                </table>                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                           <tr><td colspan="3" align="center"  valign="top"><div class="footermenu">
									  <ul><li><a href="aboutus.html">About Us</a></li><li><a href="contact.html">Contact Us</a></li>
									  <li><a href="disclaimer.html">Disclaimer</a></li>
									  </ul></div></td></tr>
                            <tr style="background-color: #55645D; height: 24px;">
                                <td align="center" class="copy" style="color: White; height: 24px;">
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
