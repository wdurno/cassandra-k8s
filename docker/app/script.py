from cassandra.cluster import Cluster
from cassandra import ConsistencyLevel 
from cassandra.query import SimpleStatement 
import uuid 

cluster = Cluster(['cassandra'], port=9042) 
session = cluster.connect() 

cmd = '''
CREATE  KEYSPACE IF NOT EXISTS cqlengine  
   WITH REPLICATION = { 
      'class' : 'SimpleStrategy',
      'replication_factor' : 3  
   }
'''
session.execute(cmd)

cmd = '''
CREATE TABLE IF NOT EXISTS cqlengine.person (
    id uuid,
    first_name text,
    last_name text,
    PRIMARY KEY (id)
);
'''
session.execute(cmd)

cmd = '''
INSERT INTO cqlengine.person (id, first_name, last_name) 
VALUES (%s, %s, %s)
IF NOT EXISTS
'''
simple_statement = SimpleStatement(cmd, consistency_level=ConsistencyLevel.ONE) 
session.execute(cmd, (uuid.UUID('c3b6f6f4-8285-11ea-aa41-8a09d96d0573'), 'Kurt', 'Godel')) 

cmd = '''
SELECT * FROM cqlengine.person 
'''
print(session.execute(cmd).one()) 

