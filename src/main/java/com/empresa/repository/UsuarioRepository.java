package com.empresa.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.empresa.entity.Medico;
import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;

public interface UsuarioRepository extends JpaRepository<Medico, Integer>{

	@Query("Select x from Medico x where x.login = :#{#cli.login} and x.password = :#{#cli.password}")
	public abstract Medico login(@Param(value = "cli") Medico bean);
	
	
	@Query("Select p from Opcion p, RolHasOpcion pr, Rol r, UsuarioHasRol u where "
			+ " p.idOpcion = pr.opcion.idOpcion and "
			+ " pr.rol.idRol = r.idRol and "
			+ " r.idRol = u.rol.idRol and "
			+ " u.usuario.idMedico = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);

	@Query("Select r from Rol r, UsuarioHasRol u where "
			+ " r.idRol = u.rol.idRol and "
			+ " u.usuario.idMedico = :var_idUsuario")
	public abstract List<Rol> traerRolesDeUsuario(@Param("var_idUsuario")int idUsuario);
	
}
