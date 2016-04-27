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
    if request.method == 'POST':
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
        #En caso de error devolver una lista con los errores
        if(len(errores)>0):
            return errores

        #Generar token para el usuario en caso de exito

        #insertar datos en la base de datos

        #devolver {"token":token}
        print(errores)
        return {"hash":passwd}



app.run(debug=True)
