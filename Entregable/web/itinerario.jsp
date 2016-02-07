<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Collection"%>
<%@page import="dominio.Lugar"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

                <div class="itinerarioContenido">
                    <div class="itinerarioTitulo"><b><u>ITINERARIO</b></u></div>
                        <a href="javascript:peticionAJAX('/Entregable/VaciarItinerario.do', 'itinerario');"><img src="/Entregable/images/vaciar.gif" title="Vaciar lista" width="25px" height="20px"/></a>

                    <ul>
                        <c:if test="${not empty sessionScope.itinerario}">
                            <c:forEach var="lugar" items="${sessionScope.itinerario}">
                                <li>${lugar.nombre}<a href="javascript:peticionAJAX('/Entregable/eliminar/${lugar.id}', 'itinerario');"><img src="/Entregable/images/eliminar.gif" title="Eliminar" width="15px" height="15px"/></a></li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty sessionScope.itinerario}">
                            Vacío
                        </c:if>
                    </ul>
                                                                     
               </div>