using fileloader.models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace fileloader.dblayer
{
    public class FileLoadLogger
    {
        private string _connectionString;
        public FileLoadLogger(IConfiguration iconfiguration)
        {
            _connectionString = iconfiguration.GetConnectionString("Default");
        }
        public List<File> GetFileList()
        {
            List<File> fileList = new List<File>();
            string queryString =
                "SELECT Id, FileName, FileLength, Source, Destination," +
                "LoadType, LoadTime FROM dbo.FileLoadLog;";
            try
            {
                using (SqlConnection cxn = new SqlConnection(_connectionString))
                {
                    SqlCommand cmd = new SqlCommand(queryString, cxn);
                    cxn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Console.WriteLine(rdr);
                        fileList.Add(new File
                        {
                            Id = Convert.ToInt32(rdr[0]),
                            FileName = rdr[1].ToString(),
                            FileLength = Convert.ToInt32(rdr[2]),
                            Source = rdr[3].ToString(),
                            Destination = rdr[4].ToString(),
                            LoadType = Convert.ToInt32(rdr[5]),
                            LoadTime = Convert.ToDateTime(rdr[6])
                        });
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return fileList;
        }
    }
}
