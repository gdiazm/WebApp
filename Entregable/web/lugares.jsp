<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Collection"%>
<%@page import="dominio.Lugar"%>
<%@page import="dominio.Comentario"%>
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
                       <div class="imagen"><a href="/Entregable/index.jsp"><img src="/Entregable/images/img1.jpg"></a></div>
                       <div class="otrabusqueda">
                        <form name="formularioOtraBusqueda" action="/Entregable/lugares/listar" method="POST" onsubmit="javascript:return validar();">
                            <b>Buscar otra ciudad: </b><input type="text" name="busqueda" size="40" value="Introducir destino, p.e. Madrid" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                            <input type="submit" value="Buscar" class="botonBuscar" ><span id="error" style="color:currentColor; "></span><a href="/Entregable/Listar.do?busqueda=${sessionScope.ciudad}">Volver</a>
                       </form>
                       </div>
                       
                       
           </div>  
            
           <div class="barraUsuario">
            
            <c:if test="${not empty sessionScope.user}">
                <span style="float:left; margin-left: 200px; padding-top:5px;">Bienvenido, ${sessionScope.user.nombre}</span>
                <span style="float:right; margin-right:150px;"><a href="/Entregable/CerrarSesion?url=lugares.jsp">Cerrar Sesion</a></span>
            </c:if>
            
            <c:if test="${empty sessionScope.user}">
                <form name="formularioUsuario" action="/Entregable/Autenticacion?url=lugares.jsp" method="POST" >
                    <span style="padding-right:150px"> Introduce  tus  datos  para  iniciar  sesión</span>
                    Usuario  <input type="text" name="usuario" size="20" value="Nombre de usuario" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                    Contraseña  <input type="password" name="contrasena" size="20" value="" onclick="this.value=''; this.style.color='#000000'" style="color:grey">
                    <input type="submit" value="Iniciar sesión" name="registrar" class="botonRegistrar" >
                </form>
            </c:if>
            
            </div>
     
            <div class="contenedorWeb">
                <div class="contenedor">
                   <div class="tituloLugar">
                       ${sessionScope.lugar.nombre}, en ${sessionScope.lugar.ciudad}
                   </div>
                   <div class="contenido">
                       
                        <div class="imagenLugar">
                            <img src="${sessionScope.lugar.imagen}">
                        </div>
                       
                        <div class="contenedorComentario">
                            <span style="font-size:20px;color:#0C7AE8;">Dirección:  </span>${sessionScope.lugar.direccion}, <br/></br>
                            <span style="font-size:20px;color:#0C7AE8;"> Sitio Web: </span><a href="${sessionScope.lugar.url}">${sessionScope.lugar.url}</a> <br/></br><hr style="border:1px solid lavender;"/>
                            <div class="notaP">
                                Nota EasyTravel: <span style="font-size:30px ;color:green">${sessionScope.lugar.valoracion}</span><br/></br>
                            </div>
                            <span style="font-size:20px;color:#0C7AE8;">Valoración EasyTravel: </span></br></br>
                            <div class="comentarioP">                               
                                    ${sessionScope.lugar.comentario}
                            </div></br></br>
                            <span style="font-size:20px;color:#0C7AE8;"><a href="javascript:peticionAJAX('/Entregable/agregar/${lugar.id}', 'itinerario');">Añadir al itinerario</a></span>
                        </div>
                   </div>
                   <div class="itinerarioLugar" id="itinerario">
                        <%@include file="itinerario.jsp" %>
                   </div>
                   
                   <div class="contenedorCUsuarios">
                    <hr style="border:1px solid lavender;"/></br></br>
                    <span style="font-size:25px;color:#0C7AE8;margin-left:450px;">Valoración Usuarios</span>
                      <div class="fondoComentarios">
                         <c:if test="${not empty sessionScope.comentarios}">
                          
                          <c:forEach var="comentario" items="${sessionScope.comentarios}">
                            <div class="usuario">
                              <b>${comentario.usuario} </b>
                            </div>

                            <div class="comentarioUsuario">
                               <span style="font-size:20px;">Nota:</span><span style="font-size:20px;color:green;"><b>${comentario.nota}</b></span></br></br>
                                ${comentario.opinion}
                            </div>
                         </c:forEach>
                        </c:if>
                          
                      </div>
                    </div>
                     
                      <div class="nuevoComentario">
                          <hr style="border:1px solid lavender;"/></br></br>
                         
                          <c:if test="${not empty sessionScope.user}">
                              
                                    <form name="formularioComentario" action="/Entregable/comentar/" method="POST" onsubmit="javascript:return validarComentario();" >
                                            <span style="font-size:20px;color:#0C7AE8;"><b>${sessionScope.user.nombre} </b></span><input type="text" name="nota" value="Nota" size="4" style="border-radius: 5px;border: 1px solid lavender;margin:0px 0px 5px 45px;color:grey;text-align: center;" onclick="this.value=''; this.style.color='#000000'">
                                            <span id="errorComentario" style="color:currentColor; margin-left:10px"></span><textarea class="textArea" name="texto" ></textarea>
                                            <input type="submit" value="Comentar" name="comentar" style="clear:both;float:right;margin:10px 0px 10px 0px;" >
                                    </form>
                          </c:if>  
                     </div>
                   </div>
               </div>
            
   </body>
 </html>
                   