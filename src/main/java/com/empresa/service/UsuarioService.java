package com.empresa.service;

import java.util.List;

import com.empresa.entity.Medico;
import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;




public interface UsuarioService {

	public abstract Medico login(Medico bean);
	
	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);
	


}
