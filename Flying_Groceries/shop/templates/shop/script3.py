from datetime import datetime
import csv
filename = "TransporterRequests.csv"
fields=[]
rows=[]
with open(filename,'r') as csvfile:
    csvreader=csv.reader(csvfile)
    fields=next(csvreader)
    for row in csvreader:
        rows.append(row)
TransportersRequestsData=[]
for i in rows:
    i[0]=int(i[0])
    i[4]=int(i[4])
    i[5]=int(i[5])
    i[6]=int(i[6])
    i[7]=int(i[7])
    TransportersRequestsData.append(tuple(i))
print(TransportersRequestsData)
import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries"
)
mycursor=mydb.cursor()
mycursor.execute("SHOW DATABASES")
for db in mycursor:
    print(db)
sqlFormula = "INSERT INTO TransporterRequests (RequestId,User_FirstName,User_LastName,User_MiddleName,PhoneNumber,AadharNumber,DrivingLicenseNumber,RequestStatus) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
mycursor.executemany(sqlFormula,TransportersRequestsData)
mydb.commit()