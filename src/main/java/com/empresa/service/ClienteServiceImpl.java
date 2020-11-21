package com.empresa.service;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.empresa.entity.Paciente;
import com.empresa.repository.ClienteRepository;



@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	private ClienteRepository repository;




	@Override
	public Paciente RegistrarCliente(Paciente bean) {
		// TODO Auto-generated method stub
		return repository.save(bean);
	}




	@Override
	public Paciente login(String login, String clave) {
		// TODO Auto-generated method stub
		return repository.login(login, clave);
	}

}
