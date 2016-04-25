import mysql.connector
from flask.ext.api import FlaskAPI

app = FlaskAPI('automeet')

cnx = mysql.connector.connect(user='cm', password='cm',
                              host='127.0.0.1',
                              database='cm')
cursor = cnx.cursor()


#inicializando:
pueblos=dict()
query = ("SELECT * FROM pueblos "
         #"WHERE hire_date BETWEEN %s AND %s"
         )
cursor.execute(query)
#cursor.execute(query, (hire_start, hire_end))

for (id_pueblo, nombre_pueblo, id_provincia) in cursor:
  pueblos[id_pueblo]=(nombre_pueblo,id_provincia)

cursor.close()
cnx.close()
@app.route("/<int:key1>/<int:key2>/", methods=['GET'])
def getPueblo(key1,key2):
    (a,b)=pueblos[key1]
    return {a:key2}

@app.route('/pueblos/')
def example():
    return pueblos

app.run(debug=True)
