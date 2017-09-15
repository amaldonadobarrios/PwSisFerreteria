<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-header">
    <h1>
        COMPRAS
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            Registro de Compra
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="container">
<div class="col-sm-12">
    <div class="col-sm-6">
        <fieldset>
            <legend>PROVEEDOR</legend>   
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Proveedor</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Proveedor" class="col-xs-10 col-sm-9"  disabled/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> DNI o RUC</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="DNI o RUC" class="col-xs-10 col-sm-9" disabled />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Domicilio</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Domicilio" class="col-xs-10 col-sm-9" disabled/>
                </div>
            </div>
            <div  class="col-sm-12" align="center"> <input type="button"  class="buttons bigger-130 colorpicker-with-alpha"value="Seleccionar Proveedor"></div>
        </fieldset>
    </div>
    <div class="col-sm-6">             
        <fieldset>
            <legend>Documento</legend>   
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Documento</label>
                <div class="col-sm-9">
                    <select class="chosen-select form-control col-xs-10 col-sm-8" id="form-field-1" name="unidad"   data-placeholder="Documento">
                        <option value="">Seleccione</option>
                        <option value="1">Boleta de Venta</option>
                        <option value="2">Factura</option>
                        <option value="3">Gu�a de venta</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> N�mero</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="N�mero" class="col-xs-10 col-sm-9" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Fecha</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Fecha" class="col-xs-10 col-sm-9" disabled/>
                </div>
            </div>
        </fieldset>
    </div>
</div>    

    <div class="col-sm-12">
      <fieldset>
            <legend>Producto</legend>   
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Producto</label>
                <div class="col-sm-9">
                    <select class="chosen-select form-control col-xs-10 col-sm-8" id="form-field-1" name="unidad"   data-placeholder="Producto">
                        <option value="">Seleccione</option>
                         <option value="1">Producto 1</option>
                        <option value="2">Producto 2</option>
                        <option value="3">Producto 3</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Unidad</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Unidad" class="col-xs-10 col-sm-9" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Cantidad</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Cantidad" class="col-xs-10 col-sm-9"/>
                </div>
            </div>
            <div  class="col-sm-12" align="center"> <input type="button"  class="buttons bigger-130 colorpicker-with-alpha"value="A�adir Producto"></div>
        </fieldset>   
    </div>
     <div class="col-sm-12">
      <fieldset>
            <legend>Productos Agregados</legend>   
            <div class="row">
    <div class="col-xs-12">
              <div class="clearfix">
            <div class="pull-right tableTools-container"></div>
        </div>
        <div class="table-header">
            Resultado para "Productos Registrados"
        </div>

        <!-- div.table-responsive -->
        <!-- div.dataTables_borderWrap -->
        <div>
            <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        
                        <th>C�digo</th>
                        <th>Cantidad</th>
                        <th>Detalle de Producto</th>
                        <th>Precio Unitario</th>
                        <th>Sub total</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>

                <tbody>
                        <tr>
                            <td class="center">  1</td>
                            <td> 20 </td>
                            <td> fragua </td>
                            <td> 50 </td>
                            <td> 100 </td>
                            <td> 
                                <button>Eliminar</button>
                            </td>

                        </tr>
                   
                </tbody>
            </table>
        </div>
    </div>
</div>
        </fieldset>   
    </div>  
        <div class="col-sm-12" align="right">
           <div class="form-group col-md-offset-6">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> SUB TOTAL</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Nombre de Curso" class="col-xs-10 col-sm-4" />
                </div>
            </div> 
            <div class="form-group col-md-offset-6">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> IGV</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Nombre de Curso" class="col-xs-10 col-sm-4" />
                </div>
            </div>
           <div class="form-group col-md-offset-6">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">TOTAL</label>
                <div class="col-sm-9">
                    <input type="text" id="form-field-1" name="nombre" placeholder="Nombre de Curso" class="col-xs-10 col-sm-4" />
                </div>
            </div> 
        </div>
   
    </div></div>

<!-- PAGE CONTENT BEGINS -->









<div class="clearfix form-actions">
    <div class="col-md-12" align="center">
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



