using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page 
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            #region Fetch Grid Page Size Details...
            DataTable pg = new DataTable();
            GeneralBAL pz = new GeneralBAL();
            pg = pz.FetchGridPageSize();
            if (pg.Rows.Count != 0 && pg.Rows[0][1].ToString() != string.Empty)
                gridviewSpot.PageSize = Convert.ToInt32(pg.Rows[0][1].ToString());
            #endregion

            SpotDetailsBAL sp = new SpotDetailsBAL();
            ds = sp.FetchSpotDetails1();

            ddlReligion.DataSource = ds.Tables[1];
            ddlReligion.DataTextField = "ReligionName";
            ddlReligion.DataValueField = "ReligionID";
            ddlReligion.DataBind();
            ddlReligion.Items.Insert(0, "==Select==");

            ddlPeriod.DataSource = ds.Tables[2];
            ddlPeriod.DataTextField = "Century";
            ddlPeriod.DataValueField = "Century";
            ddlPeriod.DataBind();
            ddlPeriod.Items.Insert(0, "==Select==");

            ddlBuiltBy.DataSource = ds.Tables[0];
            ddlBuiltBy.DataTextField = "LPName";
            ddlBuiltBy.DataValueField = "LPID";
            ddlBuiltBy.DataBind();
            ddlBuiltBy.Items.Insert(0, "==Select==");

            ddlSanctifiedBy.DataSource = ds.Tables[5];
            ddlSanctifiedBy.DataTextField = "LPName";
            ddlSanctifiedBy.DataValueField = "LPID";
            ddlSanctifiedBy.DataBind();
            ddlSanctifiedBy.Items.Insert(0, "==Select==");

            ddlSpotCategory.DataSource = ds.Tables[3];
            ddlSpotCategory.DataTextField = "SpotCategoryName";
            ddlSpotCategory.DataValueField = "SpotCategoryID";
            ddlSpotCategory.DataBind();
            ddlSpotCategory.Items.Insert(0, "==Select==");

            gridviewSpot.DataSource = ds.Tables[4];
            gridviewSpot.DataBind();
        }
    }

    #region Fetch Details.....
    private void FetchDetails()
    {
        SpotDetailsBAL sp = new SpotDetailsBAL();
        ds = sp.FetchSpotDetails();

        gridviewSpot.DataSource = ds.Tables[4];
        gridviewSpot.DataBind();
    }
    #endregion

    #region Save Functionality....
    protected void Button1_Click(object sender, EventArgs e)
    {
        int active = 0;
        if (chkActive.Checked == true)
            active = 1;
        if (string.IsNullOrEmpty(lblSpotEdit.Text))
        {
            int a;
            SpotDetailsBAL sp = new SpotDetailsBAL();
            a = sp.SaveSpotDetails(txtSpotName.Text, txtDescription.Text, ddlReligion.SelectedItem.Text, txtDeity.Text, ddlPeriod.SelectedItem.Text, ddlBuiltBy.SelectedItem.Text,
            txtArchitecture.Text, txtSculpture.Text, txtPainting.Text, txtInscription.Text, txtHymns.Text, txtMythology.Text, txtEvents.Text,
            txtTiming.Text, txtLocation.Text, txtSketch.Text, ddlSpotCategory.SelectedItem.Text, ddlSanctifiedBy.SelectedItem.Text, active);
            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Spot Details Added.');location='AddSpotDetails.aspx'", true);
            Clear();
            FetchDetails();
        }
        else
        {
            int a;
            SpotDetailsBAL sp = new SpotDetailsBAL();
            a = sp.UpdateSpotDetails(lblSpotEdit.Text,txtSpotName.Text, txtDescription.Text, ddlReligion.SelectedItem.Text, txtDeity.Text, ddlPeriod.SelectedItem.Text, ddlBuiltBy.SelectedItem.Text,
            txtArchitecture.Text, txtSculpture.Text, txtPainting.Text, txtInscription.Text, txtHymns.Text, txtMythology.Text, txtEvents.Text,
            txtTiming.Text, txtLocation.Text, txtSketch.Text, ddlSpotCategory.SelectedItem.Text, ddlSanctifiedBy.SelectedItem.Text, active);
            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Spot Details updated.');location='AddSpotDetails.aspx'", true);
            Clear();
            FetchDetails();
        }
    }
    #endregion

    #region Delete Functionality....
    protected void btnSpotDelete_Click(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(lblSpotEdit.Text))
        {
            int a;
            SpotDetailsBAL sp = new SpotDetailsBAL();
            a = sp.DeleteSpotDetails(lblSpotEdit.Text);
            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Spot Details Deleted.');location='AddSpotDetails.aspx'", true);
            Clear();
            FetchDetails();
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Select Spot Details to Delete.');location='AddSpotDetails.aspx'", true);
    }
    #endregion

    #region Clear....
    protected void Button3_Click(object sender, EventArgs e)
    {
        Clear();
    }
    #endregion 
    
    #region Clear Functionality...
    private void Clear()
    {
        lblSpotEdit.Text = string.Empty;
        txtSpotName.Text = string.Empty;
        txtDescription.Text = string.Empty;
        ddlReligion.SelectedIndex = 0;
        txtDeity.Text = string.Empty;
        ddlPeriod.SelectedIndex = 0;
        ddlBuiltBy.SelectedIndex = 0;
        txtArchitecture.Text = string.Empty;
        txtSculpture.Text = string.Empty;
        txtPainting.Text = string.Empty;
        txtInscription.Text = string.Empty;
        txtHymns.Text = string.Empty;
        txtMythology.Text = string.Empty;
        txtEvents.Text = string.Empty;
        txtTiming.Text = string.Empty;
        txtLocation.Text = string.Empty;
        txtSketch.Text = string.Empty;
        ddlSpotCategory.SelectedIndex = 0;
        ddlSanctifiedBy.SelectedIndex = 0;
        chkActive.Checked = false;
    }
    #endregion

    #region grid Post Jobs Functionality..

    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk_spotedit = (LinkButton)e.Row.FindControl("lnkGridSpotName");
            lnk_spotedit.CommandArgument = e.Row.RowIndex.ToString();

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
        }
        else
        {
            // Get the selected index and the command name
            int _selectedIndex = int.Parse(e.CommandArgument.ToString());

            _commandName = e.CommandName;
            if (_commandName == "spotedit")
            {
                Label spotid = (Label)gridviewSpot.Rows[_selectedIndex].Cells[0].FindControl("lblGridSpotId");
                DataTable editdetails = new DataTable();
                SpotDetailsBAL sp = new SpotDetailsBAL();
                editdetails = sp.EditSpotDetails(spotid.Text);

                lblSpotEdit.Text = editdetails.Rows[0][0].ToString();
                txtSpotName.Text = editdetails.Rows[0][1].ToString();
                txtDescription.Text = editdetails.Rows[0][2].ToString();
                ddlReligion.ClearSelection();
                ddlReligion.Items.FindByText(editdetails.Rows[0][3].ToString()).Selected = true;
                txtDeity.Text = editdetails.Rows[0][4].ToString();
                ddlPeriod.ClearSelection();
                ddlPeriod.Items.FindByText(editdetails.Rows[0][5].ToString()).Selected = true;
                ddlBuiltBy.ClearSelection();
                ddlBuiltBy.Items.FindByText(editdetails.Rows[0][6].ToString()).Selected = true;
                txtArchitecture.Text = editdetails.Rows[0][7].ToString();
                txtSculpture.Text = editdetails.Rows[0][8].ToString();
                txtPainting.Text = editdetails.Rows[0][9].ToString();
                txtInscription.Text = editdetails.Rows[0][10].ToString();
                txtHymns.Text = editdetails.Rows[0][11].ToString();
                txtMythology.Text = editdetails.Rows[0][12].ToString();
                txtEvents.Text = editdetails.Rows[0][13].ToString();
                txtTiming.Text = editdetails.Rows[0][14].ToString();
                txtLocation.Text = editdetails.Rows[0][15].ToString();
                txtSketch.Text = editdetails.Rows[0][16].ToString();
                ddlSpotCategory.ClearSelection();
                ddlSpotCategory.Items.FindByText(editdetails.Rows[0][17].ToString()).Selected = true;
                ddlSanctifiedBy.ClearSelection();
                ddlSanctifiedBy.Items.FindByText(editdetails.Rows[0][18].ToString()).Selected = true;
                if (Convert.ToInt32(editdetails.Rows[0][19].ToString()) == 1)
                    chkActive.Checked = true;
                else
                    chkActive.Checked = false;
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        SpotDetailsDAL sp = new SpotDetailsDAL();
        ds = sp.FetchSpotDetails1();
        gridviewSpot.DataSource = ds.Tables[4];
        gridviewSpot.PageIndex = e.NewPageIndex;
        gridviewSpot.DataBind();
    }
    #endregion

    
}
