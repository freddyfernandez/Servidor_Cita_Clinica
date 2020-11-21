package com.empresa.service;

import java.util.List;

import com.empresa.entity.Especialidad;


public interface EspecialidadService {

	
	public abstract List<Especialidad> listaEspecialidadXnombre(String nombre);
	
	public abstract List<Especialidad> listaEspecialidad();
	
	public abstract void registraActualizaEspecialidad(Especialidad obj);

}