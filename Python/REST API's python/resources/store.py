from db import db

class StoreModel(db.Model):
    _tablename_ = "stores"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(90), unique=True, nullable=False)
    items = db.relationship("ItemModel", back_populates="store", lazy="dynamic")