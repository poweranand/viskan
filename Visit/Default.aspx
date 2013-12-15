<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Visitkanchi.org</title>
<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1.0, initial-scale=1.0"/>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
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
                                            <li class="active"><a href="#">Home</a></li>
                                            <li><a href="#">Kanchi At Glance</a></li>
                                            <li><a href="#">Hostorical Spot</a></li>
                                            <li><a href="#">Legendary Personalities</a></li>
                                            <li><a href="#">Festivals</a></li>
                                            <li><a href="#">Tourist Info</a></li>
                                            <li><a href="#">Glossary</a></li>
                                          </ul>
                                        </div><!-- /.navbar-collapse -->
                                        
                </nav>    
                   
                      
    </header> <!-- end of header -->

    <div class="shadeBorder row"> 
   <snap><br/></span>
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
                                      
                                  </span>  
                            
            
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
                              <h2>Welcome</h2>    
                          
                                      <p>                  
                                Kanchipuram, one of the ancient cities of India, has a continuous history of more than 2000 years. It breathed through the ancient, medieval and modern periods of history. Its location as a frontier
                  town in the northern border of Tamil Nadu has made it a ‘meeting point and melting pot’ of various historical currents of south India.
                  Kanchi was an important transit point, where traders and travelers from far away places came in and spread out. It was an unparallel learning centre where scholars from distant regions poured in to acquire knowledge. It was a critical war zone, where rulers of southern dynasties settled scores first, before proceeding to expand their empires. It served as a broad forum, where saints of various religions debated their philosophies before proceeding to reign over the minds of the people.
                  In Kanchi, goods as well as ideas were exchanged; dynasties as well as religions fought for supremacy. It was a place of confluence and influence; convergence and divergence. It also became a fertile ground for new social forces to root and blossom. In its long evolution, Kanchi got a mystic color of sacredness. The history of Kanchi has to be necessarily seen through the mist of mythical stories associated with it. Ancient texts declare only seven places to be holy in India. Among them Kanchi is the only one in the south – most living and vibrant. Hence, it can rightly be called as the ‘Historical Gateway to South India’. Explore Kanchi – Discover the soul of South India.project. The focus of the -Project name- is to support those new features that will allow easier development, deployment and maintenance of solutions built upon the -Project name-. Those features include: [List of the features] This release of the -Project name- will also include legacy bug fixing, and redesigning or including missing functionality from previous release.
                  </p> 
            
                          
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
                             
                                  <li><a href="#">Historical Spot</a></li>
                              
                                  <li><a href="#">Legendary Personalities</a></li>
                             
                                  <li><a href="#">Temple Festivals</a></li>
                            
                                  <li><a href="#">Performing Arts</a></li>
                              
                                  <li><a href="#">Heritage House</a></li>
                             
                                  <li><a href="#">Silk Sarees</a></li>
                              
                                  <li><a href="#">Traditional Food</a></li>

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
