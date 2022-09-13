using Microsoft.EntityFrameworkCore;
using restaurant_sra.Models;

namespace restaurant_sra.Context
{
	public class MVCContext : DbContext
	{
		public MVCContext(DbContextOptions options) : base(options)
		{

		}

		public DbSet<Order> Order { get; set; }


	}
}
