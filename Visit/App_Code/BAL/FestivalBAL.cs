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
/// Summary description for FestivalBAL
/// </summary>
public class FestivalBAL
{
	public FestivalBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region user Fetch Festival.....
    public DataSet FetchFestival()
    {
        DataSet ds = new DataSet();
        FestivalDAL fs = new FestivalDAL();
        ds = fs.FetchFestival();
        return ds;
    }
    #endregion

    #region admin Fetch Festival.....
    public DataSet FetchFestival1()
    {
        DataSet ds = new DataSet();
        FestivalDAL fs = new FestivalDAL();
        ds = fs.FetchFestival1();
        return ds;
    }
    #endregion

    #region Save Festival Details...
    public int SaveFestival(string FestivalName, string SpotName, string Description, string Month, string Duration, string SpotID, int Active)
    {
        int a;
        FestivalDAL fs = new FestivalDAL();
        a = fs.SaveFestival(FestivalName, SpotName, Description, Month, Duration, SpotID, Active);
        return a;
    }
    #endregion

    #region Update Festival Details...
    public int UpdateFestival(string FestivalID, string FestivalName, string SpotName, string Description, string Month, string Duration, string SpotID, int Active)
    {
        int a;
        FestivalDAL fs = new FestivalDAL();
        a = fs.UpdateFestival(FestivalID, FestivalName, SpotName, Description, Month, Duration, SpotID, Active);
        return a;
    }
    #endregion

    #region Fetch Festival Details.....
    public DataTable FetchFestivalDetails(string FestivalID)
    {
        FestivalDAL fs = new FestivalDAL();
        DataTable ds = new DataTable();
        ds = fs.FetchFestivalDetails(FestivalID);
        return ds;
    }
    #endregion

    #region Delete Festival Details....
    public int DeleteFestivalDetails(string FestivalID)
    {
        int a;
        FestivalDAL fs = new FestivalDAL();
        a = fs.DeleteFestivalDetails(FestivalID);
        return a;
    }
    #endregion
}
