using Microsoft.EntityFrameworkCore;
using restaurant_sra.Models;
using restaurant_sra.Context;

namespace restaurant_sra.Context
{
	public class OrderContext: DbContext
	{
		public OrderContext(DbContextOptions options):base(options)
		{

		}

		public DbSet<Order> Order { get; set; }
	}
}
