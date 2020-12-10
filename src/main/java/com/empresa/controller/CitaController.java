package com.empresa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.empresa.entity.Cita;
import com.empresa.entity.Medico;
import com.empresa.service.CitaService;

@Controller
public class CitaController {
	
	@Autowired
    private CitaService citaService;
	
	@RequestMapping("/verCrudCita")
	public String listarCitar(HttpSession session) {
		
		    Medico objMedico = (Medico)	session.getAttribute("objCliente");
			List<Cita> data = citaService.filtrarpormedico(objMedico.getIdMedico());
			session.setAttribute("Citas", data);
			return "crudCita";
	}
	
	@RequestMapping("/ActualizaCita")
	public String actCita(Cita obj, HttpSession session) {
		try {
			
			Cita objSalida = citaService.RegistrarCita(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Actualizo correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al actualizar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:verCrudCita";
		
		
	}
	


}
