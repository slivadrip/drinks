package com.slivadrip.drinks.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.slivadrip.drinks.model.Estilo;
import com.slivadrip.drinks.repository.helper.estilo.EstilosQueries;

@Repository
public interface Estilos extends JpaRepository<Estilo, Long>, EstilosQueries{
	
	public Optional<Estilo> findByNomeIgnoreCase(String nome);

}
