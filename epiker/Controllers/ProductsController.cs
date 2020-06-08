using AutoMapper;
using Core.Entities;
using Core.Specifications;
using Epiker.api.Controllers;
using Epiker.api.Dto;
using Epiker.api.Errors;
using Infrastructure;
using Infrastructure.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Epiker.Controllers
{
    public class ProductsController : BaseApiController
    {
        private readonly IGenericRepository<Product> _productsRepo;

        private readonly IGenericRepository<ProductBrand> _brandsRepo;

        private readonly IGenericRepository<ProductType> _typesRepo;

        public StoreContext _context { get; }
        public IMapper _mapper { get; }

        public ProductsController(StoreContext context,
                                  IGenericRepository<Product> productsRepo,
                                  IGenericRepository<ProductBrand> brandsRepo,
                                  IGenericRepository<ProductType> typesRepo,
                                  IMapper mapper
            )
        {
            _context = context;
            _productsRepo = productsRepo;
            _brandsRepo = brandsRepo;
            _typesRepo = typesRepo;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<ActionResult<IReadOnlyList<ProductDto>>> GetProducts()
        {
            var spec = new ProductsWithTypesAndBrandsSpecification();

            var products = await _productsRepo.ListAsync(spec);

            return Ok(_mapper.Map<IReadOnlyList<Product>, IReadOnlyList<ProductDto>>(products));
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse) , StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Epiker.api.Dto.ProductDto>> GetProduct(int id)
        {
            var spec = new ProductsWithTypesAndBrandsSpecification(id);

            var product = await _productsRepo.GetEntityWithSpec(spec);

            if (product == null) return NotFound(new ApiResponse(404));

            return _mapper.Map<Product, ProductDto>(product);
        }

        [HttpGet("brands")]
        public async Task<ActionResult<IReadOnlyList<ProductBrand>>> GetProductBrands()
        {
            return Ok(await _brandsRepo.ListAllAsync());
        }

        [HttpGet("types")]
        public async Task<ActionResult<IReadOnlyList<ProductType>>> GetProductTypes()
        {
            return Ok(await _typesRepo.ListAllAsync());
        }
    }
}