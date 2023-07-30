use tmp
db.createCollection("hwusers")
db.hwusers.insertMany([
  {id: 1, name: 'Anatoliy', age: 28, gender: 'm'},
  {id: 2, name: 'Svetlana', age: 25, gender: 'f'},
  {id: 3, name: 'Nikita', age: 33, gender: 'm'},
  {id: 4, name: 'Olga', age: 22, gender: 'f'},
])
db.hwusers.find({gender: 'f'})
db.hwusers.find({$or: [{gender: 'f'}, {age: {$gt: 30}}]})
db.hwusers.find({name: {$in: ['Anatoliy', 'Dmitriy', 'Olga', 'Semen']}})
db.hwusers.find({id: 3})
db.hwusers.find({age: {$qte: {30, 40}}})
