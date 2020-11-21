package com.empresa.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.empresa.entity.Especialidad;
import com.empresa.service.EspecialidadService;

@Controller
public class EspecialidadController {
	
	@Autowired
	EspecialidadService  especialidadService;
	
	//ruta de inicial mapeada de la base de datos
	@RequestMapping("/verCrudEspecialidad")
	public String regEspecialidad(HttpSession session) {
		List<Especialidad> data = especialidadService.listaEspecialidad();
		session.setAttribute("especialidades", data);
		return "crudEspecialidad";
    }
	
	
	@RequestMapping("/consultaCrudEspecialidad")
	public String verEspecialidad(String filtro,HttpSession session) {
		
		//la variable filtro debe ser igual al name de busqueda que esta en el jsp
		List<Especialidad> lista = especialidadService.listaEspecialidadXnombre(filtro+"%");
		session.setAttribute("especialidades", lista);	
		return "crudEspecialidad";
	}
	
	@RequestMapping("/registraActualizaCrudEspecialidad")
	public String registra(Especialidad obj, HttpSession session) {
		especialidadService.registraActualizaEspecialidad(obj);
		return "redirect:salida";
	}
	
	
	@RequestMapping("/salida")
	public String salida(HttpSession session) {
		List<Especialidad> data = especialidadService.listaEspecialidad();
		session.setAttribute("especialidades", data);
		return "crudEspecialidad";
	}
	
	
	
	
	
	
	

}
