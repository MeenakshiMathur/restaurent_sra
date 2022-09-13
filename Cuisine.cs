using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace restaurant_sra.Models
{
    public class Cuisine
    {
        [Key]
        public int CuisineID { get; set; }

        [Required(ErrorMessage = "Please restaurent ID")]  
        public int RestaurantID { get; set; }

        [Required(ErrorMessage = "Please enter name")]
        public string? CuisineName { get; set; }

    }
}
