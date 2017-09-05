package com.slivadrip.drinks.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.slivadrip.drinks.model.Cliente;
import com.slivadrip.drinks.repository.helper.cliente.ClientesQueries;

public interface Clientes extends JpaRepository<Cliente, Long> , ClientesQueries {

	public Optional<Cliente> findByCpfOuCnpj(String cpfOuCnpj);
	
	public List<Cliente> findByNomeStartingWithIgnoreCase(String nome);
}
