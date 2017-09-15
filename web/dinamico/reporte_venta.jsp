<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-header">
    <h1>
        REPORTES
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            Reporte de Ventas
        </small>
    </h1>
</div><!-- /.page-header -->
<div class="row">
    <div class="container">

        <fieldset>
            <legend> Consultar Ventas por invervalo de fechas</legend>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Fecha de Inicio </label>
                <div class="col-sm-9">
                    <div class="input-group col-sm-3">
                        <input class="form-control date-picker" id="id-date-picker-1" name="fechaini" type="text" data-date-format="dd-mm-yyyy"/>
                        <span class="input-group-addon">
                            <i class="fa fa-calendar bigger-110"></i>
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Fecha de Fin </label>
                <div class="col-sm-9">
                    <div class="input-group col-sm-3">
                        <input class="form-control date-picker" id="id-date-picker-1" name="fechafin" type="text" data-date-format="dd-mm-yyyy"/>
                        <span class="input-group-addon">
                            <i class="fa fa-calendar bigger-110"></i>
                        </span>
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-12" >
                <input type="button" class="btn-info btn" value="Consultar">
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
                        Resultado para "Ventas Registradas"
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
            <div class="container"> 
                <div class="col-sm-12">
                    <div class="row">
			<div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
            

                        <div class="row">
                           


                            <div class="vspace-12-sm"></div>

                            <div class="col-sm-5">
                                <div class="widget-box">
                                    <div class="widget-header widget-header-flat widget-header-small">
                                        <h5 class="widget-title">
                                            <i class="ace-icon fa fa-signal"></i>
                                            Traffic Sources
                                        </h5>

                                        <div class="widget-toolbar no-border">
                                            <div class="inline dropdown-hover">
                                                <button class="btn btn-minier btn-primary">
                                                    This Week
                                                    <i class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
                                                </button>

                                                <ul class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
                                                    <li class="active">
                                                        <a href="#" class="blue">
                                                            <i class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>
                                                            This Week
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="#">
                                                            <i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
                                                            Last Week
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="#">
                                                            <i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
                                                            This Month
                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a href="#">
                                                            <i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
                                                            Last Month
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div id="piechart-placeholder"></div>

                                            <div class="hr hr8 hr-double"></div>

                                            <div class="clearfix">
                                                <div class="grid3">
                                                    <span class="grey">
                                                        <i class="ace-icon fa fa-facebook-square fa-2x blue"></i>
                                                        &nbsp; likes
                                                    </span>
                                                    <h4 class="bigger pull-right">1,255</h4>
                                                </div>

                                                <div class="grid3">
                                                    <span class="grey">
                                                        <i class="ace-icon fa fa-twitter-square fa-2x purple"></i>
                                                        &nbsp; tweets
                                                    </span>
                                                    <h4 class="bigger pull-right">941</h4>
                                                </div>

                                                <div class="grid3">
                                                    <span class="grey">
                                                        <i class="ace-icon fa fa-pinterest-square fa-2x red"></i>
                                                        &nbsp; pins
                                                    </span>
                                                    <h4 class="bigger pull-right">1,050</h4>
                                                </div>
                                            </div>
                                        </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                                </div><!-- /.widget-box -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                     

                        <div class="row">
                            

                            <div class="col-sm-7">
                                <div class="widget-box transparent">
                                    <div class="widget-header widget-header-flat">
                                        <h4 class="widget-title lighter">
                                            <i class="ace-icon fa fa-signal"></i>
                                            Sale Stats
                                        </h4>

                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main padding-4">
                                            <div id="sales-charts"></div>
                                        </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                                </div><!-- /.widget-box -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->

                        <div class="hr hr32 hr-dotted"></div>

                        <div class="row">
                            <div class="col-sm-6">
                                
                            </div><!-- /.col -->

                            
                        </div><!-- /.row -->

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->						
                    
                    
                    
                    
                    
                    
                    
                    
                </div><!-- /.col -->
            </div>
        </fieldset>
    </div> 


<!-- inline scripts related to this page -->

