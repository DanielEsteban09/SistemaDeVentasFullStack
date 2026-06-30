namespace SitemaVentas.BLL.Servicios.Contrato
{
    using SistemaVentas.DTO;

    public interface ICategoriaService
    {
        Task<List<CategoriaDTO>> Lista();
    }
}
