using System.ComponentModel.DataAnnotations;

namespace restaurant_sra.Models
{
	public class DiningTableTrack
	{
		[Key]
		public int DiningTableTrackID { get; set; }

		[Required]	
		public int DiningTableId { get; set; }

        [Required(ErrorMessage = "Please enter status as 'O' AS OCCOUPIED or 'V' AS vacant ")]
        public int TableStatus { get; set; }

	}
}
