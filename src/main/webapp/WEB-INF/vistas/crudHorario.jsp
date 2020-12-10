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
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>
       
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
 <h1>Crud de Horario</h1>
 
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudHorario">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudHorario" class="simple_form" id="defaultForm2"  method="post">
					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" id="validateBtnw1" style="width: 150px">FILTRA</button>
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
						<div class="col-md-12" >
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
									
												<th>Dia</th>
												<th>Hora Inicio</th>
												<th>Hora Fin</th>
												<th>Fecha</th>
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
										<tbody>
												    
												<c:forEach items="${sessionScope.horarios}" var="x">
													<tr>
													
														<td>${x.dia}</td>
														<td>${x.horaInicio}</td>
														<td>${x.horaFin}</td>
														<td>${x.fechaHorario}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idHorario}','${x.dia}','${x.horaInicio}','${x.horaFin}','${x.medico.idMedico}','${x.fechaHorario}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idHorario}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Horario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraHorario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Horario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hInicio">Fecha</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fecha" value="-" name="fechaHorario"   type="date" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Dia</label>
		                                          <div class="col-lg-5">
													<select id="id_dia" name="dia" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>
							                            	<option value="lunes">lunes</option>
							                            	<option value="martes">martes</option>
							                            	<option value="miercoles">miercoles</option>
							                            	<option value="jueves">jueves</option>
							                            	<option value="viernes">viernes</option>
							                            	<option value="sabado">sabado</option>
							                          
							                            	
							                               
							                         </select>
		                                        </div>
		                                       
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hInicio">Hora Inicio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_hInicio" value="00:00" name="horaInicio"   type="time" />
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hFin">Hora Fin</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_hFin" value="00:00" name="horaFin" type="time"  />
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary" >REGISTRA</button>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Horario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="actualizaHorario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Horario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idHorario" type="text" />
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Dia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dia" name="dia" placeholder="Ingrese el dia" type="text"/>
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hInicio">Hora Inicio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_hInicio" name="horaInicio"  type="time"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hFin">Hora Fin</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_hFin" name="horaFin"  type="time" />
		                                        </div>
		                                    </div>
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hFin">Medico</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="idMedico" name="medico.idMedico"  readonly="readonly" type="text" />
		                                        </div>
		                                    </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_hFin">Fecha</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fecha_horario" name="fechaHorario"  type="date" />
		                                        </div>
		                                    </div>
		                                  
		                                      
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary" id="idBtnActualiza">ACTUALIZA</button>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Horario</h4>
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
$('#idBtnElimina').click(function() {
	$('#idFormElimina').submit();
});

function eliminar(id){	
	$('#idModalElimina').modal("show");
	$('input[id=id_elimina]').val(id);
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,dia,horainicio,horafin,idmedico,fecha){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_dia]').val(dia);
	$('input[id=id_act_hInicio]').val(horainicio);
	$('input[id=id_act_hFin]').val(horafin);
	$('input[id=idMedico]').val(idmedico);
	$('input[id=id_fecha_horario]').val(fecha);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>


</body>
</html> 