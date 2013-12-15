<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="AddSpotDetails.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td valign="top">
                   
                    <asp:GridView ID="gridviewSpot" runat="server" AutoGenerateColumns="false"
                     OnPageIndexChanging="gridPageChanging" AllowPaging="true" OnRowCommand="Gridview_OnRowCommand"
                      OnRowDataBound="Gridview_RowDataBound"  PagerStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField HeaderText="Spot ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridSpotId" runat="server" Text='<%# bind("spotid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Spot Name">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkGridSpotName" CommandName="spotedit" CausesValidation="false" runat="server" Text='<%# bind("spotName") %>'></asp:LinkButton>
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
                                <asp:Label ID="Label1" runat="server" Text="Spot Name" Font-Bold="True"></asp:Label><span style="color:Red;">*</span><asp:Label ID="lblSpotEdit" Visible="false" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSpotName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSpotName" ErrorMessage="Enter Spot Name."></asp:RequiredFieldValidator>
                            </td>
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
                                <asp:Label ID="Label3" runat="server" Text="Religion" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlReligion" runat="server">
                                <asp:ListItem>Religion</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                       
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Period" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlPeriod" runat="server">
                                <asp:ListItem>Period</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Built By" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlBuiltBy" runat="server">
                                    <asp:ListItem>Built By</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="Spot Category" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlSpotCategory" runat="server">
                                    <asp:ListItem>Spot Category</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label18" runat="server" Text="Sanctified By" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlSanctifiedBy" runat="server">
                                    <asp:ListItem>Sanctified By</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Deity" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDeity" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Architecture" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtArchitecture" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Sculpture" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtSculpture" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Painting" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtPainting" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Inscription" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtInscription" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Hymns" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtHymns" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Mythology" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtMythology" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Events" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtEvents" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="Timing" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtTiming" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label15" runat="server" Text="Location" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtLocation" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="Sketch" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="txtSketch" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="Active" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:CheckBox ID="chkActive" runat="server" />
                            </td>
                        </tr>
                                                
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnSpotSave" runat="server" Text="Save" OnClick="Button1_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnSpotDelete" runat="server" Text="Delete" CausesValidation="false" OnClick="btnSpotDelete_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" CausesValidation="false" OnClick="Button3_Click" />
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
