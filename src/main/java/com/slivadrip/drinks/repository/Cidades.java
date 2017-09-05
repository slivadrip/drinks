package com.slivadrip.drinks.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.slivadrip.drinks.model.Cidade;
import com.slivadrip.drinks.model.Estado;
import com.slivadrip.drinks.repository.helper.cidade.CidadesQueries;

public interface Cidades extends JpaRepository<Cidade, Long>, CidadesQueries {

	public List<Cidade> findByEstadoCodigo(Long codigoEstado);
	public Optional<Cidade> findByNomeAndEstado(String nome, Estado estado);
}
