using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;


namespace restaurant_sra.Models
{
    public class Restaurant
    {
        [Key]
        public int RestaurantID { get; set; }

        [Required(ErrorMessage = "Please enter name")]
        public string? RestaurantName { get; set; }

        [Required(ErrorMessage = "Please enter address")]
        public string? Address { get; set; }

        [Required(ErrorMessage = "Please enter 10 digit mobile number")]
        [MaxLength(10)]
        public string? MobileNo { get; set; }
        
    }
}
