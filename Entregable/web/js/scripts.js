function validar()
{
    if(document.formularioBuscar.busqueda.value.length == 0)
    {
        document.getElementById("error").innerHTML = "Introduzca un criterio de búsqueda";
        document.formularioBuscar.busqueda.select;
        return false;
    }      
}    

function validarComentario()
{
    if(document.formularioComentario.nota.value.length == 0 || document.formularioComentario.texto.value.length == 0 )
    {
        document.getElementById("errorComentario").innerHTML = "Introduzca una nota y un comentario";
        return false;
    }
    else
    {
        if(isNaN(document.formularioComentario.nota.value))
        {
            document.getElementById("errorComentario").innerHTML = "Introduzca un valor numérico en la nota";
            document.formularioComentario.nota.select;
            return false;
        }
    }
}    

function peticionAJAX(url, idDiv)
{
        var xmlHttpReq = new XMLHttpRequest();
        xmlHttpReq.onreadystatechange=function()
                {
                    if (xmlHttpReq.readyState == 4 && xmlHttpReq.status==200)
                        document.getElementById(idDiv).innerHTML = xmlHttpReq.responseText;
                }

        xmlHttpReq.open('GET', url, true); 
        xmlHttpReq.send();

}
