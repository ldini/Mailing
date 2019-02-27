using System;
using System.Collections.Generic;

using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DataHelpers
{
    public class SQLHelper
    {
        private string conString;
        private SqlConnection sqlConInternal = null;
        private SqlTransaction sqlTrans = null;
        public bool NullParameters = true;
        public string messages = string.Empty;

        /// <summary>
        /// Conexion x default "connectionstring"
        /// </summary>
        public SQLHelper()
        {
            this.conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public SQLHelper(string ConString)
        {
            this.conString = ConfigurationManager.ConnectionStrings[ConString].ConnectionString;
        }

        public void openConTrans()
        {

            if (sqlConInternal == null)
            {
                sqlConInternal = new SqlConnection(conString);
                sqlConInternal.Open();
                sqlTrans = sqlConInternal.BeginTransaction(IsolationLevel.ReadUncommitted);
            }
            else
                throw new Exception("Ya hay una conexión creada y abierta.");

        }

        public void closeConTransCommit()
        {

            if (sqlConInternal != null)
            {
                try
                {
                    sqlTrans.Commit();
                    sqlConInternal.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("No se pudo cerrar la conexión", ex);
                }
            }
            sqlConInternal = null;

        }

        public void closeConTransRollback()
        {

            if (sqlConInternal != null)
            {
                try
                {
                    sqlTrans.Rollback();
                    sqlConInternal.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("No se pudo cerrar la conexión", ex);
                }
            }
            sqlConInternal = null;

        }

        public DataTable exec(string sql, params SqlParameter[] args)
        {
            return exec(sql, CommandType.Text, args);
        }

        public DataTable execTrans(string sql, params SqlParameter[] args)
        {
            return execTrans(sql, CommandType.Text, args);
        }

        public object execScalar(string sql, params SqlParameter[] args)
        {
            return execScalar(sql, CommandType.Text, args);
        }

        public object execNonQuery(string sql, params SqlParameter[] args)
        {
            return execNonQuery(sql, CommandType.Text, args);
        }

        public object execNonQueryTrans(string sql, params SqlParameter[] args)
        {
            return execNonQueryTrans(sql, CommandType.Text, args);
        }

        /// <summary>
        /// Ejecutar comando SQL normal
        /// </summary>
        public DataTable exec(string sql, CommandType cmdType, params SqlParameter[] args)
        {

            using (SqlConnection sqlConn = new SqlConnection(conString))
            {
                sqlConn.Open();
                using (SqlCommand sqlComm = new SqlCommand(sql, sqlConn))
                {
                    sqlComm.CommandType = cmdType;
                    CreateParameters(args, sqlComm);
                    SqlDataAdapter adap = new SqlDataAdapter(sqlComm);
                    DataTable tbl = new DataTable();
                    adap.Fill(tbl);
                    return tbl;
                }
            }
        }

        public DataSet execDataSet(string sql, CommandType cmdType, params SqlParameter[] args)
        {

            using (SqlConnection sqlConn = new SqlConnection(conString))
            {
                sqlConn.Open();
                using (SqlCommand sqlComm = new SqlCommand(sql, sqlConn))
                {
                    sqlComm.CommandType = cmdType;
                    CreateParameters(args, sqlComm);
                    SqlDataAdapter adap = new SqlDataAdapter(sqlComm);
                    DataSet tbl = new DataSet();
                    adap.Fill(tbl);
                    return tbl;
                }
            }
        }

        /// <summary>
        /// Ejecutar comando SQL normal
        /// </summary>
        public DataTable exec(string sql, CommandType cmdType, int segundos, params SqlParameter[] args)
        {
            using (SqlConnection sqlConn = new SqlConnection(conString))
            {
                sqlConn.Open();
                using (SqlCommand sqlComm = new SqlCommand(sql, sqlConn))
                {
                    sqlComm.CommandType = cmdType;
                    sqlComm.CommandTimeout = segundos;
                    CreateParameters(args, sqlComm);
                    SqlDataAdapter adap = new SqlDataAdapter(sqlComm);
                    DataTable tbl = new DataTable();

                    adap.Fill(tbl);

                    return tbl;

                }
            }

        }

        public DataTable execWithMessages(string sql, CommandType cmdType, int segundos, params SqlParameter[] args)
        {
            messages = string.Empty;
            using (SqlConnection sqlConn = new SqlConnection(conString))
            {
                sqlConn.Open();
                using (SqlCommand sqlComm = new SqlCommand(sql, sqlConn))
                {
                    sqlComm.CommandType = cmdType;
                    sqlComm.CommandTimeout = segundos;
                    CreateParameters(args, sqlComm);
                    SqlDataAdapter adap = new SqlDataAdapter(sqlComm);
                    DataTable tbl = new DataTable();
                    sqlConn.InfoMessage += delegate (object sender, SqlInfoMessageEventArgs e)
                    {
                        messages += "\n" + e.Message;
                    };
                    adap.Fill(tbl);

                    return tbl;

                }
            }

        }

        /// <summary>
        /// Ejecutar comando SQL normal
        /// </summary>
        public DataTable execTrans(string sql, CommandType cmdType, params SqlParameter[] args)
        {

            using (SqlCommand sqlComm = new SqlCommand(sql, sqlConInternal, sqlTrans))
            {
                sqlComm.CommandType = cmdType;

                CreateParameters(args, sqlComm);
                SqlDataAdapter adap = new SqlDataAdapter(sqlComm);
                DataTable tbl = new DataTable();
                adap.Fill(tbl);

                return tbl;
            }
        }

        /// <summary>
        /// Ejecutar comando SQL scalar
        /// </summary>
        public object execScalar(string sql, CommandType cmdType, params SqlParameter[] args)
        {
            try
            {
                using (SqlConnection sqlConn = new SqlConnection(conString))
                {
                    sqlConn.Open();
                    using (SqlCommand sqlComm = new SqlCommand(sql, sqlConn))
                    {
                        sqlComm.CommandType = cmdType;
                        CreateParameters(args, sqlComm);
                        object obj = sqlComm.ExecuteScalar();

                        return obj;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Ejecutar comando SQL NonQuery
        /// </summary>
        public int execNonQuery(string sql, CommandType cmdType, params SqlParameter[] args)
        {

            using (SqlConnection sqlConn = new SqlConnection(conString))
            {
                sqlConn.Open();
                using (SqlCommand sqlComm = new SqlCommand(sql, sqlConn))
                {
                    sqlComm.CommandType = cmdType;
                    CreateParameters(args, sqlComm);
                    int re = sqlComm.ExecuteNonQuery();

                    return re;
                }
            }

        }

        /// <summary>
        /// Ejecutar comando SQL NonQuery
        /// </summary>
        public int execNonQueryTrans(string sql, CommandType cmdType, params SqlParameter[] args)
        {

            using (SqlCommand sqlComm = new SqlCommand(sql, sqlConInternal, sqlTrans))
            {
                sqlComm.CommandType = cmdType;
                CreateParameters(args, sqlComm);
                int re = sqlComm.ExecuteNonQuery();

                return re;
            }


        }



        /// <summary>
        /// Crea la lista de parametros
        /// </summary>
        /// <param name="args"></param>
        /// <param name="sqlComm"></param>
        private void CreateParameters(SqlParameter[] args, SqlCommand sqlComm)
        {
            foreach (SqlParameter param in args)
            {
                if (param.Value == null)
                {
                    sqlComm.Parameters.Add(new SqlParameter(param.ParameterName, DBNull.Value));
                }
                else if (NullParameters && (param.Value is string && (String.IsNullOrEmpty(((string)param.Value).Replace("%", "").Trim()) || (string)param.Value == "-1")))
                {
                    sqlComm.Parameters.Add(new SqlParameter(param.ParameterName, DBNull.Value));
                }
                else
                {
                    sqlComm.Parameters.Add(param);
                }
            }
        }



    }
}