import mysql.connector
import csv
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries"
)
filename = "delivery.csv"
fields_d=[]
rows_d=[]
with open(filename,'r') as csvfile:
    csvreader=csv.reader(csvfile)
    fields_d=next(csvreader)
    for row in csvreader:
        rows_d.append(row)
del_data=[]
for i in rows_d:
    i[0]=int(i[0])
    i[1]=int(i[1])
    del_data.append(tuple(i))
mycursor=mydb.cursor()


sqlFormula = "INSERT INTO GetsAssigned(OrderId,TransporterId) VALUES (%s,%s)"
mycursor.executemany(sqlFormula,del_data)
mydb.commit()