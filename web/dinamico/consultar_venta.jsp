<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-header">
    <h1>
        VENTAS
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            Consultar una  Venta
        </small>
    </h1>
</div><!-- /.page-header -->
<div class="row">
    <div class="container">

        <fieldset>
            <legend> Buscar Venta</legend>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Fecha de Venta </label>
                <div class="col-sm-9">
                    <div class="input-group col-sm-3">
                        <input class="form-control date-picker" id="fechaventa" name="fechaventa" type="text" data-date-format="dd-mm-yyyy"/>
                        <span class="input-group-addon">
                            <i class="fa fa-calendar bigger-110"></i>
                        </span>
                    </div>
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
                        Resultado para "Ventas Registradas"
                    </div>

                    <!-- div.table-responsive -->
                    <!-- div.dataTables_borderWrap -->
                    <div>
                        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="center">N°
                                    </th>
                                    <th>Comprobante</th>
                                    <th>Fecha</th>
                                    <th>Neto</th>
                                    <th>IGV</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="venta" items="${listaVenta}" varStatus="loop">
                                    <tr>
                                        <td class="center">  ${loop.count} </td>
                                        <td> ${venta.numero_comprobante} </td>
                                        <td> ${venta.fecha_reg} </td>
                                        <td> ${venta.neto} </td>
                                        <td> ${venta.igv} </td>
                                        <td> ${venta.total} </td>
                                        <td>
                                            <div class="hidden-sm hidden-xs action-buttons">
                                                <a class="blue" href="ServReporte?evento=venta&num=+${venta.numero_comprobante}" target="_blank">
                                                    <i class="ace-icon fa fa-search-plus bigger-130"></i>
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


