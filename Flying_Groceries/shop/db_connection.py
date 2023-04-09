import mysql.connector


def getCategories():
    mycursor.execute("SELECT * FROM Category ORDER By CategoryId")
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult


def getSubCategories(catId):
    mytup = (catId,)
    sqlFormula = """
                    SELECT * FROM SubCategory
                    WHERE CategoryId = %s
                    Order By SubCategoryId
                 """
    mycursor.execute(sqlFormula, mytup)
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult


def getProducts(catId, subCatId):
    mytup = (catId, subCatId)
    sqlFormula = """
                    SELECT * FROM PRODUCT
                    WHERE CategoryId = %s and SubCategoryId = %s
                    Order By ProductId
                 """

    mycursor.execute(sqlFormula, mytup)
    myresult = mycursor.fetchall()
    # print(myresult)
    return myresult


def showTables():
    mycursor.execute("SHOW TABLES")
    for tb in mycursor:
        print(tb)


mydb = mysql.connector.connect(
    host="localhost", user="root", passwd="123456", database="flying_groceries"
)


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
        sqlForumula3 = "SELECT CategoryId, SubCategoryId, ProductId, ProductName, FinalPrice FROM Product WHERE ProductId = %s"
        mycursor.execute(sqlForumula3,products[i])
        res = mycursor.fetchall()
        res.append(result[i][1])
        myresult.append(res)
    finalres=[]
    for i in myresult:
        finalres.append((i[0][0],i[0][1],i[0][2],i[0][3],i[0][4],i[1]))
    print(finalres)
    return finalres

def getUserId(username):
    sqlFormula = "SELECT CustomerId From Customer WHERE username = %s"
    name = (username,)
    mycursor.execute(sqlFormula,name)
    userId = mycursor.fetchone()
    # print(userId)
    return userId

def addToCart(userId,catId,subCatId,prodId):
    sqlFormula = "INSERT INTO CART (CustomerId,CategoryId,SubCategoryId,ProductId,Quantity) VALUES (%s,%s,%s,%s,%s)"
    Quantity =1
    val =(userId,catId,subCatId,prodId,Quantity)
    print(val)
    mycursor.execute(sqlFormula,val)
    mydb.commit()

def updateCart(userId,prodId,catId,subCatId,quantity):
    print("User = ",userId)
    catId = int(catId)
    subCatId = int(subCatId)
    quantity = int(quantity)
    prodId = int(prodId)
    sqlFormula = "UPDATE CART SET Quantity = %s WHERE CustomerId = %s and CategoryId = %s and SubCategoryId = %s and ProductId = %s"
    val = (quantity,userId,catId,subCatId,prodId)
    print(val)
    mycursor.execute(sqlFormula,val)
    mydb.commit()

def removeProductFromCart(catId,subCatId,prodId,userId):
    sqlFormula1 = "DROP Trigger del_and_insert_cart"
    mycursor.execute(sqlFormula1)
    mydb.commit()
    sqlFormula2 = "DELETE FROM CART WHERE CustomerId = %s and CategoryId = %s and subCategoryId = %s and productId = %s"
    values = (userId,catId,subCatId,prodId)
    mycursor.execute(sqlFormula2,values)
    mydb.commit()
    sqlFormula3 ='''
                CREATE TRIGGER del_and_insert_cart
            AFTER DELETE
            ON Cart
            FOR EACH ROW
            BEGIN
            SELECT TransporterId INTO @Transporter_Id FROM Transporter WHERE Transporter.ActiveStatus = 1 and Transporter.currentActiveOrders<10 ORDER BY TransporterId LIMIT 1;
            SELECT CurrentActiveOrders INTO @Active_Orders FROM Transporter WHERE Transporter.TransporterId = @Transporter_Id;
            SELECT QUANTITY INTO @Prod_Quantity FROM PRODUCT WHERE Product.ProductId = OLD.ProductId and Product.CategoryId = OLD.CategoryID and Product.SubCategoryId = OLD.SubCategoryId;
            SELECT COUNT(ProductId) INTO @TOT_PROD FROM Cart WHERE CustomerId = OLD.CustomerId Group By CustomerId;

            if @Prod_Quantity>OLD.Quantity THEN
                INSERT INTO Delivery (PaymentId,CustomerId,TransporterId,CategoryId,SubCategoryId,ProductId,Quantity,PaymentType,CheckOutDateAndTime) VALUES (2000+Old.CustomerId,Old.CustomerId,@Transporter_Id,OLD.CategoryId,OLD.SubCategoryId,OLD.ProductId,OLD.Quantity,"PayTM",NOW());

                UPDATE Transporter
                SET CurrentActiveOrders = CurrentActiveOrders +1
                WHERE CurrentActiveOrders<10 and Transporter.TransporterId = @Transporter_Id;
                
                UPDATE Product
                SET Quantity = Quantity - OLD.Quantity
                WHERE Product.ProductId = OLD.ProductId and Product.CategoryId = OLD.CategoryId and Product.SubcategoryId = OLD.subCategoryId ;

                if @Active_Orders =9 THEN
                    UPDATE Transporter
                    SET ActiveStatus = 0
                    WHERE TransporterId  = @Transporter_Id;
                end if;
            end if;
            end'''
    mycursor.execute(sqlFormula3)
    mydb.commit()

def checkOutCart(userId):
    print("In the function")
    sqlFormula = "DELETE FROM CART WHERE CustomerId = %s"
    customerId = (userId,)
    mycursor.execute(sqlFormula,customerId)
    mydb.commit()
mycursor = mydb.cursor()

