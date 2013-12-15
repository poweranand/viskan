<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddFestivalDetails.aspx.cs" Inherits="AddFestivalDetails"  validateRequest="false"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Add Festival Details Page</title>
    <script type="text/javascript" src="jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="jscripts/tinymain.js"></script>
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
                <td valign="top">
                   
                    <asp:GridView ID="grdFestival" runat="server" AutoGenerateColumns="false"
                     OnPageIndexChanging="gridPageChanging" AllowPaging="true" OnRowCommand="Gridview_OnRowCommand"
                      OnRowDataBound="Gridview_RowDataBound" PagerSettings-FirstPageText="First" 
                    PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous"
                    PagerSettings-Mode="NextPreviousFirstLast" PagerStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField HeaderText="Festival ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridFesId" runat="server" Text='<%# bind("festivalid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Festival Name">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkGridFesName" CommandName="fesedit" CausesValidation="false" runat="server" Text='<%# bind("Name") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <asp:Label ID="lblActive" runat="server"></asp:Label>                                  
                                </ItemTemplate>
                            </asp:TemplateField>
                             </Columns>
                    </asp:GridView>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Festival Name" Font-Bold="True"></asp:Label><span style="color:Red;">*</span><asp:Label ID="lblFestivalEdit" Visible="false" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFestivalName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFestivalName" ErrorMessage="Enter Festival Name."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="Spot Name" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlSpotName" runat="server">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="height: 24px">
                                <asp:Label ID="Label3" runat="server" Text="Month" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="height: 24px">
                                &nbsp;<asp:DropDownList ID="ddlMonth" runat="server">
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
                                                                    </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Description" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox>
                            </td>
                        </tr>
                        
                       
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Duration" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtDuration" runat="server" Columns="100" Rows="5" TextMode="SingleLine"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Active" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:CheckBox ID="chkActive" runat="server" />
                            </td>
                        </tr>                       
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnLPSave_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CausesValidation="false" OnClick="btnLPDelete_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" CausesValidation="false" OnClick="btnClear_Click" />
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
