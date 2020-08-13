# !/usr/bin/python3

import subprocess as sp
import pymysql
import pymysql.cursors



def insertgood():
    global cur
    row = {}
    print("Enter new good details: ")
    row["GOODID"] = int(input("GOOD ID: "))
    row["GOOD_TYPE"] = input("GOOD TYPE: ")
    row["BRAND"] = input("BRAND: ")
    row["MRP"] = int(input("MRP "))
    row["MANUFACTURE_DATE"] = input("MANUFACTURE DATE: ")
    row["EXPIRY_DATE"] = input("EXPIRY DATE: ")
    row["NET_WEIGHT"] = int(input("NET WEIGHT:  "))
    row["TRADE_MARK"] = (input("TRADEMARK:  "))
    
    query = "INSERT INTO GOODS(GOODID,GOOD_TYPE, BRAND, MRP, MANUFACTURE_DATE, EXPIRY_DATE,NET_WEIGHT, TRADE_MARK) VALUES(%d, '%s', '%s', %d, '%s', '%s', %d, '%s')" %(row["GOODID"], row["GOOD_TYPE"], row["BRAND"], row["MRP"], row["MANUFACTURE_DATE"], row["EXPIRY_DATE"], row["NET_WEIGHT"], row["TRADE_MARK"])

    cur.execute(query)
    con.commit()
    return


def insertemployee():
    global cur
    row = {}
    print("Enter new employee's details: ")
    row["EMPLOYEE ID"] = int(input("EMPLOYEE ID: "))
    name = (input("Name (Firstname Lastname): ")).split(' ')
    row["FIRST NAME"] = name[0]
    row["LAST NAME"] = name[1]

    row["MOTHER'S NAME"] = input("MOTHER'S NAME: ")
    row["FATHER'S NAME"] = input("FATHER'S NAME: ")
    row["QUALIFICATION"] = input("QUALIFICATION: ")
    row["DOB"] = input("DOB: ")
    row["DATE OF RECRUITMENT"] = input("DATE OF RECRUITMENT : ")
    row["MOBILE NUMBER"] = input("MOBILE NUMBER: ")
    row["EMPLOYEE TYPE"] = input("EMPLOYEE TYPE: ")
    row["SALARY"] = int(input("SALARY: "))
    row["BRANCH ID"] = int(input("BRANCH ID: "))

    query= "INSERT INTO EMPLOYEE(EMPLOYEE ID,FIRST NAME,LAST NAME,MOTHER'S NAME,FATHER'S NAME,QUALIFICATION,DOB,DATE OF RECRUITMENT,MOBILE NUMBER,EMPLOYEE TYPE,SALARY,BRANCH ID) VALUES(%d,'%s','%s','%s','%s','%s','%s','%s','%s','%s', %d, %d)" %(row["EMPLOYEE ID"],row["FIRST NAME"],row["LAST NAME"],row["MOTHER'S NAME"],row["FATHER'S NAME"],row["QUALIFICATION"],row["DOB"],row["DATE OF RECRUITMENT"],row["MOBILE NUMBER"],row["EMPLOYEE TYPE"],row["SALARY"],row["BRANCH ID"])
    cur.execute(query)
    con.commit()
    return


def insertbranch():
    global cur
    row = {}
    print("Enter new branch details: ")
    
    row["BRANCH ID"] = int(input("BRANCH ID: "))
    row["LOCATION.STREETNAME"] = input("LOCATION.STREETNAME: ")
    row["LOCATION.CITY"] = input("LOCATION.CITY: ")
    row["LOCATION.DISTRICT"] = input("LOCATION.DISTRICT: ")
    row["LOCATION.STATE"] = input("LOCATION.STATE: ")
    row["PARTNER ID"] =int(input("PARTNER ID: "))

    query = "INSERT INTO BRANCH(BRANCH ID,LOCATION.STREETNAME,LOCATION.CITY,LOCATION.DISTRICT,LOCATION.STATE,PARTNER ID) VALUES('%d','%s','%s','%s','%s', '%d')" %(row["BRANCH ID"],row["LOCATION.STREETNAME"],row["LOCATION.CITY"].row["LOCATION.DISTRICT"],row["LOCATION.STATE"],row["PARTNER ID"])

    cur.execute(query)
    con.commit()
    return

def insertsupplier():
    global cur
    row = {}
    print("Enter new supplier details: ")
    
    row["SUPPLIER ID"] = int(input("SUPPLIER ID: "))
    row["NAME"] = input("NAME: ")
    

    query = "INSERT INTO SUPPLIER(SUPPLIER ID,NAME) VALUES(%d, '%s')" %(row["SUPPLIER ID"],row["NAME"])

    cur.execute(query)
    con.commit()
    return

def deletegood():
    delid=int(input("Enter the Id of the good to be deleted: "))
    query="DELETE FROM GOODS WHERE GOODID=%d" %(delid) 
    try:
        print("intry")
        cur.execute(query)
        con.commit()
        print("good Deleted")

    except Exception as e:
        print("in exception")
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e) 

    return 

def updateemployeesalary():
    cid=int(input("Enter the Id of the employee whose salary is to be updated: "))
    upsa=int(input("Enter the new salary of the employee: "))
    query="UPDATE EMPLOYEE SET SALARY=%d  WHERE EMPLOYEE_ID=%d" %(cid,upsa) 
    try:
        cur.execute(query)
        con.commit()
        print("Salary Updated")
    
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print (">>>>>>>>>>>>>", e) 

    return 

def calculateage():
    print("Good data:")
    cursor = con.cursor()
    sql = "SELECT EMPLOYEE_ID,DOB FROM EMPLOYEE "
    try:
        print(inn)
        cursor.execute(sql)
        result = cursor.fetchall()
        print(result)
        table = PrettyTable()
        table.field_names = ["EMPLOYEE_ID", "AGE"]
        for row in result:
            print(row['DOB'])
        con.commit()
    except:
        con.rollback()

while(1):
    tmp = sp.call('clear',shell=True)
    username = input("Username: ")
    password = input("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                user=username,
                password=password,
                db='SUPERMARKET',
                cursorclass=pymysql.cursors.DictCursor)
        with con:
            cur = con.cursor()
            while(1):
                tmp = sp.call('clear',shell=True)
                print("1. insert a new good")
                print("2. insert a new employee")
                print("3. insert a new branch")
                print("4. insert a new supplier")
                print("5. Delete a good")
                print("6. Update salary of the employee")
                print("7. Display the age of the employees")
                c = int(input("Enter choice> "))
                tmp = sp.call('clear',shell=True)
                if c==1:
                    insertgood()
                elif c==5:
                    deletegood()
                elif c==6:
                    updateemployeesalary()
                elif c==7:
                    calculateage()


    except Exception as e:
        tmp = sp.call('clear',shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        print("ERROR: ",e)
        tmp = input("Enter any key to CONTINUE>")