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

public partial class AddFestivalDetails : System.Web.UI.Page
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
            GeneralBAL gl = new GeneralBAL();
            pg = gl.FetchGridPageSize();
            if (pg.Rows.Count != 0 && pg.Rows[0][1].ToString() != string.Empty)
                grdFestival.PageSize = Convert.ToInt32(pg.Rows[0][1].ToString());
            #endregion

            FestivalBAL fs = new FestivalBAL();
            ds = fs.FetchFestival1();

            ddlSpotName.DataSource = ds.Tables[1];
            ddlSpotName.DataTextField = "SpotName";
            ddlSpotName.DataValueField = "SpotID";
            ddlSpotName.DataBind();
            ddlSpotName.Items.Insert(0, "Select");

            grdFestival.DataSource = ds.Tables[0];
            grdFestival.DataBind();


        }
    }
    #region Save..
    protected void btnLPSave_Click(object sender, EventArgs e)
    {
        int active = 0;
        if (chkActive.Checked == true)
            active = 1;
        if (string.IsNullOrEmpty(lblFestivalEdit.Text))
        {
            int a = 0;
            FestivalBAL fs = new FestivalBAL();
            a = fs.SaveFestival(txtFestivalName.Text, ddlSpotName.SelectedItem.Text, txtDescription.Text, ddlMonth.SelectedItem.Text, txtDuration.Text, ddlSpotName.SelectedValue.ToString(), active);

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Festival Details Added.');location='AddFestivalDetails.aspx'", true);
            Clear();
            FetchDetails();
        }
        else
        {
            int a = 0;
            FestivalBAL fs = new FestivalBAL();
            a = fs.UpdateFestival(lblFestivalEdit.Text, txtFestivalName.Text, ddlSpotName.SelectedItem.Text, txtDescription.Text, ddlMonth.SelectedItem.Text, txtDuration.Text, ddlSpotName.SelectedValue.ToString(), active); 

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Festival Details updated.');location='AddFestivalDetails.aspx'", true);
            Clear();
            FetchDetails();
        }
    }
    #endregion

    #region Clear
    private void Clear()
    {
        lblFestivalEdit.Text = string.Empty;
        txtFestivalName.Text = string.Empty;
        ddlMonth.SelectedIndex = 0;
        txtDescription.Text = string.Empty;
        txtDuration.Text = string.Empty;
        ddlSpotName.SelectedIndex = 0;
        chkActive.Checked = false;
    }
    #endregion

    #region Fetch..
    private void FetchDetails()
    {
        FestivalBAL fs = new FestivalBAL();
        ds = fs.FetchFestival();

        grdFestival.DataSource = ds.Tables[0];
        grdFestival.DataBind();
    }
    #endregion

    #region Delete...
    protected void btnLPDelete_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblFestivalEdit.Text))
        {
            int a = 0;
            FestivalBAL fs = new FestivalBAL();
            a = fs.DeleteFestivalDetails(lblFestivalEdit.Text);

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Festival Details Deleted.');location='AddFestivalDetails.aspx'", true);
            Clear();
            FetchDetails();
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Select Festival Details to Delete.');location='AddFestivalDetails.aspx'", true);
    }
    #endregion

    #region Clear.....
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    #endregion

    #region grid Post Jobs Functionality..

    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk_lpedit = (LinkButton)e.Row.FindControl("lnkGridFesName");
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
        }
        else
        {
            // Get the selected index and the command name
            int _selectedIndex = int.Parse(e.CommandArgument.ToString());

            _commandName = e.CommandName;
            if (_commandName == "fesedit")
            {
                Label lpid = (Label)grdFestival.Rows[_selectedIndex].Cells[0].FindControl("lblGridFesId");
                DataTable editdetails = new DataTable();
                FestivalBAL fs = new FestivalBAL();
                editdetails = fs.FetchFestivalDetails(lpid.Text);

                lblFestivalEdit.Text = editdetails.Rows[0][0].ToString();
                txtFestivalName.Text = editdetails.Rows[0][1].ToString();
                ddlMonth.ClearSelection();
                ddlMonth.Items.FindByText(editdetails.Rows[0][2].ToString()).Selected = true;
                txtDescription.Text = editdetails.Rows[0][3].ToString();
                txtDuration.Text = editdetails.Rows[0][4].ToString();
                ddlSpotName.ClearSelection();
                ddlSpotName.Items.FindByText(editdetails.Rows[0][5].ToString()).Selected = true;
                if (Convert.ToInt32(editdetails.Rows[0][7].ToString()) == 1)
                    chkActive.Checked = true;
                else
                    chkActive.Checked = false;
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        FestivalBAL fs = new FestivalBAL();
        ds = fs.FetchFestival1();
        grdFestival.DataSource = ds.Tables[0];
        grdFestival.PageIndex = e.NewPageIndex;
        grdFestival.DataBind();
    }
    #endregion
}
