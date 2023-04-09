import mysql.connector

mydb = mysql.connector.connect(
    host="localhost", user="root", passwd="123456", database="flying_groceries"
)

def addCustomer(firstName,lastname,userName,password,phoneNumber,houseNumber,pincode,city,locality):
    sqlFormula = "INSERT INTO Customer (UserName,UserPassword,User_FirstName,User_LastName,PhoneNumber,Customer_HouseNumber,Customer_PinCode,Customer_Locality,Customer_City) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    customer = (userName,password,firstName,lastname,phoneNumber,houseNumber,pincode,locality,city)
    mycursor.execute(sqlFormula,customer)
    mydb.commit()

mycursor = mydb.cursor()

