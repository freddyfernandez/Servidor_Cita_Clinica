package com.empresa.service;

import java.util.List;

import com.empresa.entity.Horario;


public interface HorarioService {
	
	public abstract Horario InsertaHorario(Horario obj);	
	
	public abstract void eliminarHorario(int id);
	
	public abstract List<Horario> buscaPorMedico(int idMedico);

}
