# Api para la app de CM: AutoMeet

Para el registro de usuarios hay que hacer un post a /registro/ con los siguientes datos:
nombre

apellidos

telefono

pueblo: Numero indicando la id del pueblo del usuario a registrar

correo

password

La api devolverá un exito:true, y token: el token. Las cosas ue requieran el usuario serán autorizadas con el token.








Para el login bastará con:
correo y password. Igualmente, devolverá el mismo token que con el registro




#SIN TESTEAR

#SIN VERIFICAR DATOS:
*crear viajes
