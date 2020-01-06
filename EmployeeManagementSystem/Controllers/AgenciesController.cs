using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BusinessLogic;
using BusinessLogic.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeManagementSystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AgenciesController : ControllerBase
    {
        private RepositoryBase<Agency> repository = new RepositoryBase<Agency>(new EmployeeManagementSystemContext());
        // GET: api/Agencies
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Agencies/5
        [HttpGet("{id}", Name = "Get")]
        public Agency Get(int id)
        {
            return repository.GetById(id);
        }

        // POST: api/Agencies
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Agencies/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
