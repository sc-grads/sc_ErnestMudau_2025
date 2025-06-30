from db import db

class ItemModel(db.Model):
    __tablename__ = "items"
    
    id = db.Column(db.Intiger, primary_key=True)
    name = db.column(db.String(80), unique=True , nullable=False)
    price = db.Column(db.Float(precision=2),unique=False, nullable=False)
    store_id = db.Column(db.Intiger,db.ForeignKey("store.id"), unique=False , nullable=False)
    store = db.relationship("Storemodel", back_populates ="Items")
    #items
    