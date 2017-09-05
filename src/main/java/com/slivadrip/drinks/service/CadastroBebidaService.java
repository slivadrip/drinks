package com.slivadrip.drinks.service;

import javax.persistence.PersistenceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.slivadrip.drinks.model.Bebida;
import com.slivadrip.drinks.repository.Bebidas;
import com.slivadrip.drinks.service.event.bebida.BebidaSalvaEvent;
import com.slivadrip.drinks.service.exception.ImpossivelExcluirEntidadeException;
import com.slivadrip.drinks.storage.FotoStorage;

@Service
public class CadastroBebidaService {
	
	@Autowired
	private Bebidas bebidas;
	
	@Autowired
	private ApplicationEventPublisher publisher;

	@Autowired
	private FotoStorage fotoStorage;
	
	
	@Transactional
	public void salvar(Bebida bebida) {
		bebidas.save(bebida);
		
		publisher.publishEvent(new BebidaSalvaEvent(bebida));
	}
	
	@Transactional
	public void excluir(Bebida bebida) {
		try {
			String foto = bebida.getFoto();
			bebidas.delete(bebida);
			bebidas.flush();
			fotoStorage.excluir(foto);
		} catch (PersistenceException e) {
			throw new ImpossivelExcluirEntidadeException("Impossível apagar bebida. Já foi usada em alguma venda.");
		}
	}
}
