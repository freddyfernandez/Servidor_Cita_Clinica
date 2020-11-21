<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>

<title>Ejemplos de CIBERTEC - Freddy Fernandez </title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />

<div class="container"style="margin-top: 4%">
 <h1>Crud de Medico</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudMedico">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudMedico" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombres</th>
												<th>Apellido</th>
												<th>DNI</th>
												<th>Direccion</th>
												<th>Nro Celular</th>
												<th>Loguin</th>
												<th>Password</th>
												<th>Especialidad</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.medicos}" var="x">
													<tr>
														<td>${x.idMedico}</td>
														<td>${x.nombre}</td>
														<td>${x.apellido}</td>
														<td>${x.dni}</td>
														<td>${x.direccion}</td>
														<td>${x.nroCelular}</td>
														<td>${x.login}</td>
														<td>${x.password}</td>
														<td>${x.especialidad.descripcion}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idMedico}','${x.nombre}','${x.apellido}','${x.dni}','${x.direccion}','${x.nroCelular}',
															'${x.login}','${x.password}','${x.especialidad.idEspecialidad}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idMedico}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Medico</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudMedico" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Medico</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" type="text" id="id_registra_nombre" name="nombre" placeholder="Ingrese nombres Completos"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_paterno">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_apellido" name="apellido" placeholder="Ingrese los apellidos" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_dni" name="dni" placeholder="Ingrese DNI" type="text"/>
		                                        </div>
		                                    </div> 
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_direccion" name="direccion" placeholder="Ingrese Su Direccion" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">NroCelular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_celular" name="nroCelular" placeholder="Ingrese Numero de celular" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_login" name="login" placeholder="Ingrese el login" type="text"/>
		                                        </div>
		                                    </div> 
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_password" name="password" placeholder="Ingrese el Password" type="text"/>
		                                        </div>
		                                    </div>       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_registra_especialidad">Especialidad</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_especialidad" name="especialidad.idEspecialidad" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>
							                               
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Medico</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudMedico" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Medico</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idMedico" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                             
		                                 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_mujeres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" type="text" id="id_actualiza_nombre" name="nombre" placeholder="Ingrese nombres Completos"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_maxima">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_apellido" name="apellido" placeholder="Ingrese sus apellidos " type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_dni" name="dni" placeholder="Ingrese el numero de DNI" type="text"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_direccion" name="direccion" placeholder="Ingrese la Direccion" type="text"/>
		                                        </div>
		                                    </div>
		                                       <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">nroCelular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_celular" name="nroCelular" placeholder="Ingrese el numero de Celular" type="text"/>
		                                        </div>
		                                    </div> 
		                                       <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_login" name="login" placeholder="Ingrese el login" type="text"/>
		                                        </div>
		                                    </div>  
		                                       <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_password" name="password" placeholder="Ingrese su contraseÒa" type="text"/>
		                                        </div>
		                                    </div>    
		                                       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Especialidad</label>
		                                        <div class="col-lg-5">
													<select id="id_act_especialidad" name="especialidad.idEspecialidad" class='form-control'>
							                            	<option value=" ">[Seleccione]</option> 							                            	
							                            	   
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Medico</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>
				

</div>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombres,Apellido,Dni,Direccion,Celular,Login,Password,idEspecialidad){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_actualiza_nombre]').val(nombres);
	$('input[id=id_actualiza_apellido]').val(Apellido);
	$('input[id=id_actualiza_dni]').val(Dni);
	$('input[id=id_actualiza_direccion]').val(Direccion);
	$('input[id=id_actualiza_celular]').val(Celular);
	$('input[id=id_actualiza_login]').val(Login);
	$('input[id=id_actualiza_password]').val(Password);
	$('select[id=id_act_especialidad]').val(idEspecialidad);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>

<script type="text/javascript">
$.getJSON("cargaEspecialidad", {}, function(data){
	$.each(data, function(index,item){
		$("#id_act_especialidad").append("<option value="+item.idEspecialidad +">"+ item.descripcion +"</option>");
		$("#id_reg_especialidad").append("<option value="+item.idEspecialidad +">"+ item.descripcion +"</option>");
	});
});
</script>

<script type="text/javascript">

$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_registra_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 2 a 30 caracteres',
                	min : 2,
                	max : 50
                }
                ,
                regexp: {
                     regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                     message: 'Debe contener solo letras'
                }
            }
        },
        apellido: {
    		selector : '#id_registra_apellido',
            validators: {
                notEmpty: {
                    message: 'Los Apellidos son un campo obligatorio'
                },
                stringLength :{
        	        message:'Los apellidos son de 2 a 30 caracteres',
        	        min : 2,
        	        max : 30
                }
                ,
                regexp: {
                     regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                     message: 'Debe contener solo letras'
                }
        
            }
        },
        dni: {
    		selector : '#id_registra_dni',
            validators: {
            	notEmpty: {
                    message: 'El DNI es un campo obligatorio'
                },
                regexp: {
                    regexp: /^[0-9]{8}$/,
                    message: 'el dni es de 8 dÌgitos'
                }
               
             }
        },

        direccion: {
    		selector : '#id_registra_direccion',
            validators: {
            	notEmpty: {
                    message: 'La direccion es un campo obligatorio'
                },
                stringLength :{
        	        message:'de 10 a 60 caracteres',
        	        min : 10,
        	        max : 60
               }
             }
        },

        nroCelular: {
    		selector : '#id_registra_celular',
            validators: {
            	notEmpty: {
                    message: 'El Numero de Celular es Campo Obligatorio'
                },
                stringLength :{
        	        message:'Son 9 Digitos',
        	        max : 9
               },
              
             }
        },
        
        login: {
    		selector : '#id_registra_login',
            validators: {
            	notEmpty: {
                    message: 'El Login es un Campo Obligatorio'
                },
                stringLength :{
        	        message:' solo letras',
        	        min : 1,
        	        max : 30
               },
               regexp: {
                    regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                    message: 'Formato Incorrecto'
               }
             }
        },

        password: {
    		selector : '#id_registra_password',
            validators: {
            	notEmpty: {
                    message: 'Ingrese ContraseÒa'
                },
                stringLength :{
        	        message:'de 1 Digitos a 30',
        	        min : 1,
        	        max : 30
               },
              
             }
        },
       
        especialidad: {
    		selector : '#id_reg_especialidad',
            validators: {
            	notEmpty: {
                    message: 'Seleccionar el Campo Especialidad obligatorio'
                }
            }
        }
    	
    }  
 
});

$('#id_form_actualiza').bootstrapValidator({
	 message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	nombre: {
	    		selector : '#id_actualiza_nombre',
	            validators: {
	                notEmpty: {
	                    message: 'El nombre es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'El nombre es de 2 a 30 caracteres',
	                	min : 2,
	                	max : 50
	                }
	                ,
	                regexp: {
	                     regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
	                     message: 'Debe contener solo letras'
	                }
	            }
	        },
	        apellido: {
	    		selector : '#id_actualiza_apellido',
	            validators: {
	                notEmpty: {
	                    message: 'Los Apellidos son un campo obligatorio'
	                },
	                stringLength :{
	        	        message:'Los apellidos son de 2 a 30 caracteres',
	        	        min : 2,
	        	        max : 30
	                }
	                ,
	                regexp: {
	                     regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
	                     message: 'Debe contener solo letras'
	                }
	        
	            }
	        },
	        dni: {
	    		selector : '#id_actualiza_dni',
	            validators: {
	            	notEmpty: {
	                    message: 'El DNI es un campo obligatorio'
	                },
	                regexp: {
	                    regexp: /^[0-9]{8}$/,
	                    message: 'el dni es de 8 dÌgitos'
	                }
	               
	             }
	        },

	        direccion: {
	    		selector : '#id_actualiza_direccion',
	            validators: {
	            	notEmpty: {
	                    message: 'La direccion es un campo obligatorio'
	                },
	                stringLength :{
	        	        message:'de 10 a 60 caracteres',
	        	        min : 10,
	        	        max : 60
	               }
	             }
	        },

	        nroCelular: {
	    		selector : '#id_actualiza_celular',
	            validators: {
	            	notEmpty: {
	                    message: 'El Numero de Celular es Campo Obligatorio'
	                },
	                stringLength :{
	        	        message:'Son 9 Digitos',
	        	        max : 9
	               },
	              
	             }
	        },
	        
	        login: {
	    		selector : '#id_registra_login',
	            validators: {
	            	notEmpty: {
	                    message: 'El Login es un Campo Obligatorio'
	                },
	                stringLength :{
	        	        message:' solo letras',
	        	        min : 1,
	        	        max : 30
	               },
	               regexp: {
	                    regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
	                    message: 'Formato Incorrecto'
	               }
	             }
	        },

	        password: {
	    		selector : '#id_registra_password',
	            validators: {
	            	notEmpty: {
	                    message: 'Ingrese ContraseÒa'
	                },
	                stringLength :{
	        	        message:'de 1 Digitos a 30',
	        	        min : 1,
	        	        max : 30
	               },
	              
	             }
	        },
	       
	        especialidad: {
	    		selector : '#id_act_especialidad',
	            validators: {
	            	notEmpty: {
	                    message: 'Seleccionar el Campo Especialidad obligatorio'
	                }
	            }
	        }
	    
	    }
	 
	});
</script>

</body>
</html>




