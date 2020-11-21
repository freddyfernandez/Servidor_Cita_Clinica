package com.empresa.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Especialidad;
import com.empresa.repository.EspecialidadRepository;




@Service
public class EspecialidadServiceImpl implements EspecialidadService{

	@Autowired
	private EspecialidadRepository repository;



	@Override
	public List<Especialidad> listaEspecialidadXnombre(String nombre) {
		// TODO Auto-generated method stub
		return repository.buscarPorNombre(nombre);
	}



	@Override
	public List<Especialidad> listaEspecialidad() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}



	@Override
	public void registraActualizaEspecialidad(Especialidad obj) {
		// TODO Auto-generated method stub
		repository.save(obj);
	}

	
	
	

}
