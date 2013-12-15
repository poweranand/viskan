using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for GlossaryBAL
/// </summary>
public class GlossaryBAL
{
	public GlossaryBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region Fetch Glossary.....
    public DataSet FetchGlossary()
    {
        DataSet ds = new DataSet();
        GlossaryDAL gl = new GlossaryDAL();
        ds = gl.FetchGlossary();
        return ds;
    }
    #endregion

    #region Save Glossary Details...
    public int SaveGlossary(string Term, string Description)
    {
        int a;
        GlossaryDAL gl = new GlossaryDAL();
        a = gl.SaveGlossary(Term, Description);
        return a;
    }
    #endregion

    #region Update Glossary Details...
    public int UpdateGlossary(string GlossaryID, string Term, string Description)
    {
        int a;
        GlossaryDAL gl = new GlossaryDAL();
        a = gl.UpdateGlossary(GlossaryID, Term, Description);
        return a;
    }
    #endregion

    #region Fetch Glossary Details.....
    public DataTable FetchGlossaryDetails(string GlossaryID)
    {
        DataTable ds = new DataTable();
        GlossaryDAL gl = new GlossaryDAL();
        ds = gl.FetchGlossaryDetails(GlossaryID);
        return ds;
    }
    #endregion

    #region Delete Glossary Details....
    public int DeleteGlossaryDetails(string GlossaryID)
    {
        int a;
        GlossaryDAL gl = new GlossaryDAL();
        a = gl.DeleteGlossaryDetails(GlossaryID);
        return a;
    }
    #endregion
}
