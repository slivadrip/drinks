package com.slivadrip.drinks.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.slivadrip.drinks.service.CadastroBebidaService;
import com.slivadrip.drinks.storage.FotoStorage;
import com.slivadrip.drinks.storage.local.FotoStorageLocal;

@Configuration
@ComponentScan(basePackageClasses = CadastroBebidaService.class)
public class ServiceConfig {

	@Bean
	public FotoStorage fotoStorage() {
		return new FotoStorageLocal();
	}
}
