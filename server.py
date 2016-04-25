import mysql.connector

cnx = mysql.connector.connect(user='cm', password='cm',
                              host='127.0.0.1',
                              database='cm')
cursor = cnx.cursor()



query = ("SELECT * FROM pueblos "
         #"WHERE hire_date BETWEEN %s AND %s"
         )
cursor.execute(query)
#cursor.execute(query, (hire_start, hire_end))

for (id_pueblo, nombre_pueblo, id_provincia) in cursor:
  print("{}: {} en provincia {}".format(
    id_pueblo, nombre_pueblo, id_provincia))

cursor.close()
cnx.close()
