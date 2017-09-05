package com.slivadrip.drinks.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.slivadrip.drinks.model.Usuario;
import com.slivadrip.drinks.repository.helper.usuario.UsuariosQueries;

public interface Usuarios extends JpaRepository<Usuario, Long>, UsuariosQueries {

	public Optional<Usuario> findByEmail(String email);
	public List<Usuario> findByCodigoIn(Long[] codigos);
}
