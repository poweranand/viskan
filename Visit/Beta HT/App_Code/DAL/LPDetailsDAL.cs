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
/// Summary description for LPDetailsDAL
/// </summary>
public class LPDetailsDAL
{
    SqlConnection con = new SqlConnection();

	public LPDetailsDAL()
	{
        con.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();

		//
		// TODO: Add constructor logic here
		//
    }

    #region User Fetch LP.....
    public DataSet FetchLP()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchLp", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region admin Fetch LP.....
    public DataSet FetchLP1()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        da = new SqlDataAdapter("sp_FetchLp1", con);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Fetch LP Details.....
    public DataTable FetchLPDetails(string LPID)
    {
        DataTable ds = new DataTable();
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand("sp_fetchLpDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LPID", LPID);
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds;
    }
    #endregion

    #region Save LP Details...
    public int SaveLP(string LPName, string LPCategory, string Description, string Religion, string Dynasty, int Active)
    {
        SqlCommand cmd = new SqlCommand("sp_insertlp", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LPName", LPName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@Religion", Religion);
        cmd.Parameters.AddWithValue("@LPCategory", LPCategory);
        cmd.Parameters.AddWithValue("@Dynasty", Dynasty);
        cmd.Parameters.AddWithValue("@Active", Active);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Update LP Details....
    public int UpdateLP(string LPID, string LPName, string LPCategory, string Description, string Religion, string Dynasty, int Active)
    {
        SqlCommand cmd = new SqlCommand("sp_updateLP", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LPID", LPID);
        cmd.Parameters.AddWithValue("@LPName", LPName);
        cmd.Parameters.AddWithValue("@Description", Description);
        cmd.Parameters.AddWithValue("@Religion", Religion);
        cmd.Parameters.AddWithValue("@LPCategory", LPCategory);
        cmd.Parameters.AddWithValue("@Dynasty", Dynasty);
        cmd.Parameters.AddWithValue("@Active", Active);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion

    #region Delete LP Details....
    public int DeleteLP(string LPID)
    {
        SqlCommand cmd = new SqlCommand("sp_DeleteLPDetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@LPID", LPID);
        con.Open();
        int a = cmd.ExecuteNonQuery();
        con.Close();
        return a;
    }
    #endregion
}
