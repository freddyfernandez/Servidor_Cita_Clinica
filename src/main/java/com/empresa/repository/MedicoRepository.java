package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Medico;
import com.empresa.repository.*;



public interface MedicoRepository extends JpaRepository<Medico, Integer>{

	@Query("Select a from Medico a where nombres like :nomb")
	public abstract List<Medico> buscarPorNombre(@Param("nomb") String filtro);

}
