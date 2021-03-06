package com.empresa.service;

import java.util.List;


import com.empresa.entity.Medico;

public interface MedicoServicio {

	
	
	public abstract Medico InsertaMedico(Medico obj);	
	
	
	public abstract List<Medico> listarTodos();
	
	public abstract void eliminarMedico(int id);
	
	public abstract List<Medico> buscaPorNombre(String filtro);
	
	public abstract List<Medico> buscaPorEspecialidad(String filtro);

}

