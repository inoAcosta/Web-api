using System.Data;
using Microsoft.AspNetCore.Mvc;
using TiendaApi1.Datos;
using TiendaApi1.Model;
using System.Data.SqlClient;

namespace TiendaApi1.Controllers
{
    [Route("api/Productos")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        [HttpGet]
        //para Mostrar los Productos
        public async Task<ActionResult<List<Mproductos>>> Get()
        {
            var funcion = new Dproductos();
            var lista = await funcion.mostrarProductos();
            return lista;
        }
        [HttpPost]
        public async Task Post([FromBody]Mproductos parametros)
        {
            var funcion = new Dproductos();
            await funcion.InsertarProductos(parametros);
        }

        [HttpPut("{id}")]
        public async Task<AcceptedResult> Put(int id,[FromBody] Mproductos parametros)
        {
            var funcion = new Dproductos();
            parametros.id = id;
            await funcion.EditarProductos(parametros);
            return Accepted();
        }


        [HttpDelete("{id}")]
        public async Task<AcceptedResult> Delete(int id)
        {
            
            var funcion = new Dproductos();
            var parametros = new Mproductos();
            parametros.id = id;
            await funcion.EliminarProductos(parametros);
            return Accepted();
        }
    }


}
