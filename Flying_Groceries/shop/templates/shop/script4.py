from datetime import datetime
import mysql.connector
import pandas as pd
date_parser=lambda x:datetime.strptime(x,"%Y-%m-%d")

df=pd.read_csv(r"Dates.csv",parse_dates=["ManufacturingDate"],date_parser=date_parser)
lst=list(df.itertuples(index=False, name=None))
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="flying_groceries"
)
mycursor=mydb.cursor()
mycursor.execute("SHOW DATABASES")
for db in mycursor:
    print(db)
print(lst)
sqlFormula = "UPDATE Product SET ManufacturingDate = %s WHERE ProductId = %s"
mycursor.executemany(sqlFormula,lst)
mydb.commit()