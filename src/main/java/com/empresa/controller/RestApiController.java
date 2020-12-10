package com.empresa.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.empresa.entity.Paciente;

import com.empresa.service.ClienteService;


@RestController
@RequestMapping(value ="/Paciente" )
public class RestApiController {
	
	@Autowired
	ClienteService clienteservice;
    

	//obtencion de la url correlativo a la base de datos
	@GetMapping(path = "/ValidarUsuario/{login}/{contrasenia}")
	@ResponseBody
	public Paciente MostrarCredenciales(@PathVariable("login") String vLogin, @PathVariable("contrasenia")String vClave ){
		
		
		Paciente objUsu = clienteservice.login(vLogin, vClave);
		return objUsu;
	}
	
	
}
