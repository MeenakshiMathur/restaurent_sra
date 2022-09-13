using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using restaurant_sra.DataLayer;

namespace restaurant_sra.Controllers
{
    public class CuisineController : Controller
    {
        

        // GET: CuisineController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: CuisineController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CuisineController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: CuisineController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CuisineController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: CuisineController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CuisineController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
