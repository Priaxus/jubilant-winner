# 11LA - Fabricating Random Data & Using SQLAlchemy

## SQLAlchemy Example:

```python
from sqlalchemy import Column, ForeignKey, Integer, String, Text, Numeric
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, sessionmaker

Base = declarative_base()

class Product(Base):
    __tablename__ = 'products'
    prod_id = Column(String, primary_key=True)
    prod_name = Column(String)
    prod_desc = Column(String)
    prod_type = Column(String)
    prod_cost = Column(Numeric)

engine = create_engine('postgresql://dbuser:dbpass@localhost/dbname')
Base.metadata.create_all(engine)

Base.metadata.bind = engine

DBSession = sessionmaker(bind = engine)
session = DBSession()

prod1 = Product(prod_id='SW-001', prod_name='Switch-8', prod_desc='8 port 10Gb Switch', prod_type = 'Switch', prod_cost = 100.00)
prod2 = Product(prod_id='SW-002', prod_name='Switch-24', prod_desc='24 port 10Gb Switch', prod_type = 'Switch', prod_cost = 250.00)
prod3 = Product(prod_id='SW-003', prod_name='Switch-48', prod_desc='48 port 10Gb Switch', prod_type = 'Switch', prod_cost = 1600.00)
prod4 = Product(prod_id='FW-001', prod_name='Firewall-100x', prod_desc='Branch firewall', prod_type = 'Firewall', prod_cost = 650.00)

session.add(prod1)
session.add(prod2)
session.add(prod3)
session.add(prod4)
session.commit()
```