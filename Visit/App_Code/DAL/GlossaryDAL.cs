using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for GlossaryDAL
/// </summary>
public class GlossaryDAL
{
    SqlConnection con = new SqlConnection();
	public GlossaryDAL()
	{
        con.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();
		//
		// TODO: Add constructor logic here
		//
	}

    #region Fetch Glossary.....
    public DataSet FetchGlossary()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchGlossary", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Save Glossary Details...
    public int SaveGlossary(string Term, string Description)
    {
        SqlCommand cmd = new SqlCommand("sp_insertGlossary", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Term", Term);
        cmd.Parameters.AddWithValue("@Description", Description);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Update Glossary Details...
    public int UpdateGlossary(string GlossaryID, string Term, string Description)
    {
        SqlCommand cmd = new SqlCommand("sp_updateGlossary", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@GlossaryID", GlossaryID);
        cmd.Parameters.AddWithValue("@Term", Term);
        cmd.Parameters.AddWithValue("@Description", Description);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Fetch Glossary Details.....
    public DataTable FetchGlossaryDetails(string GlossaryID)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_fetchGlossaryDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@GlossaryID", GlossaryID);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Delete Glossary Details....
    public int DeleteGlossaryDetails(string GlossaryID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteGlossaryDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@GlossaryID", GlossaryID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion
}
