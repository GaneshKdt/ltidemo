package com.nmims.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.convert.ConversionService;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.nmims.dao.UserDao;
import com.nmims.dao.AnalyticsDAO;
import com.nmims.dao.IATestDAO;
import com.nmims.dao.MettlAssessmentDAO;
import com.nmims.dao.PostDao;
import com.nmims.dao.LtiDao;
import com.nmims.dao.ChatDAO;

@Configuration
@EnableWebMvc //Enable SpringMVC
@ComponentScan({"com.nmims"})
@PropertySource("file:c:/NMIMS_PROPERTY_FILE/ngasce.properties")
@PropertySource("file:${catalina.base}/conf/application.properties")
public class WebConfig extends WebMvcConfigurerAdapter {
	
	/* Handles HTTP GET requests for /resources/** by efficiently serving 
	up static resources in the ${webappRoot}/resources directory */	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	    registry.addResourceHandler("/resources_2015/**").addResourceLocations("/resources_2015/");
	    registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
	}
	
	@Bean("internalResourceViewResolver")
	public ViewResolver internalResourceViewResolver() {
	    InternalResourceViewResolver bean = new InternalResourceViewResolver();
	    bean.setViewClass(JstlView.class);
	    bean.setPrefix("/WEB-INF/views/");
	    bean.setSuffix(".jsp");
	    bean.setOrder(2);
	    return bean;
	}

	@Bean()
	public UserDao service() {
		UserDao bean = new UserDao();
		return bean;
	}
	
	@Bean("analyticsDAO")
	public AnalyticsDAO AnalyticsDAO() {
		AnalyticsDAO bean = new AnalyticsDAO();
		return bean;
	}
	
	@Bean("iATestDAO")
	public IATestDAO IATestDAO() {
		IATestDAO bean = new IATestDAO();
		return bean;
	}
	
	@Bean("mettlAssessmentDAO")
	public MettlAssessmentDAO MettlAssessmentDAO() {
		MettlAssessmentDAO bean = new MettlAssessmentDAO();
		return bean;
	}

	@Bean("postDao")
	public PostDao PostDao() {
		PostDao bean = new PostDao();
		return bean;
	}
	
	@Bean("ltiDao")
	public LtiDao LtiDao() {
		LtiDao bean = new LtiDao();
		return bean;
	}
	
	@Bean("chatDAO")
	public ChatDAO ChatDAO() {
		ChatDAO bean = new ChatDAO();
		return bean;
	}
	
	@Bean
	public static ConversionService conversionService() {
	    return new DefaultFormattingConversionService();
	}

	
}
