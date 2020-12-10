package com.empresa.controller;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.empresa.entity.Horario;
import com.empresa.entity.Medico;
import com.empresa.service.HorarioService;

@Controller
public class HorarioController {
	
	@Autowired
    private HorarioService horarioService;
	
	@RequestMapping("/verCrudHorario")
	public String regHorario(HttpSession session ) { 
		Medico objMedico = (Medico)	session.getAttribute("objCliente");
		List<Horario> data= horarioService.buscaPorMedico(objMedico.getIdMedico());
		session.setAttribute("horarios", data);
		return "crudHorario";
    }
	
	@RequestMapping("/registraHorario")
	public String regHorario(Horario obj, HttpSession session) {
		try {
			
			//se instancio el cliente emisor
			Medico objCliente = (Medico)	session.getAttribute("objCliente");
			Horario instanciahorario = new Horario();
			instanciahorario.setFechaHorario(obj.getFechaHorario());
			instanciahorario.setDia(obj.getDia());
			instanciahorario.setHoraInicio(obj.getHoraInicio());
			instanciahorario.setHoraFin(obj.getHoraFin());
			instanciahorario.setMedico(objCliente);
			Horario objSalida = horarioService.InsertaHorario(instanciahorario);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se registró correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:mihorario";
		
		
	}
	
	@RequestMapping("/actualizaHorario")
	public String actHorario(Horario obj, HttpSession session) {
		try {
	
			Horario objSalida = horarioService.InsertaHorario(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se actualizo correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al actualizar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al actualizar");
			e.printStackTrace();
		}
		return "redirect:mihorario";
		
		
	}
	
	@RequestMapping("/eliminaCrudHorario")
	public String eliminaHorario(Integer id, HttpSession session) {
		horarioService.eliminarHorario(id);
		return "redirect:mihorario";
	}
	
	@RequestMapping("/mihorario")
	public String miHorario(HttpSession session ) { 
		Medico objMedico = (Medico)	session.getAttribute("objCliente");
		List<Horario> data= horarioService.buscaPorMedico(objMedico.getIdMedico());
		session.setAttribute("horarios", data);
		return "crudHorario";
    }
	
	
	
}
