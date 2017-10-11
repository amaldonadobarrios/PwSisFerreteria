<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    fieldset { 
        display: block;
        margin-left: 2px;
        margin-right: 2px;
        padding-top: 0.35em;
        padding-bottom: 0.625em;
        padding-left: 0.75em;
        padding-right: 0.75em;
        border: 2px groove (internal value);
    }
</style>
<div class="page-header">
    <h1>
        REGLAS DE PRODUCCIÒN
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            Registro de Reglas de Producción
        </small>
    </h1>
</div><!-- /.page-header -->
<div class="row">
    <div class="col-xs-12">
        <div class="col-sm-12">
            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="widget-title">Producto a Fabricar</h4>
                </div>

                <div class="widget-body">
                    <div class="widget-main no-padding">
                        <form>
                            <!-- <legend>Form</legend> -->
                            <fieldset>
                                <form action="Usuario" method="POST" class="form-horizontal" role="form">
                                    <input name="action" type="hidden" value="registrarUsuario">
                                    <div class="col-xs-6 col-sm-6" >
                                      <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Unidad de Medida </label>
                                        <div class="col-sm-9 ">
                                            <input type="text" id="form-field-1" name="unidad" placeholder="Unidad de Medida" class="col-xs-10 col-sm-5" disabled  />
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Unidad de Medida </label>
                                        <div class="col-sm-9 ">
                                            <input type="text" id="form-field-1" name="unidad" placeholder="Unidad de Medida" class="col-xs-10 col-sm-5" disabled  />
                                        </div>
                                    </div>
                                        
                                        
                                        
                                    </div>
                                    <div class="col-xs-6 col-sm-6" >
                                      <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Unidad de Medida </label>
                                        <div class="col-sm-9 ">
                                            <input type="text" id="form-field-1" name="unidad" placeholder="Unidad de Medida" class="col-xs-10 col-sm-5" disabled  />
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Unidad de Medida </label>
                                        <div class="col-sm-9 ">
                                            <input type="text" id="form-field-1" name="unidad" placeholder="Unidad de Medida" class="col-xs-10 col-sm-5" disabled  />
                                        </div>
                                    </div>
                                        
                                     <input class="btn btn-default" type="button" onclick="$('#MD_BuscarProducto').modal('show');" value="Seleccionar Producto"></input>   
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label class="col-sm-3 control-label no-padding-right"> Nombre del Producto </label>
                                        <div class="col-sm-9" >
                                            <input type="text" id="form-field-1" name="marca" placeholder="Nombre del Producto" class="col-xs-10 col-sm-5" disabled/>
                                            <span class="input-group-btn">
                                                
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Unidad de Medida </label>
                                        <div class="col-sm-9 ">
                                            <input type="text" id="form-field-1" name="unidad" placeholder="Unidad de Medida" class="col-xs-10 col-sm-5" disabled  />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"> Cantidad en una Vuelta </label>
                                        <div class="col-sm-9 ">
                                            <input type="text" id="form-field-1" name="unidad" placeholder="Cantidad en una Vuelta" class="col-xs-10 col-sm-5" disabled/>
                                        </div>
                                    </div>
                            </fieldset>


                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- PAGE CONTENT BEGINS -->

        <div class="col-sm-6">
            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="widget-title">Seleccionar Insumos</h4>
                </div>

                <div class="widget-body">
                    <div class="widget-main no-padding">
                        <form>
                            <!-- <legend>Form</legend> -->
                            <fieldset>
                                <div class="form-group">
                                    <label for="form-field-select-3" class="col-sm-3 control-label no-padding-right">Seleccione Insumo</label>
                                    <div class="col-sm-9" >
                                        <select class="chosen-select form-control" id="form-field-select-3" data-placeholder="Choose a State...">
                                            <option value="">  </option>
                                            <option value="AL">Alabama</option>
                                            <option value="AK">Alaska</option>
                                            <option value="AZ">Arizona</option>
                                            <option value="AR">Arkansas</option>
                                            <option value="CA">California</option>
                                            <option value="CO">Colorado</option>
                                            <option value="CT">Connecticut</option>
                                            <option value="DE">Delaware</option>
                                            <option value="FL">Florida</option>
                                            <option value="GA">Georgia</option>
                                            <option value="HI">Hawaii</option>
                                            <option value="ID">Idaho</option>
                                            <option value="IL">Illinois</option>
                                            <option value="IN">Indiana</option>
                                            <option value="IA">Iowa</option>
                                            <option value="KS">Kansas</option>
                                            <option value="KY">Kentucky</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Unidad de Medida </label>
                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-1" name="unidad" placeholder="Unidad de medida" class="col-xs-10 col-sm-5" disabled  />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Cantidad</label>
                                    <div class="col-sm-9 ">
                                        <input type="number" id="form-field-1" min="0" value="0"  name="Cantidad" placeholder="Cantidad" class="col-xs-10 col-sm-5"  />
                                    </div>
                                </div>

                            </fieldset>

                            <div class="form-actions center">
                                <button type="button" class="btn btn-sm btn-success">
                                    Añadir
                                    <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="widget-title">Insumos Añadidos</h4>
                </div>

                <div class="widget-body">
                    <div class="widget-main no-padding">
                        <form>
                            <!-- <legend>Form</legend> -->
                            <fieldset>
                                <div class="table-responsive">
                                    <table id="simple-table" class="table  table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="center">Nº
                                                </th>
                                                <th>Nombre del Insumo</th>
                                                <th>Marca</th>
                                                <th>Presentación</th>
                                                <th>Unidad de medida</th>
                                                <th>Foto</th>
                                                <th>x</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td> XXX</td>
                                                <td> XXX</td>
                                                <td> XXX</td>
                                                <td> XXX</td>
                                                <td>XXXX</td>
                                                <td>XXXX</td>
                                                <td>SELECCIONAR</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </fieldset>


                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">



        </div>







        <div class="space-4"></div>

        <div class="clearfix form-actions col-md-12 " align="center" >
            <div class="col-md-offset-3 col-md-6" >
                <button class="btn btn-info" type="submit">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                    Registrar
                </button>

                &nbsp; &nbsp; &nbsp;
                <button class="btn" type="reset">
                    <i class="ace-icon fa fa-undo bigger-110"></i>
                    Limpiar
                </button>
            </div>
        </div>
        </form>
    </div>
</div>
<div class="hr hr-24"></div>

<div class="row">
    <div class="col-xs-12">
        <h3 class="header smaller lighter blue">Reglas de Productos fabricados</h3>

        <div class="clearfix">
            <div class="pull-right tableTools-container"></div>
        </div>
        <div class="table-header">
            Resultado de busqueda "Reglas de fabricaciòn"
        </div>

        <!-- div.table-responsive -->

        <!-- div.dataTables_borderWrap -->
        <div>
            <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="center">Nº
                        </th>
                        <th>Nombre del Insumo</th>
                        <th>Marca</th>
                        <th>Presentación</th>
                        <th>Unidad de medida</th>
                        <th>Foto</th>
                        <th>x</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td> XXX</td>
                        <td> XXX</td>
                        <td> XXX</td>
                        <td> XXX</td>
                        <td>XXXX</td>
                        <td>XXXX</td>
                        <td>SELECCIONAR</td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id="MD_BuscarProducto" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div  class="panel panel-success" id="panel-tipoMsj">
            <div class="panel-heading"><h3>BUSCAR PRODUCTO</h3></div>
            <div class="panel-body">
                <div class="row">
                    <div class="container">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nombre del Producto </label>
                            <div class="col-sm-9 col-md-6" >
                                <input type="text" id="form-field-1" name="marca" placeholder="Marca delProducto" class="col-xs-10 col-sm-5 form-control" />
                                <span class="input-group-btn">
                                    <input class="btn btn-default" type="button" onclick="$('#MD_BuscarProducto').modal('show');" value="Buscar"></input>
                                </span>
                            </div>
                        </div>   




                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header">
                            Resultado para "Insumos Registrados"
                        </div>

                        <!-- div.table-responsive -->

                        <!-- div.dataTables_borderWrap -->
                        <div>
                            <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="center">Nº
                                        </th>
                                        <th>Nombre del Insumo</th>
                                        <th>Marca</th>
                                        <th>Presentación</th>
                                        <th>Unidad de medida</th>
                                        <th>Foto</th>
                                        <th>x</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td> XXX</td>
                                        <td> XXX</td>
                                        <td> XXX</td>
                                        <td> XXX</td>
                                        <td>XXXX</td>
                                        <td>XXXX</td>
                                        <td>SELECCIONAR</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>    





            </div>
            <div class="modal-footer">
                <input type="button" id="btnUpload" class="btn btn-success"
                       value="REGISTRAR" >
                <!-- 								<input type="button" id="btnClear" class="btn btn-default" -->
                <!-- 									value="LIMPIAR" > -->
                <button type="button" id="btnclose" class="btn btn-warning"
                        data-dismiss="modal">Cerrar</button>

            </div>
        </div>
    </div>

</div>  
