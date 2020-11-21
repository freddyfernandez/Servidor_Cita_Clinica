package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Especialidad;
import com.empresa.repository.EspecialidadRepository;
import com.empresa.service.*;



@Service
public class EspecialidadServiceImpl implements EspecialidadService{

	@Autowired
	private EspecialidadRepository repository;

	@Override
	public List<Especialidad> listaEspecialidad() {
		return repository.findAll();
	}

	
	
	

}
