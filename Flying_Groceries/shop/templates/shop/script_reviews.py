import mysql.connector
import random
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries"
)
mycursor=mydb.cursor()
reviews_data=[]
for i in range(100):
    l=[]
    l.append(i+1)
    l.append(random.randint(1,5))
    l=tuple(l)
    reviews_data.append(l)

sqlFormula = "INSERT INTO Reviews(RequestId,AdminId) VALUES(%s,%s)"
mycursor.executemany(sqlFormula,reviews_data)
mydb.commit()