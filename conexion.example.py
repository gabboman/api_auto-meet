import mysql.connector

def conectar():
    cnx = mysql.connector.connect(user='usuario', password='pass',
                                  host='host',
                                  database='database')
    return cnx
