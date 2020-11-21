package com.empresa.service;

import com.empresa.entity.Paciente;

public interface ClienteService {

	public abstract Paciente login(String login,String clave);
	public abstract Paciente RegistrarCliente(Paciente bean);

	
	
}
