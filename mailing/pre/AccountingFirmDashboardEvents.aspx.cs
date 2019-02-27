using System;
using System.Collections.Generic;
using DataHelpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using DataAccess;


public partial class New_AccountingFirmDashboardEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Objeto para SQL
        //SQLHelper sql = new SQLHelper();
        //DataTable datosTimeLine1 = sql.exec("exec [FI_RetrieveTaskBasic]");
        //if (Session["USR"] == null) Response.Redirect("login.aspx");
        Session["LoginidUser"] = 96;
        Session["MainMenuIdEnterprise"] = 43;
        if (!IsPostBack)
        {
            //Aplicar visibilidad de controles, permisos
            //SQLHelper sql = new SQLHelper();
            //int iduser = (int)Session["LoginidUser"];
            //int identerprise = (int)Session["MainMenuIdEnterprise"];
            //string namewebform = "MainMenu.aspx";
            //string nameacceso = "btnMainTeamwork";

            //DataTable datos90 = sql.exec("showAccess", CommandType.StoredProcedure,
            //       new SqlParameter("@idUser", iduser),
            //       new SqlParameter("@identerprise", identerprise),
            //       new SqlParameter("@nameWebForm", namewebform),
            //       new SqlParameter("@nameacceso", nameacceso),
            //       new SqlParameter("@idgroupservice", 6)
            //       );
            //if (datos90.Rows.Count == 0)
            //{
            //    Response.Redirect("login.aspx");
            //    return;
            //}


            RetrieveProfileUserPerGroupServiceAndEnterprise();
            RetrieveTaskTimeLineGeneral();
            RetrieveTaskHighPriorityGeneral();
            RetrieveTaskMediumPriorityGeneral();
            RetrieveTaskLowPriorityGeneral();

            comboCampaign.Visible = false;
            idCodeBarCampaignOPenMailing.Visible = false;
            idCodeBarCampaignRegistration.Visible = false;
            graphReboundMotives.Visible = false;
            mailingQ.Visible = false;
            mailingP.Visible = false;

            graphReboundMotives.Visible = false;
            graphOpenGroup.Visible = false;
            graphOpenStates.Visible = false;
            graphOpenStatesSubStates.Visible = false;
            graphProspectGroup.Visible = false;
            graphProspectStates.Visible = false;
            GraphProspectStatesSubstates.Visible = false;
            Session["MainMenuIdEnterprise"] = 94;
            if ((int)Session["MainMenuIdEnterprise"] == 94)
            {
                CargacomboCampaigns();
                ShowCodeBarCampaignOpenMailing();
                comboCampaign.Visible = true;
                idCodeBarCampaignOPenMailing.Visible = true;
                idCodeBarCampaignRegistration.Visible = true;
                graphReboundMotives.Visible = true;
                mailingQ.Visible = true;
                mailingP.Visible = true;
                graphReboundMotives.Visible = true;

                graphReboundMotives.Visible = true;
                graphOpenGroup.Visible = true;
                graphOpenStates.Visible = true;
                graphOpenStatesSubStates.Visible = true;
                graphProspectGroup.Visible = true;
                graphProspectStates.Visible = true;
                GraphProspectStatesSubstates.Visible = true;


            }

        }
    }

    protected void ShowCodeBarCampaignOpenMailing()
    {
        SQLHelper sql = new SQLHelper();
        /*
        DataTable facturacionmensual = sql.exec("ER_RetrieveVentasEnterpriseOutside", CommandType.StoredProcedure,
                    new SqlParameter ("@identerprise", (int) Session["MainMenuIdEnterprise"])
                    );
        RepeaterFacturacionPorMes.DataSource = facturacionmensual;
        RepeaterFacturacionPorMes.DataBind();
        */
        DataTable datosCampaignOpenMailing = sql.exec("LP_RetrieveResultCampaignPerUserOpenMailing", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue)
                    );


        if (datosCampaignOpenMailing.Rows.Count > 0)
            if (Convert.ToString(datosCampaignOpenMailing.Rows[0][0]) == "[] ")
            {
                Literal501.InnerHtml = Literal501.InnerHtml.Replace("FACTURACIONLIBROSREPLACE", "[  ];");
            }
            else
            {
                Literal501.InnerHtml = Literal501.InnerHtml.Replace("FACTURACIONLIBROSREPLACE", Convert.ToString(datosCampaignOpenMailing.Rows[0][0]));
            }


        DataTable datosCampaignRegisterMailing = sql.exec("LP_RetrieveResultCampaignPerUserRegisterProspectMailing", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue)
                    );
        if (datosCampaignRegisterMailing.Rows.Count > 0)
            if (Convert.ToString(datosCampaignRegisterMailing.Rows[0][0]) == "[] ")
            {
                Literal501.InnerHtml = Literal501.InnerHtml.Replace("LANDINGREGISTERMAILING", "[  ];");
            }
            else
            {
                Literal501.InnerHtml = Literal501.InnerHtml.Replace("LANDINGREGISTERMAILING", Convert.ToString(datosCampaignRegisterMailing.Rows[0][0]));
            }

        DataTable datos = sql.exec("LP_RetrieveResultCampaignPerUserRegisterGeneralStatistics", CommandType.StoredProcedure,
            new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue)
            );
        if (datos.Rows.Count > 0)
        {
            int total = (int)datos.Rows[0]["emailTotal"];
            int open = (int)datos.Rows[0]["emailDateOpen"];
            int rebound = (int)datos.Rows[0]["emailRebound"];
            int unsubscription = (int)datos.Rows[0]["emailUnSubscription"];
            int notopen = total - open - rebound - unsubscription;

            int openp = 0;
            int reboundp = 0;
            int unsubscriptionp = 0;
            int notopenp = 0;

            if (total > 0)
            {
                openp = Convert.ToInt32(open * 100 / total);
                reboundp = Convert.ToInt32(rebound * 100 / total);
                unsubscriptionp = Convert.ToInt32(unsubscription * 100 / total);
                notopenp = Convert.ToInt32(notopen * 100 / total);
            }
            emailSentQ.InnerHtml = Convert.ToString(total);
            emailOpenQ.InnerHtml = Convert.ToString(open);
            emailNotOpenQ.InnerHtml = Convert.ToString(notopen);
            emailReboundQ.InnerHtml = Convert.ToString(rebound);
            emailUnSubscribeQ.InnerHtml = Convert.ToString(unsubscription);

            emailSentP.InnerHtml = Convert.ToString(100) + "%";
            emailOpenP.InnerHtml = "Open:" + Convert.ToString(openp) + "%";
            emailNotOpenP.InnerHtml = "NOpen:" + Convert.ToString(notopenp) + "%";
            emailReboundP.InnerHtml = "Rebound:" + Convert.ToString(reboundp) + "%";
            emailUnSubscribeP.InnerHtml = "UnSusc:" + Convert.ToString(unsubscriptionp) + "%";
        }

        DataTable datos11 = sql.exec("LP_RetrieveResultCampaignPerUserRegisterReboundMotives", CommandType.StoredProcedure,
              new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue)
              );
        if (datos11.Rows.Count > 0)
        {
            RepeaterBarras.DataSource = datos11;
            RepeaterBarras.DataBind();
        }

        // start analisis de states

        DataTable datos11a = sql.exec("LP_RetrieveResultCampaignPerLocation", CommandType.StoredProcedure,
                    new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue),
                    new SqlParameter("@tipo", 1)
             );
        if (datos11a.Rows.Count > 0)
        {
            repeaterOpenGroup.DataSource = datos11a;
            repeaterOpenGroup.DataBind();
            
        }

        DataTable datos11ab = sql.exec("LP_RetrieveResultCampaignPerLocation", CommandType.StoredProcedure,
                    new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue),
                    new SqlParameter("@tipo", 11)
             );
        if (datos11ab.Rows.Count > 0)
        {
            repeaterProspectGroup.DataSource = datos11ab;
            repeaterProspectGroup.DataBind();
        }

        DataTable datos11b = sql.exec("LP_RetrieveResultCampaignPerLocation", CommandType.StoredProcedure,
                    new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue),
                    new SqlParameter("@tipo", 2)
             );
        if (datos11b.Rows.Count > 0)
        {
            repeaterOpenState.DataSource = datos11b;
            repeaterOpenState.DataBind();
            
        }

        DataTable datos11bb = sql.exec("LP_RetrieveResultCampaignPerLocation", CommandType.StoredProcedure,
                    new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue),
                    new SqlParameter("@tipo", 21)
             );
        if (datos11bb.Rows.Count > 0)
        {
            repeaterProspectStates.DataSource = datos11bb;
            repeaterProspectStates.DataBind();
        }
        /*
        DataTable datos11c = sql.exec("LP_RetrieveResultCampaignPerLocation", CommandType.StoredProcedure,
                    new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue),
                    new SqlParameter("@tipo", 3)
             );
        if (datos11c.Rows.Count > 0)
        {
            repeaterOpenStatesSubStates.DataSource = datos11c;
            repeaterOpenStatesSubStates.DataBind();
            
        }
        DataTable datos11cc = sql.exec("LP_RetrieveResultCampaignPerLocation", CommandType.StoredProcedure,
                    new SqlParameter("@idEnterprise", (int)Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@iduser", comboCampaign.SelectedValue),
                    new SqlParameter("@tipo", 31)
             );
        if (datos11cc.Rows.Count > 0)
        {
            repeaterGraphProspectStatesSubstates.DataSource = datos11cc;
            repeaterGraphProspectStatesSubstates.DataBind();
        }
        */
        // end analisis de states

    }

    protected void CargacomboCampaigns()
    {
        int i = (int)Session["MainMenuIdEnterprise"];
        comboCampaign.DataSource = Combos.GetComboCampaignNames(i);
        comboCampaign.DataValueField = "code";
        comboCampaign.DataTextField = "name";
        comboCampaign.DataBind();
        comboCampaign.SelectedIndex = 0;
    }
    protected void BtnView_Click(object sender, EventArgs e)
    {
        LinkButton lbtn = (LinkButton)sender;
        string indice = lbtn.CommandArgument;
        Response.Write(indice);
    }

    private void RetrieveProfileUserPerGroupServiceAndEnterprise()
    {
        SQLHelper sql = new SQLHelper();
        DataTable datosTimeLine1 = sql.exec("FI_RetrieveProfileUserPerGroupServiceAndEnterprise", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@idUser", Session["LoginidUser"]),
                    new SqlParameter("@idGroupService", 6)
                    );

        Session["LoginidUserProfileGroupService"] = datosTimeLine1.Rows[0]["idprofile"];

    }

    private void RetrieveTaskTimeLineGeneral()
    {
        SQLHelper sql = new SQLHelper();
        DataTable datosTimeLine1 = sql.exec("FI_RetrieveTaskBasicNotCompleted", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@idUser", Session["LoginidUser"]),
                    new SqlParameter("@idTaskPriority", null)
                    );
        RepeaterTimeLine1.DataSource = datosTimeLine1;
        RepeaterTimeLine1.DataBind();

    }

    private void RetrieveTaskHighPriorityGeneral()
    {
        SQLHelper sql = new SQLHelper();
        DataTable datosTimeLine1 = sql.exec("FI_RetrieveTaskBasicNotCompleted", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@idUser", Session["LoginidUser"]),
                    new SqlParameter("@idTaskPriority", 1)
                    );
        RepeaterHighPriority.DataSource = datosTimeLine1;
        RepeaterHighPriority.DataBind();
    }

    private void RetrieveTaskMediumPriorityGeneral()
    {
        SQLHelper sql = new SQLHelper();
        DataTable datosTimeLine1 = sql.exec("FI_RetrieveTaskBasicNotCompleted", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@idUser", Session["LoginidUser"]),
                    new SqlParameter("@idTaskPriority", 2)
                    );
        RepeaterMediumPriority.DataSource = datosTimeLine1;
        RepeaterMediumPriority.DataBind();
    }


    private void RetrieveTaskLowPriorityGeneral()
    {
        SQLHelper sql = new SQLHelper();
        DataTable datosTimeLine1 = sql.exec("FI_RetrieveTaskBasicNotCompleted", CommandType.StoredProcedure,
                    new SqlParameter("@identerprise", Session["MainMenuIdEnterprise"]),
                    new SqlParameter("@idUser", Session["LoginidUser"]),
                    new SqlParameter("@idTaskPriority", 3)
                    );
        RepeaterLowPriority.DataSource = datosTimeLine1;
        RepeaterLowPriority.DataBind();
    }

    protected void RepeaterTimeLine1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {


        int i = Convert.ToInt32(e.CommandArgument);
        Session["IDTASK"] = i;
        Response.Redirect("TW_VTask.aspx");
        // ClientScript.RegisterStartupScript(typeof(Page), "repscript", "<script>window.open( '../New/TW_VTask.aspx' , '-blank' );</script>");
        //        Response.Write("<script>");
        //      Response.Write("window.open('TW_VTask.aspx','_blank')");
        //    Response.Write("</script>");
    }

    protected void comboCampaign_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowCodeBarCampaignOpenMailing();
    }
}