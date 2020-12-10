package com.empresa.controller;

import java.util.List;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.empresa.entity.Medico;
import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.service.UsuarioService;



@Controller
public class LoginController {

	@Autowired
	private UsuarioService servicio;

	@RequestMapping("/")
	public String ver() {
		return "login";
	}
	

	@RequestMapping("/login")
	public String login(Medico cliente, HttpSession session, HttpServletRequest request) {

		Medico objUsu = servicio.login(cliente);
		if (objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		} else {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdMedico());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdMedico());
			
			session.setAttribute("objCliente", objUsu);
			session.setAttribute("objRoles", roles);
			session.setAttribute("objMenus", menus);
			return "redirect:home";
		}
	}
	
	//AQUI SE AGREGAR LA RUTA DEL HOME JSP

	
	@RequestMapping("/verIntranetHome")
	public String verHome() { return "intranetHome"; }
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}

	
	@RequestMapping("/verCrudPaciente")
	public String regPaciente() { return "crudEjemplo"; }
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
