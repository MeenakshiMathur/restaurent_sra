using System.Data.SqlClient;
using System.Data.Sql;
using System.Collections.Generic;
using System.Linq;
using restaurant_sra.Models;
using Microsoft.Extensions.Configuration;
using System.Data;
using Microsoft.AspNetCore.Mvc;

namespace restaurant_sra.DataLayer
{ 
    public class RestaurentDAL
    {
        public string cnn = " ";
        
        public RestaurentDAL()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json")
              .Build();
           
            cnn = builder.GetSection("ConnectionStrings:DefaultConnection").Value;
            
        }
        
        
        public List<Restaurant> GetRestaurants()
        {

            List<Restaurant> ListofRestaurents = new List<Restaurant>();
            using (SqlConnection cn = new SqlConnection(cnn))
            {
                using (SqlCommand cmd = new SqlCommand("USP_getallrest",cn))
                {

                    if (cn.State == ConnectionState.Closed)
                        cn.Open();

                    IDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ListofRestaurents.Add(new Restaurant()
                        { 

                            RestaurantID = int.Parse(reader["RestaurantID"].ToString()),
                            RestaurantName = reader["RestaurantName"].ToString(),
                            Address = reader["Address"].ToString(),
                            MobileNo = reader["MobileNo"].ToString(),

                        });
                    }
                }
            }
            return ListofRestaurents;

        }

        //[HttpPost]
        //public List<Restaurant> GetRestaurantsbyID(Restaurant)
        //{
        //    List<Restaurant> ListofRestaurents = new List<Restaurant>();
        //    using (SqlConnection cn = new SqlConnection(cnn))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("USP_getonerest",cn))
        //        {
        //            cmd.Parameters.Add("@RestaurantID", SqlDbType.Int);
        //            cmd.Parameters["@RestaurantID"].Value = RestaurantID;
        //            cmd.CommandType = CommandType.StoredProcedure;
                    
        //            if (cn.State == ConnectionState.Closed)
        //               cn.Open();
        //            IDataReader reader= cmd.ExecuteReader();
        //            //RestaurantID = int.Parse(reader["RestaurantID"].ToString())
                        

                    
        //            while (reader.Read())
        //            {
        //                ListofRestaurents.Add(new Restaurant()
        //                {

        //                    RestaurantID = int.Parse(reader["RestaurantID"].ToString()),
        //                    RestaurantName = reader["RestaurantName"].ToString(),
        //                    Address = reader["Address"].ToString(),
        //                    MobileNo = reader["MobileNo"].ToString(),

        //                });
        //            }
        //        }
        //    }
        //    return ListofRestaurents;


        
    [HttpPost]
    public List<Restaurant> GetRestaurantsbyID(int RestaurantID)
    {
        List<Restaurant> ListofRestaurents = new List<Restaurant>();
        using (SqlConnection cn = new SqlConnection(cnn))
        {
            using (SqlCommand cmd = new SqlCommand("USP_getonerest", cn))
            {
                cmd.Parameters.Add("@RestaurentID", SqlDbType.Int);
                cmd.Parameters["@RestaurentID"].Value = RestaurantID;
                cmd.CommandType = CommandType.StoredProcedure;

                if (cn.State == ConnectionState.Closed)
                    cn.Open();
                IDataReader reader = cmd.ExecuteReader();
                //RestaurantID = int.Parse(reader["RestaurantID"].ToString())



                while (reader.Read())
                {
                    ListofRestaurents.Add(new Restaurant()
                    {

                        RestaurantID = int.Parse(reader["RestaurantID"].ToString()),
                        RestaurantName = reader["RestaurantName"].ToString(),
                        Address = reader["Address"].ToString(),
                        MobileNo = reader["MobileNo"].ToString(),

                    });
                }
            }
        }
        return ListofRestaurents;


    }


    public List<Cuisine> GetCuisine()
        {

            List<Cuisine> ListofCuisine= new List<Cuisine>();
            using (SqlConnection cn = new SqlConnection(cnn))
            {
                using (SqlCommand cmd = new SqlCommand("USP_ShowCuisine",cn))
                {

                    if (cn.State == ConnectionState.Closed)
                        cn.Open();


                 //   SqlDataAdapter sqlda= new SqlDataAdapter(cmd);
                  //  DataTable dtCuisine = new DataTable();
                  //  sqlda.Fill(dtCuisine);
                    //cn.Close();

                   // foreach( DataRow dr in dtCuisine.Rows)
                  //  {
                  //      ListofCuisine.Add(new Cuisine
                   //     {
                   //         CuisineID = Convert.ToInt32(dr["CuisineID"]),
                    //        RestaurantID = Convert.ToInt32(dr["RestaurantID"]),
                   //         CuisineName = (dr["CuisineName"]).ToString()
                   //     });
                  //  }

                   IDataReader reader = cmd.ExecuteReader();
                   while (reader.Read())
                   {
                       ListofCuisine.Add(new Cuisine()
                       {

                    CuisineID = Convert.ToInt32(reader["CuisineID"]),
                    RestaurantID = Convert.ToInt32(reader["RestaurantID"]),
                    CuisineName = reader["CuisineName"].ToString()
                           
                      });
                   }
                }
            }
            return ListofCuisine;

        }

    }
}

