using Microsoft.AspNetCore.Mvc;
using restaurant_sra.Context;
using restaurant_sra.Models;

namespace restaurant_sra.Controllers
{
	public class OrderController : Controller
	{
		OrderContext db;
		

		public OrderController(OrderContext _db)
		{
			db = _db;
		}

        public IActionResult OrderView()
		{

			IEnumerable<Order> order = db.Order.Select(s => s).ToList();

			return View(order);
		}

        public IActionResult Delete(int id)
        {
			Order order = db.Order.FirstOrDefault(s => s.OrderID== id);
			if(order!=null)
			{
				db.Remove(order);	
				db.SaveChanges();
				return RedirectToAction("Order");

			}

            //IEnumerable<Order> order = db.Order.Select(s => s).ToList();

            return View("Order");
        }
    }
}
