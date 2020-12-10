package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.Cita;

public interface CitaRepository extends JpaRepository<Cita, Integer>{
	
	@Query("Select c from Cita c where c.medico.idMedico = :id")
	public abstract List<Cita> filtrarpormedico(@Param("id") int id);
	
	@Query("Select c from Cita c where c.paciente.idPaciente = :id")
	public abstract List<Cita> filtrarporpaciente(@Param("id") int id);

}
