package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Medico;
import com.empresa.repository.*;



public interface MedicoRepository extends JpaRepository<Medico, Integer>{

	//metodo1
	@Query("Select a from Medico a where nombre like :nomb")
	public abstract List<Medico> buscarPorNombre(@Param("nomb") String filtro);

	//es igual que mapear el metodo1 por ids
	//consulta api para la api rest filtrado por especialidad
	@Query("Select m from Medico m, Especialidad e where "
			+ " m.especialidad.idEspecialidad = e.idEspecialidad and "
			+ " m.especialidad.descripcion like :nomb")
	public abstract List<Medico> buscarPorEspecialidad(@Param("nomb") String filtro);
	
	
	
}
