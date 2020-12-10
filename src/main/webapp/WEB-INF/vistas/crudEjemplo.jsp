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
 <h1>Crud de Autor</h1>
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
												<th>Apellido Paterno</th>
												<th>Apellido Materno</th>
												<th>Pais</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.autores}" var="x">
													<tr>
														<td>${x.idAutor}</td>
														<td>${x.nombres}</td>
														<td>${x.apaterno}</td>
														<td>${x.amaterno}</td>
														<td>${x.pais.nombre}</td>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Autor</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudAutor" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Autor</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombres">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese nombres Completos"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_paterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_ape_paterno" name="apaterno" placeholder="Ingrese el apellido paterno" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_ape_materno" name="amaterno" placeholder="Ingrese el apellido materno" type="text"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_pais" name="pais.idPais" class='form-control'>
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
													<input class="form-control" type="text" id="id_nombres" name="nombres" placeholder="Ingrese nombres Completos"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_maxima">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_ape_paterno" name="apaterno" placeholder="Ingrese el apellido paterno" type="text"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ape_materno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_ape_materno" name="amaterno" placeholder="Ingrese el apellido materno" type="text"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pais</label>
		                                        <div class="col-lg-5">
													<select id="id_act_pais" name="pais.idPais" class='form-control'>
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
    		selector : '#id_nombres',
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
                     regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                     message: 'Debe contener solo letras'
                }
            }
        },
        apaterno: {
    		selector : '#id_ape_paterno',
            validators: {
                notEmpty: {
                    message: 'El  apellido paterno es un campo obligatorio'
                },
                stringLength :{
        	        message:'El  apellido paterno es de 2 a 30 caracteres',
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
        amaterno: {
    		selector : '#id_ape_materno',
            validators: {
            	notEmpty: {
                    message: 'El apellido materno es un campo obligatorio'
                },
                stringLength :{
        	        message:'El  apellido materno es de 2 a 30 caracteres',
        	        min : 2,
        	        max : 30
               },
               regexp: {
                    regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                    message: 'Debe contener solo letras'
               }
             }
        },
       
        pais: {
    		selector : '#id_reg_pais',
            validators: {
            	notEmpty: {
                    message: 'Seleccionar el Campo Pais obligatorio'
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
    		selector : '#id_nombres',
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
                     regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                     message: 'Debe contener solo letras'
                }
            }
        },
        apaterno: {
    		selector : '#id_ape_paterno',
            validators: {
                notEmpty: {
                    message: 'El  apellido paterno es un campo obligatorio'
                },
                stringLength :{
        	        message:'El  apellido paterno es de 2 a 30 caracteres',
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
        amaterno: {
    		selector : '#id_ape_materno',
            validators: {
            	notEmpty: {
                    message: 'El apellido materno es un campo obligatorio'
                },
                stringLength :{
        	        message:'El  apellido materno es de 2 a 30 caracteres',
        	        min : 2,
        	        max : 30
               },
               regexp: {
                    regexp: /^[ÒA-Za-z _]*[ÒA-Za-z][ÒA-Za-z _]*$/,
                    message: 'Debe contener solo letras'
               }
             }
        },
       
        pais: {
    		selector : '#id_act_pais',
            validators: {
            	notEmpty: {
                    message: 'Seleccionar el Campo Pais obligatorio'
                }
            }
        }
    	
    }  
 
});
</script>

</body>
</html>




