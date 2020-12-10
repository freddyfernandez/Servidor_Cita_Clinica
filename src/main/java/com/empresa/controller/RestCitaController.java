package com.empresa.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.empresa.entity.Cita;
import com.empresa.entity.Horario;
import com.empresa.entity.Medico;
import com.empresa.service.CitaService;
import com.empresa.service.HorarioService;
import com.empresa.service.MedicoServicio;


@RestController
@RequestMapping(value = "/medico")
public class RestCitaController {
	
	@Autowired
    private HorarioService horarioService;
	
	@Autowired
	private MedicoServicio medicoService;
	
	@Autowired
    private CitaService citaService; 
	
	//API QUE LISTA MEDICOS POR ESPECIALIDAD
	@GetMapping(path = "/buscarmedicos/{parametro}")
	@ResponseBody
	public List<Medico> listarMedicoXEspecialidad(@PathVariable("parametro") String filtro){
		
		return medicoService.buscaPorEspecialidad(filtro+"%");
		
	}
	
	//API QUE LISTA TODOS LOS MEDICOS 
    @GetMapping(path = "/listamedicos")
	@ResponseBody
	public List<Medico> listarMedicos(){		
			return medicoService.listarTodos();
					
	}
    
    //API QUE LISTA TODOS LOS HORARIOS DE UN MEDICO 
    @GetMapping(path = "/buscarhorario/{parametro}")
    @ResponseBody
	public List<Horario> listarHorarioxidMedico(@PathVariable("parametro") int filtro){
		
		return  horarioService.buscaPorMedico(filtro);
    }
	
    @PostMapping(path = "/saveCita")
	public void registrarCita(@RequestBody Cita bean) {
    	citaService.RegistrarCita(bean);
	}
    
    //API QUE LISTA CITAS POR PACIENTE
  	@GetMapping(path = "/listarCitasXPaciente/{parametro}")
  	@ResponseBody
  	public List<Cita> listarCitaXPaciente(@PathVariable("parametro") int filtro){
  		
  		return citaService.filtrarporpaciente(filtro);
  		
  	}
	
	
	

}
