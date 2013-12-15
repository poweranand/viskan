<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HistoricalSpots.aspx.cs" Inherits="HistoricalSpots" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Visitkanchi.org</title>
<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1.0, initial-scale=1.0"/>


    <link href="http://visitkanchi.org/new/css/custom.css" rel="stylesheet" />
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet"/>

<link href="css/custom.css" rel="stylesheet"/>



<!-- jquery and sliders-->
<script src="js/jquery-1.10.2.min.js" type="application/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
</head>
<body>
 <form id="form1" runat="server">
     
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>


<div class="container">
	
    <header class="row">        
                          <nav class="navbar navbar-inverse" role="navigation">
                                        <!-- Brand and toggle get grouped for better mobile display -->
                                        <div class="navbar-header">
                                          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                          </button>
                                          <a class="navbar-brand" href="#">Visit Kanchi Logo</a>
                                        </div>

                                       <!-- Collect the nav links, forms, and other content for toggling -->
                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                          <ul class="nav navbar-nav navbar-right">
                                            <li><a href="#">Home</a></li>
                                            <li><a href="#">Kanchi At Glance</a></li>
                                            <li class="active"><a href="#">Hostorical Spot</a></li>
                                            <li><a href="#">Legendary Personalities</a></li>
                                            <li><a href="#">Festivals</a></li>
                                            <li><a href="#">Tourist Info</a></li>
                                            <li><a href="#">Glossary</a></li>
                                          </ul>
                                        </div><!-- /.navbar-collapse -->
                                        
                </nav>    
                   
                      
    </header> <!-- end of header -->

   <div class="shadeBorder row"> 
   <span><br/></span>
   </div>    

    <div id="contentBox" class="row">

     <div class="bgLayer">


       <div class="col-md-12 col-lg-12"> 


              <div class="sb-bot">
                <div class="sb-top">
                  <div class="sb-right">
                    <div class="sb-left">
                      <div class="sb-rb">
                        <div class="sb-lb">
                          <div class="sb-rt">
                            <div class="sb-ltSlide">     
                              <h2>VisitKanchi.org</h2>    
                          
                                <ul class="rslides rslides1" id="slider1" style="max-width: 800px; text-align:center; width:100%;">
                                      <li id="rslides1_s0" class="" style="width:100%;display: block; float: none; position: absolute; opacity: 0; z-index: 1; -webkit-transition: opacity 800ms ease-in-out; transition: opacity 800ms ease-in-out;">
                                       <img src="http://placehold.it/900x300/ffffff/855522&text=Banner1" alt="">
                                      </li>
                                      <li id="rslides1_s1" class="rslides1_on" style="float: left; position: relative; opacity: 1; z-index: 2; display: list-item; -webkit-transition: opacity 800ms ease-in-out; transition: opacity 800ms ease-in-out;">
                                         <img src="http://placehold.it/900x300/ffffff855522/&text=Banner2" alt="">
                                      </li>
                                      <li id="rslides1_s2" class="" style="float: none; position: absolute; opacity: 0; z-index: 1; display: list-item; -webkit-transition: opacity 800ms ease-in-out; transition: opacity 800ms ease-in-out;">
                                         <img src="http://placehold.it/900x300/ffffff855522/&text=Banner3" alt="">
                                      </li>
                                </ul>
            
                              <script>
                                  $(function () {
                                      $(".rslides").responsiveSlides();
                                  });
                              </script>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
       
              

      
             </div>  

       <div class="sideBar col-md-3 col-lg-3 "> 



               <div class="sb-bot">
                <div class="sb-top">
                  <div class="sb-right">
                    <div class="sb-left">
                      <div class="sb-rb">
                        <div class="sb-lb">
                          <div class="sb-rt">
                            <div class="sb-lt">     
                              <h2>Historical Spot</h2>    
                               <ul>
                             
                                  <li>
                                      <asp:DropDownList ID="ddlSearchCategory" Width="100%" runat="server"  Height="20px"   AutoPostBack="True" >
                                      </asp:DropDownList>
		                         </li>
                                  
                              
                                  <li>   
								    <asp:DropDownList ID="ddlSearchCategory1" Width="100%" runat="server" Height="20px"
                                        AutoPostBack="True">
                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                    </asp:DropDownList>
                                  </li>
                             
                                 
                                    <span class="tree">
                                    <asp:TreeView ID="TreeView1" runat="server" 
                                        onselectednodechanged="TreeView1_SelectedNodeChanged" >  </asp:TreeView>
                                                                                                     
                                    
                                      
                                  </span>  

                                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                              <ContentTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                
                                                  <tr>
                                                    <td align="left"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr >
                                                          <td align="center">
                                                          <asp:GridView ID="grdSpotName" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging"
                                                          AllowPaging="true" OnRowCommand="Gridview_OnRowCommand" OnRowDataBound="Gridview_RowDataBound"
                                                          PagerStyle-HorizontalAlign="Center" runat="server" BackColor="#F5F4E2" BorderColor="#825a1f"
                                                          BorderStyle="Solid" BorderWidth="1px" CssClass="Linktxt" AlternatingRowStyle-CssClass="Linktxt"
                                                          PagerSettings-Mode="Numeric">
                                                              
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
                                                                      <td align="left" style="padding-left: 7px;">
                                                                          <asp:Label ID="lnkgrdSpotName" runat="server" Text='<%# bind("spotname") %>'></asp:Label>
                                                                          <asp:LinkButton ID="lblgrdSpotNameId" Visible="false" runat="server" Text='<%# bind("spotid") %>'></asp:LinkButton> 
                                                                      </td>
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
                                                  
                                                  <tr id="tr11" runat="server" visible="false">
                                                    <td align="left" style="width:254px" ><asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" ShowHeader="False" BorderWidth="0px" RowStyle-BorderWidth="0px" AlternatingRowStyle-BorderWidth="0" EditRowStyle-BorderWidth="0" EmptyDataRowStyle-BorderWidth="0" FooterStyle-Width="0" Width="254px">
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
                                            </asp:UpdatePanel> 
                            
            
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                
            </div>    

       <div class="col-md-6 col-lg-6 main-content"> 


              <div class="sb-bot">
                <div class="sb-top">
                  <div class="sb-right">
                    <div class="sb-left">
                      <div class="sb-rb">
                        <div class="sb-lb">
                          <div class="sb-rt">
                            <div class="sb-lt">     
                                 
                               <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                                                                        <ContentTemplate>
                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td align="left" class="txt" style="padding-right: 8px;" valign="top">
                                                                                                        <b style="color: Black;">
                                                                                                         <h2>  <asp:Label ID="lblName" ForeColor="Black" runat="server"></asp:Label> </h2><br />
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
                                                                                                        <asp:GridView ID="GridView1" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging1"
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
                                                                                    </asp:UpdatePanel> 
                       
            
                          
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
       
              
    

      
             </div>   

       <div class="sideBar col-md-3 col-lg-"> 

              <div class="sb-bot">
                <div class="sb-top">
                  <div class="sb-right">
                    <div class="sb-left">
                      <div class="sb-rb">
                        <div class="sb-lb">
                          <div class="sb-rt">
                            <div class="sb-lt">     
                              <h2>Know More</h2>    
                               <ul>
                             
                                  <li>
                                  <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                                                                            <ContentTemplate>
                                                                                  <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                           <td align="center">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%" >
                                                                                                    <tr>
                                                                                                        <td style="padding-top:14px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="224px" >
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
                                                                                                    <tr >
                                                                                                        <td></td>
                                                                                                    </tr>                                                                                                                                                                                                       
                                                                                             </table>                                                                                           </td> 
                                                                                        </tr>
                                                                                        <tr style="height:12px;">
                                                                                           <td style="height: 12px"></td>
                                                                                        </tr>
                                                                                        <tr id="tr10" runat="server" visible="false"  style="width:253px">
                                                                                            <td>                                                                                               
                                                                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" ShowHeader="false" BorderWidth="0" RowStyle-BorderWidth="0px" AlternatingRowStyle-BorderWidth="0" EditRowStyle-BorderWidth="0" EmptyDataRowStyle-BorderWidth="0" FooterStyle-Width="0">
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
                                                                        </asp:UpdatePanel> 
                                  
                                  <li>
                              

                                   <li>
                                          <asp:Label runat="server" ID="Lbl_Festival" CssClass="BannerHead"></asp:Label>
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
                                       
                                    
                                   </li>

            
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
         
                 
      
                     
            </div>          

           
     </div>
    
    </div>    

    <footer class="shadeBorder row">              
    <snap><br/></span>             
    </footer>
<!-- Container -->

    <script>


        function myResize() {
            var x = 17;
            var curWidth = $(window).width() + x;
            console.log("hello");


            if (curWidth < 768) {

                console.log("current width:" + curWidth + " Mobile :xs");

            }
            else if (curWidth > 768 && curWidth < 992) {
                console.log("current width:" + curWidth + " Tablet :sm");
                $(".navbar").css("font-size", "12px!important")
                console.log($(".navbar").css("font-size", "12px!important"));


            }
            else if (curWidth >= 992 && curWidth <= 1200) {
                console.log("current width:" + curWidth + " PC :md");

            }
            else {
                console.log("current width:" + curWidth + " Large PC :lg");

            }

        }

        $(window).resize(myResize);
        $(window).load(myResize);


         </script>

</div>

</form>

</body>
</html>
