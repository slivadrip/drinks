package com.slivadrip.drinks.service.event.bebida;

import org.springframework.util.StringUtils;

import com.slivadrip.drinks.model.Bebida;

public class BebidaSalvaEvent {

	
	private Bebida bebida;

	public BebidaSalvaEvent(Bebida bebida) {
		this.bebida = bebida;
	}

	public Bebida getBebida() {
		return bebida;
	}
	
	public boolean temFoto() {
		return !StringUtils.isEmpty(bebida.getFoto());
	}

	public boolean isNovaFoto() {
		return bebida.isNovaFoto();
	}
	
}