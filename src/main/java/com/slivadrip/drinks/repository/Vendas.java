package com.slivadrip.drinks.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.slivadrip.drinks.model.Venda;
import com.slivadrip.drinks.repository.helper.venda.VendasQueries;

public interface Vendas extends JpaRepository<Venda, Long>, VendasQueries {

}
