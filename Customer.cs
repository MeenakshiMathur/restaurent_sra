using MessagePack;
using System.ComponentModel.DataAnnotations;
using KeyAttribute = System.ComponentModel.DataAnnotations.KeyAttribute;

namespace restaurant_sra.Models
{
    public class Customer
    {
        [Key]
        public int CustomerId { get; set; }

        [Required]  
        public int RestaurentId { get; set; }

        [Required]
        public string? CustomerName { get; set; }

        [Required]
        public int Mobileno { get; set; }

    }
}
