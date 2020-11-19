package com.empresa.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Medico;
import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.repository.UsuarioRepository;



@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioRepository repository;

	@Override
	public Medico login(Medico bean) {
		return repository.login(bean);
	}

	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		// TODO Auto-generated method stub
		return repository.traerEnlacesDeUsuario(idUsuario);
	}

	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		// TODO Auto-generated method stub
		return repository.traerRolesDeUsuario(idUsuario);
	}



}
