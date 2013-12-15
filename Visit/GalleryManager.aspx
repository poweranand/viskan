<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GalleryManager.aspx.cs" Inherits="GalleryManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Object"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Home</asp:ListItem>
                        <asp:ListItem>Historical Spots</asp:ListItem>
                        <asp:ListItem>LP</asp:ListItem>
                        <asp:ListItem>Festivals</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Sub Object"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="trBanner" runat="server" visible="false">
                <td colspan="2">
                    <table>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="Label3" runat="server" Text="Choose Image"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="Label6" runat="server" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription1" runat="server" TextMode="MultiLine" Rows="3" Columns="15"></asp:TextBox>
                                <br />
                    <asp:Button ID="btn_AddImage" runat="server" OnClick="Button1_Click" Text="Add Image" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" ShowHeader="false" >
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="grdImg1" runat="server" ImageUrl='<%# bind("title") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trGallery" runat="server" visible="false">
                <td colspan="2">
                    <table>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="lblColumn" runat="server"></asp:Label><span style="color:Red;">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlColumn" runat="server" OnSelectedIndexChanged="ddlColumn_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlColumn" InitialValue="Select"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="tr1" runat="server" visible="false">
                            <td valign="top">
                               <asp:Label ID="lblColumn1" runat="server"></asp:Label><span style="color:Red;">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlColumn1" runat="server" OnSelectedIndexChanged="ddlColumn1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlColumn1" InitialValue="Select"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="Label4" runat="server" Text="Choose Image"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="Label7" runat="server" Text="Image Title"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtImageTitle" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDecription" runat="server" TextMode="MultiLine" Rows="3" Columns="15"></asp:TextBox>
                                <br />
                    <asp:Button ID="btn_AddImage1" runat="server" OnClick="btn_AddImage1_Click" Text="Add Image" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trGrid" runat="server" align="center" visible="false">
                <td valign="top" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false" OnPageIndexChanging="gridPageChanging" AllowPaging="true" OnRowCommand="Gridview_OnRowCommand"
                      OnRowDataBound="Gridview_RowDataBound" PagerSettings-FirstPageText="First" 
                    PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous"
                    PagerSettings-Mode="NextPreviousFirstLast" PagerStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="grdID" runat="server" Visible="false" Text='<%# bind("photoid") %>'></asp:Label>
                                    <asp:Image ID="grdImg" runat="server" ImageUrl='<%# bind("title") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="grdDelete" runat="server" Text="Delete" CommandName="PhotoDelete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
             <tr id="tr2" runat="server" visible="false">
                <td colspan="2">
                    <table>
                          <tr>
                            <td valign="top">
                               <asp:Label ID="Label8" runat="server"></asp:Label><span style="color:Red;">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
        </asp:DropDownList>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList3" InitialValue="Select"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                               <asp:Label ID="Label10" runat="server" Text="Choose Image"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload3" runat="server" />
                            </td>
                        </tr>
                      
                        <tr>
                           
                            <td>
                                
                    <asp:Button ID="Button1" runat="server"  Text="Add Map" OnClick="Button1_Click1" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trgrid4" runat="server" align="center" visible="false">
                <td valign="top" colspan="2">
                 
                    <asp:GridView ID="GridView3" runat="server"  AutoGenerateColumns="False"  OnRowCommand="GridView3_RowCommand" OnRowDataBound="GridView3_RowDataBound" 
                    OnPageIndexChanging="GridView3_PageIndexChanging"  AllowPaging="True" ShowHeader ="False" 
                     PagerStyle-HorizontalAlign="Center" >
                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast"
                            NextPageText="Next" PreviousPageText="Previous" />
                        <PagerStyle HorizontalAlign="Center" />
                         <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="grdID1" runat="server" Visible="false" Text='<%# bind("MapID") %>'></asp:Label>
                                    <asp:Image ID="grdImg1" runat="server" ImageUrl='<%# bind("Mappath") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="grdDelete1" runat="server" Text="Delete" CommandName="PhotoDelete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                  </asp:GridView>
                    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sampleConnectionString %>"
                        SelectCommand="SELECT [MapID],[Mappath] FROM [tb_mapphoto] "></asp:SqlDataSource>--%>
                </td>
               
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
