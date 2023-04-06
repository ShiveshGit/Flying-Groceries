import mysql.connector

mydb = mysql.connector.connect(
    host="localhost", user="root", passwd="123456", database="flying_groceries"
)
mycursor = mydb.cursor()
mycursor.execute(
    "SELECT AdminId, RequestStatus, Count(RequestId) from Reviews join TransporterRequests on TransporterRequests.RequestId=Reviews.RequestId GROUP BY ROLLUP (AdminId,RequestStatus);"
)
for tb in mycursor:
    print(tb)
