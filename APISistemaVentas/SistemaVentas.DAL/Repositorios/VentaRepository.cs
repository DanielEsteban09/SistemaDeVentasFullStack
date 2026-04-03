namespace SistemaVentas.DAL.Repositorios
{
    using SistemaVentas.DAL.DBContext;
    using SistemaVentas.DAL.Repositorios.Contrato;
    using SistemaVentas.Model;
    using System.Threading.Tasks;

    public class VentaRepository : GenericRepository<Venta>, IVentaRepository
    {
        private readonly DbventaContext _dbContext;

        public VentaRepository(DbventaContext dbContext) : base (dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Venta> Registrar(Venta modelo)
        {
            Venta ventaGenerada = new Venta();

            using(var transaction = _dbContext.Database.BeginTransaction())
            {
                try //Actualizamos el stock de la tabla DetalleVentas restandole la cantidad q se vendio
                {
                    foreach(DetalleVenta detalleVenta in modelo.DetalleVenta)
                    {
                        Producto productoEncontrado = _dbContext.Productos.Where(producto => producto.IdProducto == detalleVenta.IdProducto).First();

                        productoEncontrado.Stock = productoEncontrado.Stock - detalleVenta.Cantidad;
                        _dbContext.Productos.Update(productoEncontrado);
                    }
                    await _dbContext.SaveChangesAsync(); //Guardamos los cambios de manera asincrona

                    //Ahora le sumamos 1 al campo UltimoNumero en la tabla NumeroDocumentos
                    NumeroDocumento numeroDocumento = _dbContext.NumeroDocumentos.First();
                    numeroDocumento.UltimoNumero = numeroDocumento.UltimoNumero + 1;
                    numeroDocumento.FechaRegistro = DateTime.Now;

                    _dbContext.NumeroDocumentos.Update(numeroDocumento);
                    await _dbContext.SaveChangesAsync();

                    int CantidadDigitos = 4;
                    string Ceros = string.Concat(Enumerable.Repeat("0", CantidadDigitos));
                    string numeroVenta = Ceros + numeroDocumento.UltimoNumero.ToString(); //Armamos el formato, ej: 00001

                    numeroVenta = numeroVenta.Substring(numeroVenta.Length - CantidadDigitos, CantidadDigitos); //Aqui le restamos el primer 0 para que quede de 4 digitos: 0001

                    modelo.NumeroDocumento = numeroVenta;

                    await _dbContext.Ventas.AddAsync(modelo);
                    await _dbContext.SaveChangesAsync();

                    ventaGenerada = modelo;

                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }

                return ventaGenerada;
            }
        }
    }
}
