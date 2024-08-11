using QLKS.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using QLKS.DatabaseConnection;

namespace QLKS.Areas.Admin.Controllers
{
    [CheckSession]
    public class WebsiteController : Controller
    {
        public DataQLKSDataContext data;

        public WebsiteController()
        {
            data = DBconnection.GetConnect();
        }
        private void Check()
        {
            db_User check = Session["admin"] as db_User;
            if (check != null && check.qlWeb == 0)
            {
                throw new HttpException(404, "Not Found");
            }
        }
        public ActionResult Slider()
        {
            Check();
            return View(data.Sliders.ToList());
        }

        public ActionResult AddSlider(FormCollection f, HttpPostedFileBase imageMain) 
        {
            Check();
            int id = int.Parse(f["exId"]);
            var slogan = f["slogan"];
            if(id == 0)
            {
                string mainFileName = "Slogan" + Guid.NewGuid() + ".jpg";
                string mainPath = Path.Combine(Server.MapPath("~/Content/Client/img"), mainFileName);
                imageMain.SaveAs(mainPath);
                Slider sl = new Slider()
                {
                    slogan = slogan,
                    image = mainFileName
                };
                data.Sliders.InsertOnSubmit(sl);
                data.SubmitChanges();
            }
            else
            {
                var idFind = data.Sliders.SingleOrDefault(x => x.id == id);
                if (imageMain != null && imageMain.ContentLength > 0)
                {
                    string mainFileName = "Slogan" + Guid.NewGuid() + ".jpg";
                    string mainPath = Path.Combine(Server.MapPath("~/Content/Client/img"), mainFileName);
                    imageMain.SaveAs(mainPath);
                    string deleteImgMain = Path.Combine(Server.MapPath("~/Content/Client/img"), idFind.image);
                    System.IO.File.Delete(deleteImgMain);

                    idFind.image = mainFileName;
                }
                idFind.slogan = slogan;
                data.SubmitChanges();
            }
            return RedirectToAction("Slider");
        }

        public ActionResult DeleteSlider(int id) 
        {
            Check();
            var i = data.Sliders.SingleOrDefault(x => x.id == id);
            data.Sliders.DeleteOnSubmit(i);
            data.SubmitChanges();
            return RedirectToAction("Slider");
        }

        public ActionResult UpdateSlider(int id)
        {
            Check();
            var i = data.Sliders.Where(x => x.id==id);
            return Json(new { Data = i}, JsonRequestBehavior.AllowGet);
        }
    }
}