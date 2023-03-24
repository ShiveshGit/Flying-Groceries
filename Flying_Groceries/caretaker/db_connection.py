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
    print(myresult)
    return myresult
mycursor = mydb.cursor()
analysis = getAnalysis()
