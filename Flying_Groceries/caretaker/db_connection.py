import mysql.connector
mydb = mysql.connector.connect(
    host = "localhost",
    user = "root",
    passwd = "123456",
    database = "flying_groceries"
)
def getAnalysis():
    mycursor.execute('''SELECT CategoryId, SubCategoryId, ProductId, count(CustomerId) as 'NumberOfCustomers' FROM Cart GROUP BY CategoryId, SubCategoryId, ProductId WITH ROLLUP;''')
    myresult = mycursor.fetchall()
    print(myresult)
    finalResult = []
    special=[]
    for i in myresult:
        if i[1]==None and i[2]==None:
            special.append((i[0],i[3]))
        if None in i:
            pass
        else:
            finalResult.append(i)
    
    y=[]
    x=[]
    for i in finalResult:
        y.append(i[3])
        x.append((i[0],i[1],i[2]))
    return [x,y,special]

def getRequests():
    mycursor.execute('''SELECT RequestId, User_FirstName, User_MiddleName, User_LastName,PhoneNumber  FROM TransporterRequests ORDER BY RequestId''')
    myresult = mycursor.fetchall()
    return myresult

def setStatus(requestId,decision):
    sqlFormula = "UPDATE TransporterRequests SET RequestStatus = %s WHERE RequestId = %s"
    transporter = (decision,requestId)
    mycursor.execute(sqlFormula,transporter)
    mydb.commit()

    # Trigger works here
    sqlFormula = "DELETE FROM TransporterRequests Where RequestId = %s"
    transporter1=(requestId,)
    mycursor.execute(sqlFormula,transporter1)
    mydb.commit()
    
mycursor = mydb.cursor()
# transporter = getRequests()
analysis = getAnalysis()
print(analysis)
