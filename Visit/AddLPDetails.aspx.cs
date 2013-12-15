using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;


public partial class LPDetails : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            ddlReligion.Enabled = false;
            ddlDynasty.Enabled = false;

            #region Fetch Grid Page Size Details...
            DataTable pg = new DataTable();
            GeneralBAL pz = new GeneralBAL();
            pg = pz.FetchGridPageSize();
            if (pg.Rows.Count != 0 && pg.Rows[0][1].ToString() != string.Empty)
                gridviewLP.PageSize = Convert.ToInt32(pg.Rows[0][1].ToString());
            #endregion

            LPDetailsBAL lp = new LPDetailsBAL();
            ds = lp.FetchLP1();

            ddlReligion.DataSource = ds.Tables[1];
            ddlReligion.DataTextField = "ReligionName";
            ddlReligion.DataValueField = "ReligionID";
            ddlReligion.DataBind();
            ddlReligion.Items.Insert(0, "==Select==");

            ddlLPCategory.DataSource = ds.Tables[2];
            ddlLPCategory.DataTextField = "Lpcategoryname";
            ddlLPCategory.DataValueField = "Lpcategoryid";
            ddlLPCategory.DataBind();
            ddlLPCategory.Items.Insert(0, "==Select==");

            ddlDynasty.DataSource = ds.Tables[3];
            ddlDynasty.DataTextField = "DynastyName";
            ddlDynasty.DataValueField = "DynastyID";
            ddlDynasty.DataBind();
            ddlDynasty.Items.Insert(0, "==Select==");

            gridviewLP.DataSource = ds.Tables[0];
            gridviewLP.DataBind();
        }


    }

    #region Fetch Details.....
    private void FetchDetails()
    {
        LPDetailsBAL lp = new LPDetailsBAL();
        ds = lp.FetchLP();

        gridviewLP.DataSource = ds.Tables[0];
        gridviewLP.DataBind();
    }
    #endregion

    #region Save Functionality....
    protected void btnLPSave_Click(object sender, EventArgs e)
    {
        int active = 0;
        if (chkActive.Checked == true)
            active = 1;
        if (string.IsNullOrEmpty(lblLPEdit.Text))
        {
            int a = 0;
            LPDetailsBAL lp = new LPDetailsBAL();
            a = lp.SaveLP(txtLPName.Text, ddlLPCategory.SelectedItem.Text, txtDescription.Text, ddlReligion.SelectedItem.Text, ddlDynasty.SelectedItem.Text, active);

            if (a != 0)
            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('LP Details Added.');location='AddLPDetails.aspx';", true);
            Clear();
            FetchDetails();
        }
        else
        {
            int a = 0;
            LPDetailsBAL lp = new LPDetailsBAL();
            a = lp.UpdateLP(lblLPEdit.Text, txtLPName.Text, ddlLPCategory.SelectedItem.Text, txtDescription.Text, ddlReligion.SelectedItem.Text, ddlDynasty.SelectedItem.Text, active);

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('LP Details updated.');location='AddLPDetails.aspx';", true);
            Clear();
            FetchDetails();
        }
    }
    #endregion

    #region Delete Functionality....
    protected void btnLPDelete_Click(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(lblLPEdit.Text))
        {
            int a = 0;
            LPDetailsBAL lp = new LPDetailsBAL();
            a = lp.DeleteLP(lblLPEdit.Text);

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('LP Details Deleted.');location='AddLPDetails.aspx';", true);
            Clear();
            FetchDetails();
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Select LP Details to Delete.');location='AddLPDetails.aspx';", true);
    }
    #endregion

    #region ....
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    #endregion

    #region Clear Functionality...
    private void Clear()
    {
        lblLPEdit.Text = string.Empty;
        txtLPName.Text = string.Empty;
        txtDescription.Text = string.Empty;
        ddlReligion.SelectedIndex = 0;
        ddlLPCategory.SelectedIndex = 0;
        ddlDynasty.SelectedIndex = 0;
        chkActive.Checked = false;
        ddlReligion.Enabled = false;
        ddlDynasty.Enabled = false;
    }
    #endregion

    #region grid Post Jobs Functionality..

    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk_lpedit = (LinkButton)e.Row.FindControl("lnkGridLPName");
            lnk_lpedit.CommandArgument = e.Row.RowIndex.ToString();

            Label lblActive = (Label)e.Row.FindControl("lblActive");
            if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Active").ToString()) == 1)
                lblActive.Text = "Yes";
            else
                lblActive.Text = "No";

        }

    }
    protected void Gridview_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        string _commandName;
        if (e.CommandArgument.ToString() == "Next" || e.CommandArgument.ToString() == "Last" || e.CommandArgument.ToString() == "First" || e.CommandArgument.ToString() == "Prev")
        {
            gridviewLP.Enabled = true;
        }
        else
        {
            // Get the selected index and the command name
            int _selectedIndex = int.Parse(e.CommandArgument.ToString());

            _commandName = e.CommandName;
            if (_commandName == "Lpedit")
            {
                Label lpid = (Label)gridviewLP.Rows[_selectedIndex].Cells[0].FindControl("lblGridLpId");
                DataTable editdetails = new DataTable();
                LPDetailsBAL lp = new LPDetailsBAL();
                editdetails = lp.FetchLPDetails(lpid.Text);

                lblLPEdit.Text = editdetails.Rows[0][0].ToString();
                txtLPName.Text = editdetails.Rows[0][1].ToString();
                txtDescription.Text = editdetails.Rows[0][3].ToString();
                ddlLPCategory.ClearSelection();
                ddlLPCategory.Items.FindByText(editdetails.Rows[0][2].ToString()).Selected = true;

                ddlReligion.ClearSelection();
                ddlReligion.Items.FindByText(editdetails.Rows[0][4].ToString()).Selected = true;
               
                ddlDynasty.ClearSelection();
                ddlDynasty.Items.FindByText(editdetails.Rows[0][5].ToString()).Selected = true;

                if (editdetails.Rows[0][2].ToString().ToLower() == "king")
                {
                    ddlReligion.Enabled = false;
                    ddlDynasty.Enabled = true;
                }
                else if (editdetails.Rows[0][2].ToString().ToLower() == "saint")
                {
                    ddlReligion.Enabled = true;
                    ddlDynasty.Enabled = false;
                }
                else
                {
                    ddlReligion.Enabled = false;
                    ddlDynasty.Enabled = false;
                }

                if (Convert.ToInt32(editdetails.Rows[0][6].ToString()) == 1)
                    chkActive.Checked = true;
                else
                    chkActive.Checked = false;
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        LPDetailsBAL lp = new LPDetailsBAL();
        ds = lp.FetchLP1();
        gridviewLP.DataSource = ds.Tables[0];
        gridviewLP.PageIndex = e.NewPageIndex;
        gridviewLP.DataBind();
    }
    #endregion

    protected void ddlLPCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLPCategory.SelectedItem.Text.ToLower() == "king")
        {
            ddlReligion.SelectedIndex = 0;
            ddlReligion.Enabled = false;
            ddlDynasty.Enabled = true;
        }
        else if (ddlLPCategory.SelectedItem.Text.ToLower() == "saint")
        {
            ddlDynasty.SelectedIndex = 0;
            ddlReligion.Enabled = true;
            ddlDynasty.Enabled = false;
        }
        else
        {
            ddlReligion.SelectedIndex = 0;
            ddlDynasty.SelectedIndex = 0;
            ddlReligion.Enabled = false;
            ddlDynasty.Enabled = false;
        }
    }
}
