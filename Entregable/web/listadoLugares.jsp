<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Collection"%>
<%@page import="dominio.Lugar"%>
<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <script src="/Entregable/js/scripts.js" language="Javascript">
    </script>
    <link href="/Entregable/css/estilo.css" type="text/css" rel="stylesheet" />
</head>

 <body>
            <div class="cabecera">                  
                <a href="/Entregable/index.jsp"><img src="/Entregable/images/img1.jpg"></a>
            </div>  
     
            <div class="barraUsuario">
            
                <c:if test="${not empty sessionScope.user}">
                    <span style="float:left; margin-left: 200px;">Bienvenido, ${sessionScope.user.nombre}</span>
                    <span style="float:right; margin-right:150px;"><a href="/Entregable/CerrarSesion?url=listadoLugares.jsp">Cerrar Sesion</a></span>
                </c:if>
           
            
                <c:if test="${empty sessionScope.user}">
                    <form name="formularioUsuario" action="/Entregable/Autenticacion?url=listadoLugares.jsp" method="POST" >
                        <span style="padding-right:150px"> Introduce  tus  datos  para  iniciar  sesión</span>
                        Usuario  <input type="text" name="usuario" size="20" value="Nombre de usuario" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                        Contraseña  <input type="password" name="contrasena" size="20" value="" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                        <input type="submit" value="Iniciar sesión" name="registrar" class="botonRegistrar" >
                    </form>
                </c:if>
           
            </div>
     
            <c:if test="${not empty sessionScope.listaLugares}">
            <div class="contenedorWeb" style="background-image: url(/Entregable/images/${sessionScope.ciudad}.jpg)">
                    
                <div class="contenedorLugares" >
               
                            <div class="tituloCiudad">
                               <b>${sessionScope.ciudad}</b>
                            </div>

                            <div class="contenedorLista">
                                
                                
                                <div class="lista">
                                   
                                  <div class="contenidoLista">
                                    <h1>Restaurantes</h1>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.listaLugares}">
                                            <c:if test="${l.tipo=='R'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" style="color:#1EB50D">${l.nombre}</a><a href="javascript:peticionAJAX('/Entregable/agregar/${l.id}', 'itinerario');"><img src="/Entregable/images/mas.jpg" title="Añadir al itinerario" width="15px" height="15px"/></a></li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    
                                  
                                    <h1>Ocio nocturno</h1>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.listaLugares}">
                                           <c:if test="${l.tipo=='O'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" style="color:#1EB50D">${l.nombre}</a><a href="javascript:peticionAJAX('/Entregable/agregar/${l.id}', 'itinerario');"><img src="/Entregable/images/mas.jpg" title="Añadir al itinerario" width="15px" height="15px"/></a></li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    
                                  
                                      
                                    <h1>Alojamiento</h1>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.listaLugares}">
                                            <c:if test="${l.tipo=='A'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" style="color:#1EB50D">${l.nombre}</a><a href="javascript:peticionAJAX('/Entregable/agregar/${l.id}', 'itinerario');"><img src="/Entregable/images/mas.jpg" title="Añadir al itinerario" width="15px" height="15px"/></a></li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    
                                
                                    <h1>Museos y sitios turísticos</h1>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.listaLugares}">
                                            <c:if test="${l.tipo=='M'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" style="color:#1EB50D">${l.nombre}</a><a href="javascript:peticionAJAX('/Entregable/agregar/${l.id}', 'itinerario');"><img src="/Entregable/images/mas.jpg" title="Añadir al itinerario" width="15px" height="15px"/></a></li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    
                                 
                                
                                </div>
                                </div>
                                <div class="itinerarioFondo" id="itinerario">
                                    <%@include file="itinerario.jsp" %>
                                </div>
                            
                            
                        </div>	
                     </div>
                </div>
                </c:if>
                <c:if test="${empty sessionScope.listaLugares}">
                    <div style="font-size:30px; color:#0C7AE8; margin:50px 0px 20px 380px;">No se ha encontrado el destino introducido</div>
                    <div class="nuevaBusqueda">
                        <form name="formularioOtraBusqueda" action="/Entregable/lugares/listar" method="POST" onsubmit="javascript:return validar();">
                            <b>Buscar otra ciudad: </b><input type="text" name="busqueda" size="40" value="Introducir destino, p.e. Madrid" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                            <input type="submit" value="Buscar" class="botonBuscar" ><span id="error" style="color:currentColor; "></span>
                       </form>
                </c:if>
 </body>

</html>
