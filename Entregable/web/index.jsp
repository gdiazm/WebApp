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
                <a href="/Entregable/index.jsp">  <img src="images/img1.jpg">  </a> 
            </div>  
           
           <div class="barraUsuario">
            
                <c:if test="${not empty sessionScope.user}">
                    <span style="float:left; margin-left: 200px;">Bienvenido, ${sessionScope.user.nombre}</span>
                    <span style="float:right; margin-right:150px;"><a href="/Entregable/CerrarSesion?url=index.jsp">Cerrar Sesion</a></span>
                </c:if>
           
            
                <c:if test="${empty sessionScope.user}">
                    <form name="formularioUsuario" action="/Entregable/Autenticacion?url=index.jsp" method="POST" >
                        <span style="padding-right:150px"> Introduce  tus  datos  para  iniciar  sesión</span>
                        Usuario  <input type="text" name="usuario" size="20" value="Nombre de usuario" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                        Contraseña  <input type="password" name="contrasena" size="20" value="" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                        <input type="submit" value="Iniciar sesión" name="registrar" class="botonRegistrar" >
                    </form>
                </c:if>
           
            </div>
     
            <div class="contenedorWeb">
                    
                    <div class="contenedor">
                        
                           <div class="fondoTitulo">

                             <div class="titulo">
                                <b>¡Organiza ya tu viaje!</b>
                             </div>

                             <div class="barraBusqueda">
                                <form name="formularioBuscar" action="/Entregable/lugares/listar" method="POST" onsubmit="javascript:return validar();">
                                    <input type="text" name="busqueda" size="40" value="Introducir destino, p.e. Madrid" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                                    <input type="submit" value="Buscar" class="botonBuscar" ><span id="error" style="color:currentColor; "></span>
                                </form>
                             </div>


                         </div>
                         <hr style="border:1px solid lavender; width: 95%; margin-bottom:30px;">
                         <div class="central">
                            
                            <div class="texto">
                                
                                <span style="color:green; margin:0px 10px 10px 300px; font-size:30px;">Mejor Valorados</span>
                                <div class="listaMejores">
                                   
                                    <span style="font-size:30px;">Restaurantes</span>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.mejoresLugares}">
                                            <c:if test="${l.tipo=='R'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" >${l.nombre}</a><span style="margin-left:10px;margin-right:10px;font-size:20px;">Nota</span>:<span style="color:green; font-size:30px;margin-left:10px;">${l.valoracion}</span></li> 
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                  
                                   
                                    <span style="font-size:30px;">Ocio nocturno</span>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.mejoresLugares}">
                                           <c:if test="${l.tipo=='O'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" >${l.nombre}</a><span style="margin-left:10px;margin-right:10px;font-size:20px;">Nota</span>:<span style="color:green; font-size:30px;margin-left:10px;">${l.valoracion}</span></li> 
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                   
                                    <span style="font-size:30px;">Alojamiento</span>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.mejoresLugares}">
                                            <c:if test="${l.tipo=='A'}">
                                               <li><a href="/Entregable/mostrar/${l.id}" >${l.nombre}</a><span style="margin-left:10px;margin-right:10px;font-size:20px;">Nota</span>:<span style="color:green; font-size:30px;margin-left:10px;">${l.valoracion}</span></li> 
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    
                                 
                                    <span style="font-size:30px;">Museos y sitios turísticos</span>
                                    <ul>
                                        <c:forEach var="l" items="${sessionScope.mejoresLugares}">
                                            <c:if test="${l.tipo=='M'}">
                                                <li><a href="/Entregable/mostrar/${l.id}" >${l.nombre}</a><span style="margin-left:10px;margin-right:10px;font-size:20px;">Nota</span>:<span style="color:green; font-size:30px;margin-left:10px;">${l.valoracion}</span></li> 
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    
                                </div>
                                
                            </div>
                            
                            <div class="banner">
                               <a href="http://www.easyjet.com"> <img src="images/img3.jpg"></a>    
                            </div>
                             
                        </div>
                        
                  </div>
            </div>	
 
 </body>

</html>
