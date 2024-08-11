using QLKS.DatabaseConnection;
using QLKS.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace QLKS.Areas.Admin.Controllers
{
    public class ServiceController : Controller
    {
        public DataQLKSDataContext data;

        // Constructor
        public ServiceController()
        {
            data = DBconnection.GetConnect();
        }

        private void Check()
        {
            db_User check = Session["admin"] as db_User;
            if (check != null && check.qlKS == 0)
            {
                throw new HttpException(404, "Not Found");
            }
        }

        public ActionResult Index()
        {
            Check();
            return View(data.db_Services.ToList());
        }


        public ActionResult AddService(FormCollection f, HttpPostedFileBase imageMain)
        {
            Check();
            int id = int.Parse(f["exId"]);
            var ten = f["ten"];
            int gia = int.Parse(f["gia"]);
            var mota = f["mota"];
            if (id == 0)
            {
                string mainFileName = "Service" + Guid.NewGuid() + ".jpg";
                string mainPath = Path.Combine(Server.MapPath("~/Content/Client/img"), mainFileName);
                imageMain.SaveAs(mainPath);
                db_Service sl = new db_Service()
                {
                    ServiceName = ten,
                    Price = (int)(gia),
                    image = mainFileName,
                    Description = mota
                };
                data.db_Services.InsertOnSubmit(sl);
                data.SubmitChanges();
            }
            else
            {
                var idFind = data.db_Services.SingleOrDefault(x => x.ServiceID == id);
                if (imageMain != null && imageMain.ContentLength > 0)
                {
                    string mainFileName = "Service" + Guid.NewGuid() + ".jpg";
                    string mainPath = Path.Combine(Server.MapPath("~/Content/Client/img"), mainFileName);
                    imageMain.SaveAs(mainPath);
                    string deleteImgMain = Path.Combine(Server.MapPath("~/Content/Client/img"), idFind.image);
                    System.IO.File.Delete(deleteImgMain);

                    idFind.image = mainFileName;
                }
                idFind.ServiceName = ten;
                idFind.Price = gia;
                idFind.Description = mota;
                data.SubmitChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult deleteService(int id)
        {
            Check();
            var sv = data.db_Services.SingleOrDefault(x => x.ServiceID == id);
            data.db_Services.DeleteOnSubmit(sv);
            string deleteImgMain = Path.Combine(Server.MapPath("~/Content/Client/img"), sv.image);
            System.IO.File.Delete(deleteImgMain);
            data.SubmitChanges();
            return RedirectToAction("Index");
        }

        public ActionResult updateService(int id)
        {
            Check();
            var t = data.db_Services.Where(x => x.ServiceID == id);
            return Json(new { Data = t}, JsonRequestBehavior.AllowGet);
        }
    }
}
