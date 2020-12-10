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

<div class="container" style="margin-top: 4%">
 <h1>HISTORIAL DEL CITAS</h1>
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
												
												<th>Id CIta</th>
												<th>Fecha</th>
												<th>Hora Inicio</th>
												<th>Hora Fin</th>
												<th>Estado</th>
												<th>Paciente</th>
												<th>Actualiza</th>
												
											</tr>
										</thead>
										<tbody>
												<!-- ES IMPORTANTE MAPEAR IGUAL EL X.ATRIBUTO CON LA CLASE--> 
												<c:forEach items="${sessionScope.Citas}" var="x">
													<tr>
														<td>${x.idCita}</td>
														<td>${x.fechaCita}</td>
														<td>${x.horaInicio}</td>
														<td>${x.horaFin}</td>
														<td>${x.estado}</td>
														<td>${x.paciente.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idCita}','${x.fechaCita}','${x.horaInicio}','${x.horaFin}','${x.estado}','${x.medico.idMedico}','${x.paciente.idPaciente}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
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
  
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Cita</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="ActualizaCita" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de la Cita</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idCita" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                             
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Hora inicio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_horainicio" name="horaInicio" type="text"/>
		                                        </div>
		                                    </div>
		                                    
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Hora fin</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_horafin" name="horaFin" type="text"/>
		                                        </div>
		                                    </div>
		                                    
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">fecha</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fecha" name="fechaCita" type="date"/>
		                                        </div>
		                                    </div>
		                                 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_estado" name="estado" type="text"/>
		                                        </div>
		                                    </div>
		                                    
		                                        <div class="form-group">
		                                     
		                                        <div class="col-lg-5">
													<input type="hidden" class="form-control" id="id_paciente" name="paciente.idPaciente" type="text"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                      
		                                        <div class="col-lg-5">
													<input type="hidden" class="form-control" id="id_medico" name="medico.idMedico" type="text"/>
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



function editar(id,fecha,horainicio,horafin,estado,idmedico,idpaciente){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_horainicio]').val(horainicio);
	$('input[id=id_horafin]').val(horafin);
	$('input[id=id_fecha]').val(fecha);
	$('input[id=id_estado]').val(estado);
	$('input[id=id_medico]').val(idmedico);
	$('input[id=id_paciente]').val(idpaciente);
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




