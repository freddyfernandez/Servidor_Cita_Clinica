package com.empresa.controller;

import java.util.List;




import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Especialidad;
import com.empresa.entity.Medico;
import com.empresa.entity.UsuarioHasRol;
import com.empresa.entity.UsuarioHasRolPK;
import com.empresa.service.EspecialidadService;
import com.empresa.service.MedicoServicio;
import com.empresa.service.UsuarioHasRolService;


@Controller
public class MedicoController {
	
	@Autowired
	private MedicoServicio MedicoService;
	
	@Autowired
	private EspecialidadService EspecialidadService;
	
	@Autowired
	private UsuarioHasRolService usuarioHasRolService;
	
	//ruta de inicial mapeada de la base de datos
	@RequestMapping("/verCrudMedico")
	public String regMedico(HttpSession session) {
		List<Medico> data = MedicoService.listarTodos();
		session.setAttribute("medicos", data);
		return "crudMedico"; 
	}

	@RequestMapping("/cargaEspecialidad")
	@ResponseBody
	public List<Especialidad> listaEspecialidad() {
		
		return EspecialidadService.listaEspecialidad();
		
	}
	
	
	@RequestMapping("/consultaCrudMedico")
	public String consulta1(String filtro, HttpSession session) {
		List<Medico> data = MedicoService.buscaPorNombre(filtro +"%");
		session.setAttribute("medicos", data);
		return "crudMedico";
	}
	
	@RequestMapping("/eliminaCrudMedico")
	public String eliminaMedico(Integer id, HttpSession session) {
		MedicoService.eliminarMedico(id);
		return "redirect:salida1";
	}
	
	
	
	
	
	@RequestMapping("/registraActualizaCrudMedico")
	public String regMedico(Medico obj, HttpSession session) {
		try {
			Medico objSalida = MedicoService.InsertaMedico(obj);
			
			
			//registra de rol con usuario
			
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdRol(2);
			pk.setIdUsuario(obj.getIdMedico());
			
			UsuarioHasRol uhr = new UsuarioHasRol();
		
			uhr.setUsuario(objSalida);
			uhr.setUsuarioHasRolPk(pk);
			usuarioHasRolService.InsertaUsuarioHasRol(uhr);
			
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
	public String salida(HttpSession session) {
		List<Medico> data = MedicoService.listarTodos();
		session.setAttribute("medicos", data);
		return "crudMedico";
	}
	
	

}
