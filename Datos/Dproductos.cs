
using System.Data;
using System.Data.SqlClient;
using System.Runtime.ConstrainedExecution;
using TiendaApi1.Conexion;
using TiendaApi1.Model;
namespace TiendaApi1.Datos
{
    public class Dproductos
    {
        //instacia de la clase conexionbd
        Conexionbd cn = new Conexionbd();
        public async Task<List<Mproductos>> mostrarProductos()
        {
            var lista = new List<Mproductos>();
            //traer la informacion
            using (var sql = new SqlConnection(cn.CadenaSQL()))
            {
                //procedimineto almacenado 
                using (var cmd = new SqlCommand("mostrarProductos", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = CommandType.StoredProcedure;
                    //Recorrido de datos
                    using (var item = await cmd.ExecuteReaderAsync())
                    {
                        while (await item.ReadAsync())
                        {
                            var mproductos = new Mproductos();
                            mproductos.id = (int)item["id"];
                            mproductos.descripcion = (string)item["descripcion"];
                            mproductos.precio = (decimal)item["precio"];
                            lista.Add(mproductos);
                        }
                    }
                }
            }
            return lista;
        }
        public async Task InsertarProductos(Mproductos parametros)
        {
            using (var sql = new SqlConnection(cn.CadenaSQL()))
            {
                using (var cmd = new SqlCommand("insertarProductos", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("descripcion", parametros.descripcion);
                    cmd.Parameters.AddWithValue("precio", parametros.precio);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }


        }
        public async Task EditarProductos(Mproductos parametros)
        {
            using (var sql = new SqlConnection(cn.CadenaSQL()))
            {
                using (var cmd = new SqlCommand("actualizarProductos", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("id", parametros.id);
                    cmd.Parameters.AddWithValue("precio", parametros.precio);


                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
        public async Task EliminarProductos(Mproductos parametros)
        {
            using (var sql = new SqlConnection(cn.CadenaSQL()))
            {
                using (var cmd = new SqlCommand("eleminarProductos", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("id", parametros.id);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
