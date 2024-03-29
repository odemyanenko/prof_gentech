use tmp
db.createCollection("users")
db.users.insertMany([
{id: 1, name: 'Anatoliy', lastname: 'Ivanenko', age: 31}, 
{id: 2, name: 'Maksim', lastname: 'Griboko', age: 33}, 
{id: 3, name: 'Anton', lastname: 'Kulenko', age: 30}
])
db.users.find()
--------
db.createCollections("workers")
db.workers.insertMany([
{id: 1, firstname: 'Petr', lastname: 'Sergeev', position: 'SEO', salary: 7000},
{id: 2, firstname: 'Viktor', lastname: 'Semenov', position: 'Web-developer', salary: 5000},
{id: 3, firstname: 'Nikita', lastname: 'Petrov', position: 'Assistant', salary: 3500},
{id: 4, firstname: 'Inna', lastname: 'Orlova', position: 'Accountant', salary: 4500}
])
db.workers.find()
db.workers.find({firstname: {$eq: 'Viktor'}})
db.workers.find({firstname: 'Viktor'})
db.workers.find({salary: {$gte: 5000}})
db.workers.find({position: {$ne: 'Web-developer'}})
db.workers.find({$or: [{salary: 3500}, {salary: 7000}]})
db.workers.find({$or: [{id: 3}, {position: 'SEO'}]})
------------------------
db.workers.find({$and: [
{salary: {$gt: 3500}}, 
{position: {$ne: 'SEO'}}
]})
====
db.workers.find({
salary: {$gt: 3500}, 
position: {$ne: 'SEO'}
})
------------------------
db.workers.find({salary: {$in: [7000, 3500]}})
db.workers.find({salary: {$nin: [7000, 3500]}})
db.workers.find({position: {$in: ['SEO', 'Web-developer']}})
db.workers.find({id: {$nin: [1, 2, 4]}})
db.workers.find({$or: [{id: {$nin: [1, 2, 4]}}, {salary: 4500}]})
