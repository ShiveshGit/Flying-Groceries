import mysql.connector
from datetime import datetime
mydb = mysql.connector.connect(
    host="localhost", user="root", passwd="123456", database="flying_groceries"
)

def addCustomer(firstName,lastname,userName,password,phoneNumber,houseNumber,pincode,city,locality):
    sqlFormula = "INSERT INTO Customer (UserName,UserPassword,User_FirstName,User_LastName,PhoneNumber,Customer_HouseNumber,Customer_PinCode,Customer_Locality,Customer_City) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    customer = (userName,password,firstName,lastname,phoneNumber,houseNumber,pincode,locality,city)
    mycursor.execute(sqlFormula,customer)
    mydb.commit()


def getTransporterDetails(username):
    sqlFormula = "SELECT * FROM Transporter WHERE Username = %s"
    value = (username,)
    mycursor.execute(sqlFormula,value)
    myresult = mycursor.fetchall()
    return myresult
mycursor = mydb.cursor()


def updateTransporterInfo(firstName,middleName,lastName,Myusername,Mypassword,phoneNumber,transporterId):
    sqlFormula = "UPDATE Transporter SET User_FirstName = %s,User_MiddleName = %s,User_LastName = %s,PhoneNumber = %s,Username = %s, UserPassword = %s WHERE TransporterId = %s"
    values = (firstName,middleName,lastName,phoneNumber,Myusername,Mypassword,transporterId)
    mycursor.execute(sqlFormula,values)
    mydb.commit()


def getOrders(transporterId):
    sqlFormula = '''
                    SELECT Delivery.CheckOutDateAndTime,Customer.User_FirstName,Customer.Customer_City,Delivery.DeliveryStatus,Delivery.OrderId FROM Delivery
                    LEFT JOIN Customer on Delivery.CustomerId = Customer.CustomerId 
                    Where Delivery.TransporterId  = %s;
                    '''
    values = (transporterId,)
    mycursor.execute(sqlFormula,values)
    myresult = mycursor.fetchall()
    return myresult

def getTransporterId(username):
    sqlFormula = "SELECT TransporterId FROM Transporter WHERE Username = %s"
    values = (username,)
    mycursor.execute(sqlFormula,values)
    myresult = mycursor.fetchall()
    print(myresult)
    return myresult[0][0]

def getCustomerDetails(username):
    sqlFormula = "SELECT * FROM Customer WHERE Username = %s"
    values=(username,)
    mycursor.execute(sqlFormula,values)
    myres = mycursor.fetchall()
    return myres

def updateCustomerInfo(firstName,middleName,lastName,userName,password,phoneNumber,customerId,houseNumber,pincode,city,locality):
    sqlFormula = "UPDATE Customer SET User_FirstName = %s,User_MiddleName = %s,User_LastName = %s,PhoneNumber = %s,Username = %s,UserPassword =%s,Customer_HouseNumber=%s,Customer_Pincode=%s,Customer_City=%s,Customer_Locality=%s WHERE CustomerId = %s"
    values = (firstName,middleName,lastName,phoneNumber,userName,password,houseNumber,pincode,city,locality,customerId)
    mycursor.execute(sqlFormula,values)
    mydb.commit()


def getActiveOrders(requestId):
    sqlFormula ='''
                    SELECT Product.CategoryId,Product.SubCategoryId,Product.ProductId,Delivery.Quantity,Product.ProductName,Delivery.TransporterId,Delivery.CheckoutDateAndTime
                    FROM Delivery Left Join Product on Delivery.CategoryId = Product.CategoryId and Delivery.SubCategoryId = Product.SubCategoryId and Delivery.ProductId = Product.ProductId
                    WHERE CheckoutDateAndTime in (SELECT Distinct CheckoutDateAndTime From Delivery WHERE CustomerId = %s and DeliveryStatus =1);
                '''
    values = (requestId,)
    mycursor.execute(sqlFormula,values)
    myres1 = mycursor.fetchall()
    orders = {}
    for i in myres1:
        key = i[6].strftime("%d/%m/%Y %H:%M:%S")
        finalKey = ""
        for j in key:
            if j==" ":
                finalKey+="$"
            else:
                finalKey=finalKey+j
        orders[finalKey]=[]
    for i in myres1:
        key = i[6].strftime("%d/%m/%Y %H:%M:%S")
        finalKey = ""
        for j in key:
            if j==" ":
                finalKey+="$"
            else:
                finalKey=finalKey+j
        orders[finalKey].append(i[0:6])
    print(orders)
    return orders


def getPastOrders(requestId):
    sqlFormula ='''
                    SELECT Product.CategoryId,Product.SubCategoryId,Product.ProductId,Delivery.Quantity,Product.ProductName,Delivery.TransporterId,Delivery.CheckoutDateAndTime
                    FROM Delivery Left Join Product on Delivery.CategoryId = Product.CategoryId and Delivery.SubCategoryId = Product.SubCategoryId and Delivery.ProductId = Product.ProductId
                    WHERE CheckoutDateAndTime in (SELECT Distinct CheckoutDateAndTime From Delivery WHERE CustomerId = %s and DeliveryStatus = 2);
                '''
    values = (requestId,)
    mycursor.execute(sqlFormula,values)
    myres = mycursor.fetchall()
    orders = {}
    for i in myres:
        orders[i[6].strftime("%d/%m/%Y")]=[]
    for i in myres:
        orders[i[6].strftime("%d/%m/%Y")].append(i[0:6])
    return orders

def extractOrderData(string):
    list_outer=[]
    list_1=[]
    flag_space=1
    flag_string=0
    s=""
    for i in string:
        if i=='[' or i==']':
            continue
        if i==',':
            flag_space=0
            continue
        if i=='(':
            continue
        if i==')':
            list_outer.append(tuple(list_1))
            list_1=[]
        elif i==' ' and flag_string==0:
            flag_space=1
        elif i=='\'':
            flag_string=(flag_string+1)%2
            if(flag_string==0):
                list_1.append(s)
                s=""
        else:
            if(flag_string==1):
                s+=i
            elif(flag_space==1):
                #print(int(i))
                list_1.append(int(i))
                flag_space=0
            else:
                a=list_1.pop()
                list_1.append(a*10+int(i))
    print(list_outer)
    return list_outer

def getCustomerId(username):
    sqlFormula = "SELECT CustomerId FROM Customer WHERE Username = %s "
    # print(username)
    values = (username,)
    mycursor.execute(sqlFormula,values)
    myres = mycursor.fetchall()
    return myres[0][0]
def cancelOrders(data,stringDate,customerId):
    orderData = extractOrderData(data)
    stringDate = stringDate.split("$")
    finalDate =stringDate[0]+" "+stringDate[1]
    checkoutDate = datetime.strptime(finalDate,"%d/%m/%Y %H:%M:%S")
    print(checkoutDate)
    productDatas = []
    transporterDatas = []
    for i in orderData:
        productDatas.append((i[3],i[2]))
        transporterDatas.append((i[5],))

    print(productDatas)
    print(transporterDatas)

    sqlFormula ='''
                    DELETE FROM Delivery WHERE CustomerId = %s and CheckOutDateAndTime = %s
                '''
    values = (customerId,checkoutDate)
    mycursor.execute(sqlFormula,values)
    mydb.commit()

    sqlFormula = '''
                    UPDATE Product Set Quantity = Quantity + %s WHERE ProductId = %s
                 '''
    mycursor.executemany(sqlFormula,productDatas)
    mydb.commit()

    sqlFormula = '''
                    UPDATE Transporter Set ActiveStatus = 1 , CurrentActiveOrders = CurrentActiveOrders - 1 WHERE TransporterId = %s
                 '''

    mycursor.executemany(sqlFormula,transporterDatas)
    mydb.commit()

    # print(productDatas)
    # print(checkoutDate)

