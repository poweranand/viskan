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

public partial class AddGlossaryDetails : System.Web.UI.Page
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
                grdGlossary.PageSize = Convert.ToInt32(pg.Rows[0][1].ToString());
            #endregion

            GlossaryBAL gl = new GlossaryBAL();
            ds = gl.FetchGlossary();
            grdGlossary.DataSource = ds.Tables[0];
            grdGlossary.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(lblGlossaryEdit.Text))
        {
            try
            {
                int a = 0;
                GlossaryBAL gl = new GlossaryBAL();
                a = gl.SaveGlossary(txtTerm.Text, txtDescription.Text);

                if (a != 0)
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Glossary Details Added.');location='AddGlossaryDetails.aspx';", true);
                Clear();
                FetchDetails();
            }
            catch (Exception ex)
            {
                if(ex.Message.StartsWith("Violation of PRIMARY KEY constraint"))
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Glossary Details already added. Please try something.');location='AddGlossaryDetails.aspx';", true);
            }
        }
        else
        {
            int a = 0;
            GlossaryBAL gl = new GlossaryBAL();
            a = gl.UpdateGlossary(lblGlossaryEdit.Text, txtTerm.Text, txtDescription.Text); 

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Glossary Details updated.');location='AddGlossaryDetails.aspx';", true);
            Clear();
            FetchDetails();
        }
    }

    private void Clear()
    {
        lblGlossaryEdit.Text = string.Empty;
        txtTerm.Text = string.Empty;
        txtDescription.Text = string.Empty;
    }

    private void FetchDetails()
    {
        GlossaryBAL gl = new GlossaryBAL();
        ds = gl.FetchGlossary();
        grdGlossary.DataSource = ds.Tables[0];
        grdGlossary.DataBind();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblGlossaryEdit.Text))
        {
            int a = 0;
            GlossaryBAL gl = new GlossaryBAL();
            a = gl.DeleteGlossaryDetails(lblGlossaryEdit.Text);

            if (a != 0)
                Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Glossary Details Deleted.');location='AddGlossaryDetails.aspx';", true);
            Clear();
            FetchDetails();
        }
        else
            Page.ClientScript.RegisterStartupScript(typeof(Page), "key", "alert('Select Glossary Details to Delete.');location='AddGlossaryDetails.aspx';", true);
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    #region grid Functionality..

    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk_lpedit = (LinkButton)e.Row.FindControl("lblGrdGlossaryTerm");
            lnk_lpedit.CommandArgument = e.Row.RowIndex.ToString();

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
            if (_commandName == "Glosedit")
            {
                Label glid = (Label)grdGlossary.Rows[_selectedIndex].Cells[0].FindControl("lblGrdGlossaryID");
                DataTable editdetails = new DataTable();
                GlossaryBAL gl = new GlossaryBAL();
                editdetails = gl.FetchGlossaryDetails(glid.Text);

                lblGlossaryEdit.Text = editdetails.Rows[0][0].ToString();
                txtTerm.Text = editdetails.Rows[0][1].ToString();
                txtDescription.Text = editdetails.Rows[0][2].ToString();
            }
        }

    }

    protected void gridPageChanging(object sender, GridViewPageEventArgs e)
    {
        GlossaryBAL gl = new GlossaryBAL();
        ds = gl.FetchGlossary();
        grdGlossary.DataSource = ds.Tables[0];
        grdGlossary.PageIndex = e.NewPageIndex;
        grdGlossary.DataBind();
    }
    #endregion
}
