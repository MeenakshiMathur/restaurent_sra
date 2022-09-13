using System.ComponentModel.DataAnnotations;
using Xunit;
using Xunit.Sdk;

namespace restaurant_sra.Models
{
	public class DiningTable
	{
		[Key]
		public int DiningTableID { get; set; }

		[Required]
		public int RestaurantID { get; set; }

        [Required(ErrorMessage = "Please enter Proper location.")]
        public string? Location { get; set; }

	}
}
