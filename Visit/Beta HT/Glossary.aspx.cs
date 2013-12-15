using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class HistoricalSpots : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["glossaryid"] != null)
            {
                GlossaryBAL gl = new GlossaryBAL();
                ds = gl.FetchGlossary();
                ds.Tables[0].DefaultView.RowFilter = "term like '%" + Request.QueryString["glossaryid"].ToString() + "%'";
                grdGlossary.Visible = true;
                grdGlossary.DataSource = ds.Tables[0];
                grdGlossary.DataBind();
                if (grdGlossary.Rows.Count != 0)
                    Label1.Visible = false;
                else
                    Label1.Visible = true;
            }
            else
                GlosssaryFetch();

        }
    }

    private void GlosssaryFetch()
    {
        // Bind the term and description details in grid....
        GlossaryBAL gl = new GlossaryBAL();
        ds = gl.FetchGlossary();
        grdGlossary.DataSource = ds.Tables[0];
        grdGlossary.DataBind();
        // End Bind the term and description details in grid....
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearchTerm.Text != string.Empty)
        {
            GlossaryBAL gl = new GlossaryBAL();
            ds = gl.FetchGlossary();
            ds.Tables[0].DefaultView.RowFilter = "term like '%" + txtSearchTerm.Text + "%'";
            grdGlossary.Visible = true;
            grdGlossary.DataSource = ds.Tables[0];
            grdGlossary.DataBind();
            if (grdGlossary.Rows.Count != 0)
                Label1.Visible = false;
            else
                Label1.Visible = true;
        }
        else
        {
            grdGlossary.Visible = false;
            Label1.Visible = true;
        }
    }
    protected void btnClear_Click(object sender, ImageClickEventArgs e)
    {
        grdGlossary.Visible = true;
        txtSearchTerm.Text = string.Empty;
        Label1.Visible = false;
        GlosssaryFetch();
    }
}
