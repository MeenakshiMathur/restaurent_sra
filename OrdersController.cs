using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using restaurant_sra.Context;
using restaurant_sra.Models;

namespace restaurant_sra.Controllers
{
    public class OrdersController : Controller
    {
        private MVCContext db;

        public OrdersController(MVCContext _db)
        {
            
            db = _db;
        }

        // GET: Orders
        public IActionResult Index()
        {
            IEnumerable<Order> order = db.Order.Select( o => o ).ToList();
                      return View(order);
            
            //return _db.Order != null ? 
                //          View(await _db.Order.ToListAsync()) :
                //          Problem("Entity set 'MVCContext.Order'  is null.");
        }

        
    }
}
