package com.slivadrip.drinks.service.event.venda;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import com.slivadrip.drinks.model.Bebida;
import com.slivadrip.drinks.model.ItemVenda;
import com.slivadrip.drinks.repository.Bebidas;

@Component
public class VendaListener {

	@Autowired
	private Bebidas bebidas;
	
	@EventListener
	public void vendaEmitida(VendaEvent vendaEvent) {
		for (ItemVenda item : vendaEvent.getVenda().getItens()) {
			Bebida bebida = bebidas.findOne(item.getBebida().getCodigo());
			bebida.setQuantidadeEstoque(bebida.getQuantidadeEstoque() - item.getQuantidade());
			bebidas.save(bebida);
		}
	}
	
}
