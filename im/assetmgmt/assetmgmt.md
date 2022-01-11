### Create `asset_mgmt` db
```
sudo su - postgres
psql
```

```sql
CREATE DATABASE asset_mgmt OWNER csc;
```

### Create `connect.py`
```python
from sqlalchemy import Column, ForeignKey, Integer, String, Text, Numeric
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, sessionmaker

Base = declarative_base()

# Table definition with column types
class HR(Base):
    __tablename__ = 'hr_emp_details'
    emp_corp_id = Column(String, primary_key=True)
    emp_photo_id = Column(String)
    emp_forename = Column(String)
    emp_surname = Column(String)
    emp_salary = Column(Numeric)

# Connection string to database
engine = create_engine('postgresql://csc:csc@localhost/asset_mgmt')

Base.metadata.create_all(engine)
Base.metadata.bind = engine

# Start a session on the database
DBSession = sessionmaker(bind = engine)
session = DBSession()

# Data for the 'products' table
hr = HR(emp_corp_id='E1', emp_photo_id='P1', emp_forename='Stan', emp_surname = '(the) Man', emp_salary = 100.00)


# Adding the data
session.add(hr)


# Committing the changes
session.commit()
```

```
python3 connect.py
```

## Creating query.py

```python
from sqlalchemy import Column, ForeignKey, Integer, String, Text, Numeric
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, sessionmaker
from connect import HR

Base = declarative_base()

# Connection string to database
engine = create_engine('postgresql://csc:csc@localhost/asset_mgmt')

class HR(Base):
    __tablename__ = 'hr_emp_details'
    emp_corp_id = Column(String, primary_key=True)
    emp_photo_id = Column(String)
    emp_forename = Column(String)
    emp_surname = Column(String)
    emp_salary = Column(Numeric)

Base.metadata.create_all(engine)
Base.metadata.bind = engine

# Start a session on the database
DBSession = sessionmaker(bind = engine)
session = DBSession()

def query():
    return session.query(HR)
    
for e in query():
    print(e.emp_corp_id, e.emp_forename)
```