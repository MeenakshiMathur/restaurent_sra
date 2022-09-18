using Microsoft.AspNetCore.Mvc;
using restaurant_sra.DataLayer;
using restaurant_sra.Models;
using System.Diagnostics;

namespace restaurant_sra.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
        
        [HttpGet]
       public IActionResult Index()
        {
         RestaurentDAL _RestaurentDAL= new RestaurentDAL();
         List<Restaurant> restaurantslist = new List<Restaurant>();
            restaurantslist = _RestaurentDAL.GetRestaurants();

            return View(restaurantslist);
        }

        [HttpPost]
        public IActionResult SearchRestaurent(int RestaurantID)
        {

            RestaurentDAL _RestaurentDAL = new RestaurentDAL();
            List<Restaurant> restaurantslist = new List<Restaurant>();
            restaurantslist = _RestaurentDAL.GetRestaurantsbyID(RestaurantID);

            return View("Index", restaurantslist);
        }

        //[HttpPost]
        //public IActionResult SearchRestaurent(FormCollection rest)
        //{

        //    RestaurentDAL _RestaurentDAL = new RestaurentDAL();
        //    List<Restaurant> restaurantslist = new List<Restaurant>();
        //    restaurantslist = _RestaurentDAL.GetRestaurantsbyID(rest);

        //    return View("Index", restaurantslist);
        //}





        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}