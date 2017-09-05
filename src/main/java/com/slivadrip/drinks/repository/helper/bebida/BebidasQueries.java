package com.slivadrip.drinks.repository.helper.bebida;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.slivadrip.drinks.dto.BebidaDTO;
import com.slivadrip.drinks.dto.ValorItensEstoque;
import com.slivadrip.drinks.model.Bebida;
import com.slivadrip.drinks.repository.filter.BebidaFilter;

public interface BebidasQueries {

	public Page<Bebida> filtrar(BebidaFilter filtro, Pageable pageable);
	public List<BebidaDTO> porSkuOuNome(String skuOuNome);
	
	public ValorItensEstoque valorItensEstoque();
}
