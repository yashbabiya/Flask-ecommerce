from flask import Flask, render_template,redirect,request,session,flash
from flask_sqlalchemy import SQLAlchemy
import json
import mysql.connector
local_server = True
app = Flask(__name__)
app.secret_key="super-secret-key"
with open('config.json','r') as c:
    params=json.load(c)["params"]
con=mysql.connector.connect(host="localhost", user="root" , password="yash" ,database="myshop")
cursor=con.cursor()
@app.route('/login',methods=["GET","POST"])
def login():
    if (request.method == "POST"):
        username = request.form.get('uname')
        password = request.form.get('pass')
        cursor.execute("""SELECT * FROM `auth` WHERE `uname` LIKE '{}' AND `pwd` LIKE '{}'""".format(username, password))
        users = cursor.fetchall()

        if (len(users)>0):
            session['user'] = username
            return redirect('/')
        else:
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/signup',methods=["GET","POST"])
def signup():
    if (request.method == "POST"):
        username = request.form.get('uname')
        password = request.form.get('pass')
        cursor.execute("""SELECT * FROM `auth` WHERE `uname` LIKE '{}' AND `pwd` LIKE '{}'""".format(username, password))
        users = cursor.fetchall()
        if(len(users)>0):
            flash('Login into existing account')
            session['user'] = username
            return redirect('/')
        cursor.execute(
            """SELECT * FROM `auth` WHERE `uname` LIKE '{}'""".format(username))
        users = cursor.fetchall()
        if (len(users) > 0):
            flash('User already exists , try another username')
            return redirect('/signup')
        cursor.execute("""Insert into `auth` (`uname`,`pwd`) values('{}','{}')""".format(username, password))
        cursor.execute("""create table `{}` (
        sno int not null auto_increment,
        prod_id int ,
        qty int,
        primary key(sno))""".format(username))
        con.commit()
        session['user'] = username
        return redirect('/')

    return render_template('signup.html')
@app.route('/')
def home():
    cursor.execute("""SELECT * FROM `phones`""")
    data = cursor.fetchall()
    if ('user' in session):
        return render_template('index.html',user=session['user'],prod=data)
    else:
        return redirect('/login')
@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/login')
@app.route('/cart',methods=["GET","POST"])
def cart():
    if ('user' in session):
        usr=session['user']
        cursor.execute("""SELECT * FROM `{}`""".format(usr))
        x=cursor.fetchall()

        return render_template('cart.html',user=session['user'],prod=x)
@app.route('/atc',methods=["GET","POST"])
def atc():
    if ('user' in session):
        if (request.method == "POST"):
            usr=session['user']
            name=request.form.get('name')
            ii=int(request.form.get('id'))
            pr=request.form.get('price')
            cursor.execute("""SELECT * FROM `{}` WHERE `p_id` LIKE '{}'""".format(usr,ii))
            z=cursor.fetchall()
            if(len(z)==0):
                cursor.execute("""Insert into `{}` (`sno`,`p_id`,`name`,`price`,`qty`) values(NULL,'{}','{}','{}',1)""".format(usr,ii,name,pr))
                con.commit()
            return redirect('/')
        pass

@app.route('/rm/<string:no>',methods=["GET","POST"])
def rm(no):
    if ('user' in session):
        if (request.method == "POST"):
            usr=session['user']
            cursor.execute("""delete from `{}` where `sno` like '{}'""".format(usr,no))
            con.commit()
            return redirect('/cart')

@app.route('/carte/<string:no>',methods=["GET","POST"])
def ce(no):
    if('user' in session):
        usr=session['user']
        qq=request.form.get('quantity')
        cursor.execute("""update `{}` set qty='{}' where `sno` LIKE '{}'""".format(usr,qq,no))
        return redirect('/cart')
        
            
            



app.run(debug=True)