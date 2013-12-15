<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Festivals.aspx.cs" Inherits="Festivals" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" />
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
                                        <div class="navbar-header" style="margin: 6px;">
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
                                            <li ><a href="#">Hostorical Spot</a></li>
                                            <li ><a href="#">Legendary Personalities</a></li>
                                            <li class="active"><a href="#">Festivals</a></li>
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
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr style="height: 45px;">
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                 <img src="Images/icon_filter.gif" title="Main Filter:Select category from this drop down box to filter the list below" style="float:left; margin-left:5px;" />           <asp:DropDownList ID="DropDownList1" Width="220px" runat="server" Height="20px"
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
                                                                           <img src="Images/icon_filter.gif" title="Sub Filter: Select a category value from this drop down box to filter the list below" style="float:left; margin-left:5px;" />         <asp:DropDownList ID="DropDownList2" Width="220px" runat="server" Height="20px"
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
                                                                                <asp:GridView ID="GridView1" ShowHeader="false" AutoGenerateColumns="false" OnPageIndexChanging="gridPageChanging"
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
                                                                <td style="width: 254px; background-image: url('Images/BottomSearch.png'); background-position: top;
                                                                    background-repeat:no-repeat; height: 15px;" valign="top">
                                                                </td>
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
                                                                                    <tr id="tr11" runat="server" visible="false">
                                                                                        <td>
                                                                                            <asp:GridView ID="GridView2" runat="server" GridLines="None" AutoGenerateColumns="false"
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
                                  
                                  <li>
                              
                                    <li>
                                         
                                    </li>
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
