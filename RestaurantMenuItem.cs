using MessagePack;
using System.ComponentModel.DataAnnotations;

namespace restaurant_sra.Models
{
    public class RestaurantMenuItem
    {
        [System.ComponentModel.DataAnnotations.Key]
        public int MenuItemID { get; set; }

        [Required]
        public int CuisineID { get; set; }

        [Required(ErrorMessage = "Please enter name")]
        public string? ItemName { get; set; }

        [Required(ErrorMessage = "Please enter value more than 0")]
        public float ? ItemPrice { get; set; } 


    }
}
