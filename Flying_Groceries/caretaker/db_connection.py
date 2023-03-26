import mysql.connector
from datetime import datetime
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

def getOrderAnalysis():
    mycursor.execute('''SELECT CheckOutDateAndTime, ProductId, count(OrderId), GROUPING(CheckOutDateAndTime), GROUPING(ProductId)
                        FROM Delivery
                        GROUP BY CheckOutDateAndTime, ProductId WITH ROLLUP;''')
    x=[]
    y=[]
    myresult = mycursor.fetchall()
    totalOrders = myresult.pop()
    for i in myresult:
        if i[1]==None:
            print(type(i[0]))
            d=i[0].strftime("%d/%m/%Y")
            x.append(d)
            y.append(i[2])
    return [x,y]

def getTransporterAnalysis():
    mycursor.execute('''
                        SELECT Transporter.TransporterId, Transporter.ActiveStatus, count(OrderId)
                        FROM GetsAssigned LEFT JOIN Transporter ON GetsAssigned.TransporterId=Transporter.TransporterId
                        GROUP BY TransporterId, ActiveStatus WITH ROLLUP;
                    ''')
    myresult = mycursor.fetchall()
    result =[]
    myresut=myresult.pop()
    for i in myresult:
        if i[1]==None:
            result.append((i[0],i[2]))
    result=result[:12]
    return result

def getTransporters():
    mycursor.execute('''
                        SELECT TransporterId,User_Firstname,User_MiddleName,User_LastName,PhoneNumber,PresentSalary From Transporter order by TransporterId;
                    ''')
    myresult = mycursor.fetchall()
    print(myresult)
    return myresult
def getRequests():
    mycursor.execute('''SELECT RequestId, User_FirstName, User_MiddleName, User_LastName,PhoneNumber  FROM TransporterRequests ORDER BY RequestId''')
    myresult = mycursor.fetchall()
    print(myresult)
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
analysis = getTransporters()
print(analysis)
