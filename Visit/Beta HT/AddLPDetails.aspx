<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddLPDetails.aspx.cs" Inherits="LPDetails" %>

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
                   
                    <asp:GridView ID="gridviewLP" runat="server" AutoGenerateColumns="false"
                     OnPageIndexChanging="gridPageChanging" AllowPaging="true" OnRowCommand="Gridview_OnRowCommand"
                      OnRowDataBound="Gridview_RowDataBound" PagerSettings-FirstPageText="First" 
                    PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous"
                    PagerSettings-Mode="NextPreviousFirstLast" PagerStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField HeaderText="LP ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridLpId" runat="server" Text='<%# bind("lpid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LP Name">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkGridLPName" CommandName="Lpedit" CausesValidation="false" runat="server" Text='<%# bind("LpName") %>'></asp:LinkButton>
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
                                <asp:Label ID="Label1" runat="server" Text="LP Name" Font-Bold="True"></asp:Label><span style="color:Red;">*</span><asp:Label ID="lblLPEdit" Visible="false" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLPName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLPName" ErrorMessage="Enter LP Name."></asp:RequiredFieldValidator>
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
                                <asp:Label ID="Label19" runat="server" Text="LP Category" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlLPCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLPCategory_SelectedIndexChanged">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Religion" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlReligion" runat="server">
                                </asp:DropDownList></td>
                        </tr>
                       
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Dynasty" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                &nbsp;<asp:DropDownList ID="ddlDynasty" runat="server">
                                </asp:DropDownList></td>
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
                                <asp:Button ID="btnLPSave" runat="server" Text="Save" OnClick="btnLPSave_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnLPDelete" runat="server" Text="Delete" CausesValidation="false" OnClick="btnLPDelete_Click" />
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
