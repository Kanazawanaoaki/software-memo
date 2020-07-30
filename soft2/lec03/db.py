db_list = [{'name': 'Okada', 'addr': 'Tokyo'}]

def db_print ():
    for db in db_list:
        print ("{} lives in {}".format(db['name'] ,db['addr']))

def db_insert (name, addr):
    db_list.append({'name': name, 'addr': addr})

def db_search (name):
    for db in db_list:
        if db['name'] == name:
            print ("{} lives in {}".format(db['name'] ,db['addr']))

db_print()
db_insert('Ultraman' ,'M-78')
db_print()
db_search('Okada')

def db_search2(name):
    ret = filter(lambda db: db['name'] == name, db_list)
    if ret:
        db = ret[0]
        db_list.remove(db)
        db_list.insert(0, db)
        print ("{} lives in {}".format(db['name'],db['addr']))
    else:
        print ("{} not found in db".format(name))
    pass

print("- Serach Ultraman")
db_search2('Ultraman')
print("- Print")
db_print()

def db_print2 ():
    for db in sorted(db_list, key=lambda x: x['name']):
        print ("{} lives in {}".format(db['name'] , db['addr']))

print("- Print")
db_print2()
