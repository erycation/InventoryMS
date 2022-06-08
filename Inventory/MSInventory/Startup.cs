using MSInventory.Repository;
using MSInventory.Repository.Interface;
using MSInventory.Service;
using MSInventory.Service.Interface;
using MSInventory.Shared;
using MSInventory.Shared.Helpers;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

namespace MSInventory
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        private readonly string _policyName = "CorsPolicy";

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "MSInventory", Version = "v1" });
            });

            services.AddCors(opt =>
            {
                opt.AddPolicy(name: _policyName, builder =>
                {
                    builder.AllowAnyOrigin()
                        .AllowAnyHeader()
                        .AllowAnyMethod();
                });
            });

            services.AddDbContext<InventoryDBContext>(options =>
             options.UseLazyLoadingProxies().UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = true;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey =
                        new SymmetricSecurityKey(
                            Encoding.ASCII.GetBytes(Configuration.GetSection("JWTSettings:SecretKey").Value)),
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });

            services.AddAuthorization();


            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            //services.Configure<DomainConfig>(Configuration.GetSection("DomainConfig"));
            services.AddSingleton<IAuthManager>(new AuthManager(Configuration.GetSection("JWTSettings:SecretKey").Value));

            services.AddScoped<IAuthenticateService, AuthenticateService>();
            
            services.AddScoped<IRoleService, RoleService>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUsersService, UsersService>();
            services.AddScoped<IVendorRepository, VendorRepository>();
            services.AddScoped<IVendorService, VendorService>();
            services.AddScoped<IExpectedInventoryRepository, ExpectedInventoryRepository>();
            services.AddScoped<IExpectedInventoryService, ExpectedInventoryService>();
            services.AddScoped<IInventoryRepository, InventoryRepository>();
            services.AddScoped<IInventoryService, InventoryService>();
            services.AddScoped<IInventoryTransactionRepository, InventoryTransactionRepository>();
            services.AddScoped<IInventoryTransactionService, InventoryTransactionService>();
            services.AddScoped<IReportRepository, ReportRepository>();
            services.AddScoped<IReportService, ReportService>();
            services.AddScoped<IInventoryCertificateRepository, InventoryCertificateRepository>();
            services.AddScoped<IInventoryCertificateService, InventoryCertificateService>();
            services.AddScoped<ICustomerRepository, CustomerRepository>();
            services.AddScoped<ICustomerService, CustomerService>();
            services.AddScoped<IOrderRepository, OrderRepository>();
            services.AddScoped<IOrderService, OrderService>();
            services.AddScoped<IOrderItemRepository, OrderItemRepository>();
            services.AddScoped<IOrderItemService, OrderItemService>();
            //services.AddScoped<IFilesEnvironment, FilesEnvironment>();

            services.AddScoped<IInventoryBalanceRepository, InventoryBalanceRepository>();
            services.AddScoped<IInventoryBalanceService, InventoryBalanceService>();
            //InventoryBalanceRepository : Repository<InventoryBalance>, IInventoryBalanceRepository
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
           // if (env.IsDevelopment())
           // {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "MSInventory v1"));
           // }
            
            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors(_policyName);
            // global error handler
            app.UseMiddleware<ErrorHandlerMiddleware>();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
