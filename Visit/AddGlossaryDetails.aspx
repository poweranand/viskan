<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddGlossaryDetails.aspx.cs" Inherits="AddGlossaryDetails"  validateRequest="false"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Add Glossary Details Page</title>
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
                   
                    <asp:GridView ID="grdGlossary" runat="server" AutoGenerateColumns="false"
                     OnPageIndexChanging="gridPageChanging" AllowPaging="true" OnRowCommand="Gridview_OnRowCommand"
                      OnRowDataBound="Gridview_RowDataBound" PagerSettings-FirstPageText="First" 
                    PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous"
                    PagerSettings-Mode="NextPreviousFirstLast" PagerStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:TemplateField HeaderText="Term">
                                <ItemTemplate>
                                    <asp:Label ID="lblGrdGlossaryID" runat="server" Visible="false" Text='<%# bind("GlossaryID") %>'></asp:Label>
                                    <asp:LinkButton ID="lblGrdGlossaryTerm" CommandName="Glosedit" CausesValidation="false" runat="server" Text='<%# bind("Term") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lblGrdGlossaryDescription" runat="server" Text='<%# bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             </Columns>
                    </asp:GridView>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Glossary Term:" Font-Bold="True"></asp:Label><span style="color:Red;">*</span><asp:Label ID="lblGlossaryEdit" Visible="false" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTerm" ErrorMessage="Enter Glossary Term."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text=" Glossary Description" Font-Bold="True"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Columns="100" Rows="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
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
