using QLKS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLKS.DatabaseConnection
{
    public class DBconnection
    {
        public static DataQLKSDataContext GetConnect()
        {
            string connectionString = "Data Source=DESKTOP-1BPC5SQ;Initial Catalog=db_HotelManagement;Integrated Security=True";
            DataQLKSDataContext dataContext = new DataQLKSDataContext(connectionString);
            return dataContext;
        }
    }
}