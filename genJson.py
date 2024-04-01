import json
import string
import random

random_groups = ['Engineer', 'Doctor', 'Accountant', 'Management', 'IT', 'Hostel']

password_key_space = string.ascii_lowercase + string.ascii_uppercase + string.digits + "!@#$%&*"

f = list()
l = list()

class User():
    def __init__(self, f, l, u, p, g):
        self.firstName = f
        self.lastName = l
        self.username = u
        self.password = p
        self.group = g

    def __str__(self):
        return f"First Name = {self.firstName}, Last Name = {self.lastName}, Username = {self.username}, Password = {self.password}, Group = {self.group}"

with open('f.txt', 'r') as ff:
    d = ff.read()
    dd = d.split('\n')
    f = dd

with open('l.txt', 'r') as lf:
    d = lf.read()
    dd = d.split('\n')
    l = dd

def getPassword():
    password = ''
    for i in range(10):
        random_index = random.randrange(0, 69)
        password = password + password_key_space[random_index]

    return password

def genUser(firstname, lastname):
    if len(firstname) > 0 and len(lastname) > 0:
        username = firstname[0] + '.' + lastname
        p = getPassword()
        g = random_groups[random.randrange(0, 6)]
        user = User(firstname, lastname, username, p, g)
        return user

    return None

def genJson(user):
    u = dict()
    u['firstName'] = user.firstName
    u['lastName'] = user.lastName
    u['password'] = user.password
    u['username'] = user.username
    u['group'] = user.group
    return u

final_list = list()

for i in range(200):
    gu = genUser(f[i], l[i])
    if gu:
        final_list.append(genJson(gu))



print(json.dumps(final_list))
