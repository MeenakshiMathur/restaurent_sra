using MessagePack;
using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;
using KeyAttribute = MessagePack.KeyAttribute;

namespace restaurant_sra.Models
{
	public class Order
	{
		[KeyAttribute ("id")]
		public int OrderID { get; set; }

		public int OrderDate { get; set; }

		public int RestaurantID { get; set; }

		public int MenuITemID { get; set; }

        public int ItemQuantity { get; set; }

		public float OrderAmount { get; set; }

		public int DiningTableId { get; set; }
		
    }
}
