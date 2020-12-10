package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Horario;
import com.empresa.repository.HorarioRepository;

@Service
public class HorarioServiceImpl implements HorarioService{
	
	@Autowired
    HorarioRepository repositorio;
	@Override
	public Horario InsertaHorario(Horario obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

	@Override
	public void eliminarHorario(int id) {
		// TODO Auto-generated method stub
		repositorio.deleteById(id);
		
	}

	@Override
	public List<Horario> buscaPorMedico(int idMedico) {
		// TODO Auto-generated method stub
		return repositorio.buscarPorMedico(idMedico);
	}
	

}
