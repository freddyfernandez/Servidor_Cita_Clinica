package com.empresa.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.empresa.entity.Paciente;



public interface ClienteRepository extends JpaRepository<Paciente, Integer>{

	@Query("Select x from Paciente x where x.login = :login and x.password = :password")
	public abstract Paciente login(@Param(value = "login") String login,@Param(value = "password") String clave );
	
}
