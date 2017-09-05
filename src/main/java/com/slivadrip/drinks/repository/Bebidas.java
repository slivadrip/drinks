package com.slivadrip.drinks.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.slivadrip.drinks.model.Bebida;
import com.slivadrip.drinks.repository.helper.bebida.BebidasQueries;

@Repository
public interface Bebidas extends JpaRepository<Bebida, Long>, BebidasQueries {


}

