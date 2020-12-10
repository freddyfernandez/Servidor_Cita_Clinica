package com.empresa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.UsuarioHasRol;
import com.empresa.repository.UsuarioHasRolRepository;

@Service
public class UsuarioHasRolServiceImpl implements UsuarioHasRolService{
	
	@Autowired
	UsuarioHasRolRepository repositorio;
	
	@Override
	public UsuarioHasRol InsertaUsuarioHasRol(UsuarioHasRol obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

}
