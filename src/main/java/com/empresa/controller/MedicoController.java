package com.empresa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.controller.*;
import com.empresa.entity.Especialidad;
import com.empresa.entity.Medico;
import com.empresa.service.EspecialidadService;
import com.empresa.service.MedicoServicio;


@Controller
public class MedicoController {
	
	@Autowired
	private MedicoServicio MedicoService;
	
	@Autowired
	
	private EspecialidadService EspecialidadService;
	
	
	@RequestMapping("/cargaEspecialidad")
	@ResponseBody
	public List<Especialidad> listaEspecialidad() {
		
		return EspecialidadService.listaEspecialidad();
		
	}
	
	
	@RequestMapping("/consultaCrudMedico")
	public String consulta1(String filtro, HttpSession session) {
		List<Medico> data = MedicoService.buscaPorNombre(filtro +"%");
		session.setAttribute("Medico", data);
		return "crudMedico";
	}
	
	@RequestMapping("/eliminaCrudMedico")
	public String eliminaMedico(Integer id, HttpSession session) {
		MedicoService.eliminarMedico(id);
		return "redirect:salida3";
	}
	
	
	
	
	
	@RequestMapping("/insertarMedico")
	public String regMedico(Medico obj, HttpSession session) {
		try {
			Medico objSalida = MedicoService.InsertaMedico(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se registró correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salida1";
	}
	
	@RequestMapping("/salida1")
	public String salida() {
		return "crudMedico";
	}
	

}
