package com.slivadrip.drinks.repository.helper.venda;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.slivadrip.drinks.dto.VendaMes;
import com.slivadrip.drinks.dto.VendaOrigem;
import com.slivadrip.drinks.model.Venda;
import com.slivadrip.drinks.repository.filter.VendaFilter;

public interface VendasQueries {

	public Page<Venda> filtrar(VendaFilter filtro, Pageable pageable);
	public Venda buscarComItens(Long codigo);
	
	
	public BigDecimal valorTotalNoAno();
	public BigDecimal valorTotalNoMes();
	public BigDecimal valorTicketMedioNoAno();
	
	public List<VendaMes> totalPorMes();
	public List<VendaOrigem> totalPorOrigem();
}
