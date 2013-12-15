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
/// Summary description for LPDetailsBAL
/// </summary>
public class LPDetailsBAL
{
	public LPDetailsBAL()
	{
		//
		// TODO: Add constructor logic here
		//
    }
    #region user Fetch LP.....
    public DataSet FetchLP()
    {
        DataSet ds = new DataSet();
        LPDetailsDAL lp = new LPDetailsDAL();
        ds = lp.FetchLP();
        return ds;
    }
    #endregion

    #region admin Fetch LP.....
    public DataSet FetchLP1()
    {
        DataSet ds = new DataSet();
        LPDetailsDAL lp = new LPDetailsDAL();
        ds = lp.FetchLP1();
        return ds;
    }
    #endregion

    #region Fetch LP Details.....
    public DataTable FetchLPDetails(string LPID)
    {
        DataTable ds = new DataTable();
        LPDetailsDAL lp = new LPDetailsDAL();
        ds = lp.FetchLPDetails(LPID);
        return ds;
    }
    #endregion

    #region Save LP Details...
    public int SaveLP(string LPName, string LPCategory, string Description, string Religion, string Dynasty, int Active)
    {
        int a;
        LPDetailsDAL lp = new LPDetailsDAL();
        a = lp.SaveLP(LPName, LPCategory, Description, Religion, Dynasty, Active);
        return a;
    }
    #endregion

    #region Update LP Details....
    public int UpdateLP(string LPID, string LPName, string LPCategory, string Description, string Religion, string Dynasty, int Active)
    {
        int a;
        LPDetailsDAL lp = new LPDetailsDAL();
        a = lp.UpdateLP(LPID, LPName, LPCategory, Description, Religion, Dynasty, Active);
        return a;
    }
    #endregion

    #region Delete LP Details....
    public int DeleteLP(string LPID)
    {
        int a;
        LPDetailsDAL lp = new LPDetailsDAL();
        a = lp.DeleteLP(LPID);
        return a;
    }
    #endregion
}
