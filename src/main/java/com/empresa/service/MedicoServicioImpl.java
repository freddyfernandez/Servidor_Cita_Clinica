package com.empresa.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Medico;
import com.empresa.repository.MedicoRepository;





@Service
public class MedicoServicioImpl implements MedicoServicio {
	
	@Autowired
	private MedicoRepository repository;
	
	

	@Override
	public Medico InsertaMedico(Medico obj) {
		
		return repository.save(obj);
	}



	@Override
	public List<Medico> buscaPorNombre(String filtro) {
		
		
		return repository.buscarPorNombre(filtro);
	}



	@Override
	public List<Medico> listarTodos() {
		
		return repository.findAll();
	}



	@Override
	public void eliminarMedico(int id) {
		repository.deleteById(id);
		
	}



	@Override
	public List<Medico> buscaPorEspecialidad(String filtro) {
		// TODO Auto-generated method stub
		return repository.buscarPorEspecialidad(filtro);
	}

}