# Flying Groceries
A complete E-Commerce website built for the Database Management System project.

## 1. Tech-stack Used :
    👉🏻 HTML CSS JavaScript (Front end)
    👉🏻 Django (Backend + Routing)
    👉🏻 MYSQL  (Database)

## 2. Setting up the project

👉🏻 Setting up the database: Run the command - `mysqldump -u username -p flying_groceries > Flying_Groceries_DB.sql` to set up the schema and dump the data into the database.

👉🏻 Setting up the website: Install all the dependencies from the requirements.txt file by running `pip install -r requirements.txt'
    
👉🏻 In the db_connection.py file in each app add this after replacing the exsisting sql connector statements : 

`mydb = mysql.connector.connect(host="your-connection-name", user="your username", passwd="your-password", database="flying_groceries")
`

👉🏻 In the *settings.py* scroll down to databases and make the same changes in the DATABASES Section as well.

👉🏻 Execute the command : `python manage.py runserver` after moving to the directory where manage.py file is present.

👉🏻 Go to http://127.0.0.1:8000/ after completing the above steps to view the website


## 3. Team Members:

👉🏻 [Shivesh Gulati]("https://github.com/ShiveshGit")

👉🏻 [Shantanu Prakash]("https://github.com/Shantanu21285")