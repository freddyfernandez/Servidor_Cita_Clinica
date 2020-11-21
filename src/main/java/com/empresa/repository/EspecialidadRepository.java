package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Especialidad;



public interface EspecialidadRepository extends JpaRepository<Especialidad, Integer >{
	
	@Query("Select a from Especialidad a where descripcion like :fil")
	public abstract List<Especialidad> buscarPorNombre(@Param("fil") String filtro);

}
