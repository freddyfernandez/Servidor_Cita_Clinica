package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Cita;
import com.empresa.repository.CitaRepository;

@Service
public class CitaServiceImpl implements CitaService{
	
	@Autowired
	CitaRepository repositorio;

	@Override
	public Cita  RegistrarCita(Cita bean) {
		// TODO Auto-generated method stub
		return repositorio.save(bean);
	}

	@Override
	public List<Cita> filtrarpormedico(int id) {
		// TODO Auto-generated method stub
		return repositorio.filtrarpormedico(id);
	}

	@Override
	public List<Cita> filtrarporpaciente(int id) {
		// TODO Auto-generated method stub
		return repositorio.filtrarporpaciente(id);
	}

}
