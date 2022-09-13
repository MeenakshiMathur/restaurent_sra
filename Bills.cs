using System.ComponentModel.DataAnnotations;

namespace restaurant_sra.Models
{
    public class Bills
    {
        [Key]
        public int BillsId { get; set; }

        [Required]
        public int OrderId { get; set; }

        [Required]
        public int RestaurentId { get; set; }

        [Required]
        public float BillAmount { get; set; }

        [Required]
        public int CustomerId { get; set; }
    }
}
