namespace SitemaVentas.BLL.Servicios
{
    using AutoMapper;
    using SistemaVentas.DAL.Repositorios.Contrato;
    using SistemaVentas.DTO;
    using SistemaVentas.Model;
    using SitemaVentas.BLL.Servicios.Contrato;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    public class CategoriaService : ICategoriaService
    {
        private readonly IGenericRepository<Categoria> _categoriaRepositorio;
        private readonly IMapper _mapper;

        public CategoriaService(IGenericRepository<Categoria> categoriaRepositorio, IMapper mapper)
        {
            _categoriaRepositorio = categoriaRepositorio;
            _mapper = mapper;
        }

        public async Task<List<CategoriaDTO>> Lista()
        {
            try
            {
                var listaCategorias = await _categoriaRepositorio.Consultar();
                return _mapper.Map<List<CategoriaDTO>>(listaCategorias.ToList());
            }
            catch
            {
                throw;
            }

        }

    }
}
