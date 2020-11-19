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
			  <form id="idFormElimina" action="eliminaCrudAutor">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudAutor" class="simple_form" id="defaultForm2"  method="post">

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
												   
												<c:forEach items="${sessionScope.autores}" var="x">
													<tr>
														<td>${x.idMedico}</td>
														<td>${x.nombre}</td>
														<td>${x.apellido}</td>
														<td>${x.dni}</td>
														<td>${x.direccion}</td>
														<td>${x.nroCelular}</td>
														<td>${x.login}</td>
														<td>${x.password}</td>
														<td>${x.Especialidad.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idAutor}','${x.nombres}','${x.apaterno}','${x.amaterno}','${x.pais.idPais}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idAutor}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
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
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudAutor" class="form-horizontal"     method="post">
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
													<input class="form-control" type="text" id="id_registra_nombres" name="RNombres" placeholder="Ingrese nombres Completos"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_paterno">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_apellido" name="RApellido" placeholder="Ingrese los apellidos" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_dni" name="RDni" placeholder="Ingrese DNI" type="text"/>
		                                        </div>
		                                    </div> 
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_direccion" name="RDireccion" placeholder="Ingrese Su Direccion" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">NroCelular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_celular" name="RCelular" placeholder="Ingrese Numero de celular" type="text"/>
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_login" name="Rlogin" placeholder="Ingrese el login" type="text"/>
		                                        </div>
		                                    </div> 
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_registra_password" name="RPassword" placeholder="Ingrese el Password" type="text"/>
		                                        </div>
		                                    </div>       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_registra_esspecialidad">Especialidad</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>
							                            	<option value=" ">Direccion Medica</option>
							                            	<option value=" ">Medicina General</option>
							                            	<option value=" ">Cardiologia</option>    
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Autor</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudAutor" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Autor</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idAutor" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                             
		                                 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_mujeres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" type="text" id="id_actualiza_nombres" name="nombres" placeholder="Ingrese nombres Completos"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_maxima">Apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_apellido" name="Apellidos" placeholder="Ingrese sus apellidos " type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_actualiza_dni" name="DNI" placeholder="Ingrese el numero de DNI" type="text"/>
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
													<input class="form-control" id="id_actualiza_password" name="Password" placeholder="Ingrese su contrasenia" type="text"/>
		                                        </div>
		                                    </div>    
		                                       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Especialidad</label>
		                                        <div class="col-lg-5">
													<select id="id_act_pais" name="pais.idPais" class='form-control'>
							                            	<option value=" ">[Seleccione]</option> 							                            	
							                            	<option value=" ">Direccion Medica</option>
							                            	<option value=" ">Medicina General</option>
							                            	<option value=" ">Cardiologia</option>      
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Autor</h4>
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

function editar(id,nombres,aPaterno,aMaterno,idPais){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_nombres]').val(nombres);
	$('input[id=id_ape_paterno]').val(aPaterno);
	$('input[id=id_ape_materno]').val(aMaterno);
	$('select[id=id_act_pais]').val(idPais);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
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
    	nombres: {
    		selector : '#id_registra_nombres',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 50 caracteres',
                	min : 5,
                	max : 50
                }
                ,
                regexp: {
                     regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
                     message: 'Debe contener solo letras'
                }
            }
        },
        RApellido: {
    		selector : '#id_registra_apellido',
            validators: {
                notEmpty: {
                    message: 'Los Apellidos son un campo obligatorio'
                },
                stringLength :{
        	        message:'Los apellidos son de 2 a 40 caracteres',
        	        min : 2,
        	        max : 40
                }
                ,
                regexp: {
                     regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
                     message: 'Debe contener solo letras'
                }
        
            }
        },
        RDni: {
    		selector : '#id_registra_dni',
            validators: {
            	notEmpty: {
                    message: 'El aDNI es un campo obligatorio'
                },
                stringLength :{
        	        message:'Son 8 Digitos',
        	        min : 8,
        	        max : 8
               },
               
             }
        },

        RDireccion: {
    		selector : '#id_registra_direccion',
            validators: {
            	notEmpty: {
                    message: 'El aDNI es un campo obligatorio'
                },
                stringLength :{
        	        message:'de 10 a 30 digitos',
        	        min : 10,
        	        max : 30
               },
               regexp: {
                    regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
                    message: 'Direccion Formato Incorrecto'
               }
             }
        },

        RCelular: {
    		selector : '#id_registra_celular',
            validators: {
            	notEmpty: {
                    message: 'El Numero de Celular es Campo Obligatorio'
                },
                stringLength :{
        	        message:'Son 9 Digitos',
        	        min : 9,
        	        max : 9
               },
              
             }
        },
        
        RLogin: {
    		selector : '#id_registra_login',
            validators: {
            	notEmpty: {
                    message: 'El Login es un Campo Obligatorio'
                },
                stringLength :{
        	        message:' solo letras',
        	        min : 10,
        	        max : 30
               },
               regexp: {
                    regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
                    message: 'Formato Incorrecto'
               }
             }
        },

        RPassword: {
    		selector : '#id_registra_password',
            validators: {
            	notEmpty: {
                    message: 'Ingrese Contrasenia'
                },
                stringLength :{
        	        message:'de 10 Digitos a 30',
        	        min : 10,
        	        max : 30
               },
              
             }
        },
       
        REspecialidad: {
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
	    	nombres: {
	    		selector : '#id_registra_nombres',
	            validators: {
	                notEmpty: {
	                    message: 'El nombre es un campo obligatorio'
	                },
	                stringLength :{
	                	message:'El nombre es de 5 a 50 caracteres',
	                	min : 5,
	                	max : 50
	                }
	                ,
	                regexp: {
	                     regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
	                     message: 'Debe contener solo letras'
	                }
	            }
	        },
	        RApellido: {
	    		selector : '#id_registra_apellido',
	            validators: {
	                notEmpty: {
	                    message: 'Los Apellidos son un campo obligatorio'
	                },
	                stringLength :{
	        	        message:'Los apellidos son de 2 a 40 caracteres',
	        	        min : 2,
	        	        max : 40
	                }
	                ,
	                regexp: {
	                     regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
	                     message: 'Debe contener solo letras'
	                }
	        
	            }
	        },
	        RDni: {
	    		selector : '#id_registra_dni',
	            validators: {
	            	notEmpty: {
	                    message: 'El aDNI es un campo obligatorio'
	                },
	                stringLength :{
	        	        message:'Son 8 Digitos',
	        	        min : 8,
	        	        max : 8
	               },
	               
	             }
	        },

	        RDireccion: {
	    		selector : '#id_registra_direccion',
	            validators: {
	            	notEmpty: {
	                    message: 'El aDNI es un campo obligatorio'
	                },
	                stringLength :{
	        	        message:'de 10 a 30 digitos',
	        	        min : 10,
	        	        max : 30
	               },
	               regexp: {
	                    regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
	                    message: 'Direccion Formato Incorrecto'
	               }
	             }
	        },

	        RCelular: {
	    		selector : '#id_registra_celular',
	            validators: {
	            	notEmpty: {
	                    message: 'El Numero de Celular es Campo Obligatorio'
	                },
	                stringLength :{
	        	        message:'Son 9 Digitos',
	        	        min : 9,
	        	        max : 9
	               },
	              
	             }
	        },
	        
	        RLogin: {
	    		selector : '#id_registra_login',
	            validators: {
	            	notEmpty: {
	                    message: 'El Login es un Campo Obligatorio'
	                },
	                stringLength :{
	        	        message:' solo letras',
	        	        min : 10,
	        	        max : 30
	               },
	               regexp: {
	                    regexp: /^[�A-Za-z _]*[�A-Za-z][�A-Za-z _]*$/,
	                    message: 'Formato Incorrecto'
	               }
	             }
	        },

	        RPassword: {
	    		selector : '#id_registra_password',
	            validators: {
	            	notEmpty: {
	                    message: 'Ingrese Contrasenia'
	                },
	                stringLength :{
	        	        message:'de 10 Digitos a 30',
	        	        min : 10,
	        	        max : 30
	               },
	              
	             }
	        },
	       
	        REspecialidad: {
	    		selector : '#id_reg_especialidad',
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




