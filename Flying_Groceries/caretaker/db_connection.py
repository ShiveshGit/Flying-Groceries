import mysql.connector
from datetime import datetime

mydb = mysql.connector.connect(
    host="localhost", user="root", passwd="123456", database="flying_groceries"
)


def getAnalysis():
    mycursor.execute(
        """SELECT CategoryId, SubCategoryId, ProductId, count(CustomerId) as 'NumberOfCustomers' FROM Cart GROUP BY CategoryId, SubCategoryId, ProductId WITH ROLLUP;"""
    )
    myresult = mycursor.fetchall()
    finalResult = []
    special = []
    for i in myresult:
        if i[1] == None and i[2] == None:
            special.append((i[0], i[3]))
        if None in i:
            pass
        else:
            finalResult.append(i)

    y = []
    x = []
    for i in finalResult:
        y.append(i[3])
        x.append((i[0], i[1], i[2]))
    return [x, y, special]


def getOrderAnalysis():
    mycursor.execute(
        """SELECT CheckOutDateAndTime, ProductId, count(OrderId), GROUPING(CheckOutDateAndTime), GROUPING(ProductId)
                        FROM Delivery
                        GROUP BY CheckOutDateAndTime, ProductId WITH ROLLUP;"""
    )
    x = []
    y = []
    myresult = mycursor.fetchall()
    print(myresult)
    totalOrders = myresult.pop()
    for i in myresult:
        if i[1] == None:
            d = i[0].strftime("%d/%m/%Y")
            x.append(d)
            y.append(i[2])
    return [x, y]


def getTransporterAnalysis():
    mycursor.execute(
        """
                        SELECT Transporter.TransporterId, Transporter.ActiveStatus, count(OrderId)
                        FROM GetsAssigned LEFT JOIN Transporter ON GetsAssigned.TransporterId=Transporter.TransporterId
                        GROUP BY TransporterId, ActiveStatus WITH ROLLUP;
                    """
    )
    myresult = mycursor.fetchall()
    result = []
    myresut = myresult.pop()
    for i in myresult:
        if i[1] == None:
            result.append((i[0], i[2]))
    result = result[:12]
    return result


def getTransporters():
    mycursor.execute(
        """
                        SELECT TransporterId,User_Firstname,User_MiddleName,User_LastName,PhoneNumber,PresentSalary From Transporter order by TransporterId;
                    """
    )
    myresult = mycursor.fetchall()
    return myresult


def getRequests():
    mycursor.execute(
        """SELECT RequestId, User_FirstName, User_MiddleName, User_LastName,PhoneNumber  FROM TransporterRequests ORDER BY RequestId"""
    )
    myresult = mycursor.fetchall()
    return myresult


def setStatus(requestId, decision):
    sqlFormula = (
        "UPDATE TransporterRequests SET RequestStatus = %s WHERE RequestId = %s"
    )
    transporter = (decision, requestId)
    mycursor.execute(sqlFormula, transporter)
    mydb.commit()

    # Trigger works here
    sqlFormula = "DELETE FROM TransporterRequests Where RequestId = %s"
    transporter1 = (requestId,)
    mycursor.execute(sqlFormula, transporter1)
    mydb.commit()

def getProducts1(username):
    sqlFormula1 = "SELECT CustomerId From Customer WHERE Username = %s"
    CustomerName = (username,)
    mycursor.execute(sqlFormula1,CustomerName)
    result = mycursor.fetchall()[0]
    print(type(result))
    
    sqlFormula2 = "SELECT ProductId,Quantity FROM CART WHERE CustomerId = %s"
    mycursor.execute(sqlFormula2,result)
    result = mycursor.fetchall()
    print(result)
    products =[]
    for i in result:
        products.append((i[0],))
    print(products)
    myresult =[]
    for i in range(len(products)):
        sqlForumula3 = "SELECT ProductId, ProductName, FinalPrice FROM Product WHERE ProductId = %s"
        mycursor.execute(sqlForumula3,products[i])
        res = mycursor.fetchall()
        res.append(result[i][1])
        myresult.append(res)
    finalres=[]
    for i in myresult:
        finalres.append((i[0][0],i[0][1],i[0][2],i[1]))
    print(finalres)
    return finalres


def getAdminDetails(username):
    sqlFormula = "SELECT * FROM AppAdmin WHERE Username = %s"
    value = (username,)
    mycursor.execute(sqlFormula,value)
    myresult = mycursor.fetchall()
    return myresult

def updateAdminInfo(firstName,middleName,lastName,userName,password,adminId):
    sqlFormula = "UPDATE AppAdmin SET UserName = %s, User_FirstName = %s, User_MiddleName = %s,  User_LastName = %s,  UserPassword = %s WHERE AdminId = %s"
    values = (userName,firstName,middleName,lastName,password,adminId) 
    print(values)
    mycursor.execute(sqlFormula,values)
    mydb.commit()

def getAdminId(username):
    sqlFormula = "SELECT AdminId From AppAdmin WHERE Username = %s"
    values = (username,)
    mycursor.execute(sqlFormula,values)
    myres = mycursor.fetchall()
    return myres


def getCategories():
    sqlFormula = "SELECT * FROM Category"
    mycursor.execute(sqlFormula)
    myres = mycursor.fetchall()
    return myres

def getSubCategories(categoryId):
    sqlFormula = "SELECT CategoryId, SubCategoryId FROM SubCategory WHERE CategoryId = %s"
    values = (categoryId,)
    mycursor.execute(sqlFormula,values)
    myres = mycursor.fetchall()
    return myres

def addProduct(categoryId,subCategoryId,productId,productName,specification,companyName,discount,mrp,manufacturing_date,expiry_date,quantity):
    try:
        sqlFormula ='''
                        INSERT INTO Product (CategoryId,SubCategoryId,ProductId,ProductName,specification,CompanyName,discount,mrp,ManufacturingDate,ExpiryDate,Quantity) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
                    '''
        values = (categoryId,subCategoryId,productId,productName,specification,companyName,discount,mrp,manufacturing_date,expiry_date,quantity)
        mycursor.execute(sqlFormula,values)
        if manufacturing_date>expiry_date:
            raise Exception("Manufacturing date cannot be before the expiry date")
        mydb.commit()
        return 1
    except mysql.connector.Error as error:
        mydb.rollback()
        return -1
    except Exception as e:
        mydb.rollback()
        return 2
    
def addCategory(categoryId,categoryName):
    try:
        sqlFormula='''
                        INSERT INTO Category (CategoryId,CategoryName) VALUES (%s,%s)
                    '''
        values=(categoryId,categoryName)
        mycursor.execute(sqlFormula,values)
        mydb.commit()
        return 1
    except mysql.connector.Error as error:
        return -1
    
def addSubCategory(categoryId,subCategoryId,subCategoryName):
    try:
        sqlFormula='''
                        INSERT INTO SubCategory (CategoryId,SubCategoryId,SubCategoryName) VALUES (%s,%s,%s)
                    '''
        values = (categoryId,subCategoryId,subCategoryName)
        mycursor.execute(sqlFormula,values)
        mydb.commit()
        return 1
    except mysql.connector.Error as error:
        return -1

def getTransporterInfo():
    sqlFormula = "SELECT MAX(TransporterId) FROM Transporter"
    mycursor.execute(sqlFormula)
    myres = mycursor.fetchall()
    myvalues=myres[0]
    sqlFormula = "SELECT Username,UserPassword FROM Transporter WHERE TransporterId = %s"
    mycursor.execute(sqlFormula,myvalues)
    myres = mycursor.fetchall()
    return myres[0]

mycursor = mydb.cursor()
# analysis = getOrderAnalysis()
info = getTransporterInfo()
print(info)
# print(analysis)

