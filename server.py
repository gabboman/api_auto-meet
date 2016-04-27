from flask import request, url_for
from flask.ext.api import FlaskAPI, status, exceptions
from werkzeug.security import generate_password_hash, check_password_hash
from validate_email import validate_email
import re
import conexion
app = FlaskAPI(__name__)

cnx = conexion.conectar()

cursor = cnx.cursor()


#inicializando:
pueblos=dict()
destinos=dict()

query = ("SELECT * FROM pueblos "
         #"WHERE hire_date BETWEEN %s AND %s"
         )
cursor.execute(query)
#cursor.execute(query, (hire_start, hire_end))

for (id_pueblo, nombre_pueblo, id_provincia) in cursor:
  pueblos[id_pueblo]=(nombre_pueblo,id_provincia)

query = ("SELECT * FROM destinos"
         #"WHERE hire_date BETWEEN %s AND %s"
         )
cursor.execute(query)
for (id_destino,nombre_universidad,provincia) in cursor:
    destinos[id_destino]=(nombre_universidad,provincia)

cursor.close()
cnx.close()
#Fin de la inicializacion


@app.route("/<int:key1>/<int:key2>/", methods=['GET'])
def getViajes(key1,key2):
    if key1 not in pueblos or key2 not in destinos:
        return ["NOT FOUND"]
    (a,b)=pueblos[key1]
    return {a:destinos[key2]}


@app.route('/pueblos/')
def example():
    return pueblos

@app.route("/registro/",methods=['POST'])
def registro():

    datos=request.form
    nombre=datos["nombre"]
    apellidos=datos["apellidos"]
    telefono=datos["telefono"]
    pueblo=datos["pueblo"]
    correo=datos["correo"]
    passwd= generate_password_hash(datos["password"])# check_password_hash(pw_hash, password)
    #verificar datos aqui:
    #el pueblo existe
    errores=list()
    if(not int(pueblo) in pueblos):
        errores.append("error: pueblo no existente: "+pueblo)
    #el correo es valido
    if not validate_email(correo):#paranoya: verify=True revisar que el correo existe
        errores.append("error: correo no valido: "+correo)
    #el telefono es valido
    regexpTelefono = re.compile("^[9|6|7][0-9]{8}$")
    if not regexpTelefono.match(telefono):
        errores.append("error: telefono no valido: "+telefono)
    #verificar que el usuario no está registrado:
    consultaCorreoUnico='SELECT correo FROM `usuarios` WHERE `correo` LIKE \''+correo+'\''
    conexionRegistro=conexion.conectar()
    cursorRegistro=conexionRegistro.cursor()
    cursorRegistro.execute(consultaCorreoUnico)
    for mail in cursorRegistro:
         errores.append("Ya existe un usuario con este correo")


    #En caso de error devolver una lista con los errores
    if(len(errores)>0):
        return errores

    #No hace falta else: hacemos un return

    #Generar token para el usuario en caso de exito

    token=generate_password_hash("TOKEN++"+passwd+datos["password"])

    #insertar datos en la base de datos
    insertarUsuario="INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellidos`, `telefono`, `pueblo_origen`, `pass`, `correo`, `token`) VALUES (NULL, \'" +\
    nombre+"\',\'"+apellidos+"\',\'"+telefono+"\',"+pueblo+",\'"+passwd+"\',\'"+correo+"\',\'"+token+"\');"
    #print(insertarUsuario)
    cursorRegistro.execute(insertarUsuario)
    conexionRegistro.commit()
    conexionRegistro.close()

    #devolver {"token":token}
    return {"exito":True,"token":token}



@app.route("/login/",methods=['POST'])
def login():
    datos=request.form
    correo=datos["correo"]
    passwd=datos["password"]
    consultaLogin='SELECT token,pass FROM `usuarios` WHERE `correo` LIKE \''+correo+'\''
    print(consultaLogin)
    conexionLogin=conexion.conectar()
    cursorLogin=conexionLogin.cursor()
    cursorLogin.execute(consultaLogin)
    for token,password in cursorLogin:
        if check_password_hash(password, passwd):
            return {"token":token}
    return{"Error":"Usuario o contraseña inválido"}



app.run(debug=True,host='0.0.0.0')
