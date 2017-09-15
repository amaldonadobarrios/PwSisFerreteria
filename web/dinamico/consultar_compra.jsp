<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-header">
    <h1>
        VENTAS
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            Consultar una  Compra
        </small>
    </h1>
</div><!-- /.page-header -->
<div class="row">
    <div class="container">
        
            <fieldset>
                <legend> Buscar Compra</legend>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tipo de Documento</label>
                <div class="col-sm-9">
                    <select class="chosen-select form-control col-xs-10 col-sm-5 col-md-2" id="form-field-1" name="unidad" data-placeholder="Unidad de Medida">
                        <option value="">Seleccione</option>
                        <option value="1">Boleta de Venta</option>
                        <option value="2">Factura</option>
                        <option value="3">Guía de Remisión</option>
                    </select>
                </div>
          </div>    
           <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Número de Documento</label>
                <div class="col-sm-9">
                    <input type="number" id="form-field-1" name="nombre" placeholder="Número de Documento" class="col-xs-10 col-sm-5" />
                </div>
          </div> 
            <div class="form-group col-sm-12" >
                <input type="button" class="btn-info btn" value="Buscar">
            </div>
        </fieldset>
        <fieldset>
            <legend> Ventas </legend>
            <div class="row">
    <div class="col-xs-12">
        <div class="clearfix">
            <div class="pull-right tableTools-container"></div>
        </div>
        <div class="table-header">
            Resultado para "Compras Registradas"
        </div>

        <!-- div.table-responsive -->
        <!-- div.dataTables_borderWrap -->
        <div>
            <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="center">
                        </th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Fecha Inicio</th>
                        <th>Fecha Fin</th>
                        <th>Vacantes</th>
                        <th></th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="curso" items="${listCurso}" varStatus="loop">
                        <tr>
                            <td class="center">  ${loop.count} </td>
                            <td> ${curso.nombre} </td>
                            <td> ${curso.tipo} </td>
                            <td> ${curso.fechaini} </td>
                            <td> ${curso.fechafin} </td>
                            <td> 
                                <span class="label label-sm label-info">${curso.vacante}</span>
                            </td>
                            <td>
                                <div class="hidden-sm hidden-xs action-buttons">
                                    <a class="blue" href="Curso?action=verCurso">
                                        <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                    </a>

                                    <a class="green" href="Curso?action=formActualizarCurso&idcurso=${curso.idcurso}" >
                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                    </a>

                                    <a class="red" href="Curso?action=eliminarCurso&idcurso=${curso.idcurso}">
                                        <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
        </fieldset>
    </div> 
        

