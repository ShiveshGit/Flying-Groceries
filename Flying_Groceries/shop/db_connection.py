import mysql.connector
def getCategories():
    mycursor.execute("SELECT * FROM Category ORDER By CategoryId")
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult

def getSubCategories(catId):
    mytup = (catId,)
    sqlFormula = '''
                    SELECT * FROM SubCategory
                    WHERE CategoryId = %s
                    Order By SubCategoryId
                 '''
    mycursor.execute(sqlFormula,mytup)
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult
def getProducts(catId,subCatId):
    mytup = (catId,subCatId)
    sqlFormula = '''
                    SELECT * FROM PRODUCT
                    WHERE CategoryId = %s and SubCategoryId = %s
                    Order By ProductId
                 '''
    
    mycursor.execute(sqlFormula,mytup)
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult
def showTables():
    mycursor.execute("SHOW TABLES")
    for tb in mycursor:
        print(tb)   
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries" 
)
mycursor = mydb.cursor()
categories = getCategories()
products = getProducts(1,1)
subcategories = getSubCategories(1)
