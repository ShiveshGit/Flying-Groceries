from datetime import datetime
import csv
filename = "Category_1.csv"
fields=[]
rows=[]
with open(filename,'r') as csvfile:
    csvreader=csv.reader(csvfile)
    fields=next(csvreader)
    for row in csvreader:
        rows.append(row)
CategoryData=[]
print(rows)
for i in rows:
    i[0]=int(i[0])
    CategoryData.append(tuple(i))
# print(CategoryData)
import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries"
)
mycursor=mydb.cursor()
# mycursor.execute("SHOW DATABASES")
# for db in mycursor:
#     print(db)
print(CategoryData)
sqlFormula = "INSERT INTO Category (CategoryId,CategoryName) VALUES (%s,%s)"
mycursor.executemany(sqlFormula,CategoryData)
mydb.commit()