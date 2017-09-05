package com.slivadrip.drinks.config.init;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.HttpPutFormContentFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.slivadrip.drinks.config.JPAConfig;
import com.slivadrip.drinks.config.MailConfig;
import com.slivadrip.drinks.config.SecurityConfig;
import com.slivadrip.drinks.config.ServiceConfig;
import com.slivadrip.drinks.config.WebConfig;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class<?>[] { JPAConfig.class,  ServiceConfig.class , SecurityConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {

		return new Class<?>[] { WebConfig.class, MailConfig.class };	}

	@Override
	protected String[] getServletMappings() {

		return new String[] { "/" };
	}


	@Override
	protected Filter[] getServletFilters() {
		HttpPutFormContentFilter httpPutFormContentFilter = new HttpPutFormContentFilter();
        return new Filter[] { httpPutFormContentFilter };
	}
	
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}


}
