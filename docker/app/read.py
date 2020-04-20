from cassandra.cluster import Cluster

cluster = Cluster(['cassandra'], port=9042) 
session = cluster.connect() 

cmd = '''
SELECT * FROM cqlengine.person 
'''
print(session.execute(cmd).one()) 

