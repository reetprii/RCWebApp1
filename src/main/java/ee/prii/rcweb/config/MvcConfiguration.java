package ee.prii.rcweb.config;

import javax.sql.DataSource;

import ee.prii.rcweb.dao.CompanyDAO;
import ee.prii.rcweb.dao.CompanyDAOImpl;
import ee.prii.rcweb.dao.RatingDAO;
import ee.prii.rcweb.dao.RatingDAOImpl;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages="ee.prii.rcweb")
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter{

	@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Bean
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/rcwebrp");
		dataSource.setUsername("newuser");
		dataSource.setPassword("password");
		
		return dataSource;
	}
	
	@Bean
	public CompanyDAO getCompanyDAO() {
		return new CompanyDAOImpl(getDataSource());
	}
	
	@Bean
	public RatingDAO getRatingDAO() {
		return new RatingDAOImpl(getDataSource());
	}
}
