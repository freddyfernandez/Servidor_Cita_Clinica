package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.empresa.entity.Horario;

public interface HorarioRepository extends JpaRepository<Horario,Integer> {
	
	@Query("Select h from Horario h where h.medico.idMedico = :fil")
	public abstract List<Horario> buscarPorMedico(@Param("fil") int idMedico);

	

	

}
