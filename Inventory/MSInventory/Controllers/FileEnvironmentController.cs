using Microsoft.AspNetCore.Mvc;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace m2esolution.co.za.MSInventory.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FileEnvironmentController : ControllerBase
    {
        private IHostingEnvironment _environment;

        public FileEnvironmentController(IHostingEnvironment environment)
        {
            _environment = environment;
        }


        [HttpGet("Get")]
        public List<FileModelDto> GetEnvImages()
        {
            //Fetch all files in the Folder (Directory).
            string[] filePaths = Directory.GetFiles(Path.Combine(this._environment.WebRootPath, "Images/"));
            List<FileModelDto> files = new List<FileModelDto>();
            foreach (string filePath in filePaths)
            {
                files.Add(new FileModelDto { FileName = Path.GetFileName(filePath) });
            }
            return files;
        }

        [HttpGet("getfile/{fileName}")]
        public FileResult DownloadFile(string fileName)
        {
            //Build the File Path.
            string path = Path.Combine(this._environment.WebRootPath, "Images/") + fileName;

            //Read the File data into Byte Array.
            byte[] bytes = System.IO.File.ReadAllBytes(path);

            //Send the File to Download.
            return File(bytes, "application/octet-stream", fileName);
        }

    }
       
}
