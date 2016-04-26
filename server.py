from flask import request, url_for
from flask.ext.api import FlaskAPI, status, exceptions
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
        note = str(request.data.get('patatas'))
        return request.args
        #return {"dank":"maymays"}



app.run(debug=True)
