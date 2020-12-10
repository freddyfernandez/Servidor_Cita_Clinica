package com.empresa.service;

import java.util.List;

import com.empresa.entity.Cita;


public interface CitaService {
	
	
	//RETORNA UN OBJETO CITA
	//SI SE USA VOID SOLO EFECTUA LA OPERACION MAS NO ENVIA UNA CAPTURAS DE OPERACION
	public abstract Cita RegistrarCita(Cita bean);
	
	public abstract List<Cita> filtrarpormedico(int id);
	
	public abstract List<Cita> filtrarporpaciente(int id);

}
