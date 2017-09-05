package com.slivadrip.drinks.service.event.bebida;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import com.slivadrip.drinks.storage.FotoStorage;

@Component
public class BebidaListener {

	@Autowired
	private FotoStorage fotoStorage;

	@EventListener(condition = "#evento.temFoto() and #evento.novaFoto")
	public void bebidaSalva(BebidaSalvaEvent evento) {
		fotoStorage.salvar(evento.getBebida().getFoto());
	}

}
