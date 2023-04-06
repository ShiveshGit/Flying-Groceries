from datetime import datetime
import mysql.connector
import pandas as pd
import csv
import random

# TAKE PRODUCT DATA
filename = "Product.csv"
fields_p = []
rows_p = []
with open(filename, "r") as csvfile:
    csvreader = csv.reader(csvfile)
    fields_p = next(csvreader)
    for row in csvreader:
        rows_p.append(row)
ProductData = []
print(rows_p)
for i in rows_p:
    i[0] = int(i[0])  # cat id
    i[1] = int(i[1])  # subcat id
    i[2] = int(i[2])  # product id
    i[8] = int(i[8])  # quantity
    ProductData.append(tuple(i))
print(ProductData)

# TAKE DELIVERY.CSV DATA
filename = "delivery.csv"
fields_d = []
rows_d = []
with open(filename, "r") as csvfile:
    csvreader = csv.reader(csvfile)
    fields_d = next(csvreader)
    for row in csvreader:
        rows_d.append(row)
del_data = []
for i in rows_d:
    i[0] = int(i[0])
    i[1] = int(i[1])
    del_data.append(tuple(i))
print(del_data)
mydb = mysql.connector.connect(
    host="localhost", user="root", passwd="123456", database="flying_groceries"
)

mycursor = mydb.cursor()
order_entries = []
for i in del_data:
    l = []
    l.append(i[0])
    l.append(i[1])
    l.append(i[1])

    n = random.randint(1, 99)
    tup = ProductData[n]
    l.append(tup[0])
    l.append(tup[1])
    l.append(tup[2])
    l.append(random.randint(1, tup[8]))

    l.append("paytm")
    l.append(random.randint(0, 2))  # del_status
    l = tuple(l)
    print(l)
    order_entries.append(l)

sqlFormula = "INSERT INTO Delivery (PaymentId,CustomerId,TransporterId,CategoryId,SubCategoryId,ProductId,Quantity,PaymentType,DeliveryStatus) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
mycursor.executemany(sqlFormula, order_entries)
mydb.commit()

# cart_entry=[]
# j=1
# for i in order_entries:
#     l=()
#     l=[]
#     l.append(i[1]) #cus
#     l.append(i[3]) #cat
#     l.append(i[4]) #subca
#     l.append(i[5]) #product
#     l.append(i[6]) #quantity
#     l.append(j) #orderid
#     x=datetime.now()
#     l.append(x)
#     l=tuple(l)
#     j+=1
#     print(l)
#     cart_entry.append(l)

# sqlFormula = "INSERT INTO Cart (CustomerId,CategoryId,SubCategoryId,ProductId,Quantity,OrderId,CheckOutDateAndTime) VALUES (%s,%s,%s,%s,%s,%s,%s)"
# mycursor.executemany(sqlFormula,cart_entry)
# mydb.commit()
