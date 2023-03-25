import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "123456",
    database = "flying_groceries"
)
def getAnalysis():
    mycursor.execute('''SELECT CategoryId, SubCategoryId, Count(ProductId) FROM Product GROUP BY CategoryId, SubCategoryId WITH ROLLUP;''')
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult

def getRequests():
    mycursor.execute('''SELECT RequestId, User_FirstName, User_MiddleName, User_LastName,PhoneNumber  FROM TransporterRequests ORDER BY RequestId''')
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult

def setStatus(requestId,decision):
    sqlFormula = "UPDATE TransporterRequests SET RequestStatus = %s WHERE RequestId = %s"
    transporter = (decision,requestId)
    mycursor.execute(sqlFormula,transporter)
    mydb.commit()
    sqlFormula = "DELETE FROM TransporterRequests Where RequestId = %s"
    transporter1=(requestId,)
    mycursor.execute(sqlFormula,transporter1)
    mydb.commit()
    
mycursor = mydb.cursor()
transporter = getRequests()
print(transporter)
