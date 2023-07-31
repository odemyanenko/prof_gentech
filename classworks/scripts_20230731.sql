-- 0. rename column
db.workers.updateMany({}, { $rename: { "first_name": "firstname" } })

-- 1. create new collections "workers"
use tmp
db.workers.drop
db.createCollection("workers")

-- 2. Заполнить коллекцию workers 5 документами со свойствами id, firstname, lastname, age, position, salary, skills. Используйте следующие данные:
--     1. Inga Petrova, 27, Barista, 1500, [’preparing drinks’, ‘cleaning equipment’] 
--     2. Boris Orlov, 36, Server, 2400, [’taking orders’, ‘suggesting meals’, ‘taking payments’]
--     3. Ivan Demidov, 32, Chef, 3200, [’preparing food’, ‘baking bread’]
--     4. Marina Sidorova, 22, Hostess, 1700, [’greeting guests’, ‘seating guests’, ‘answering phone calls’]
--     5. Olga Ivanova, 43, Sommelier, 2500, [’curating a wine list’, ‘creating wine pairings’]
	
db.workers.insertMany([
{id: 1, firstname: 'Inga', lastname: 'Petrova', age: 27, position: 'Barista', salary: 1500, skills: ['preparing drinks', 'cleaning equipment'] },
{id: 2, firstname: 'Boris', lastname: 'Orlov', age: 36, position: 'Server', salary: 2400, skills: ['taking orders', 'suggesting meals', 'taking payments'] },
{id: 3, firstname: 'Ivan', lastname: 'Demidov', age: 32, position: 'Chef', salary: 3200, skills: ['preparing food', 'baking bread'] },
{id: 4, firstname: 'Marina', lastname: 'Sidorova', age: 22, position: 'Hostess', salary: 1700, skills: ['greeting guests', 'seating guests', 'answering phone calls'] },
{id: 5, firstname: 'Olga', lastname: 'Ivanova', age: 43, position: 'Sommelier', salary: 2500, skills: ['curating a wine list', 'creating wine pairings'] }
])

-- 3. Найти работника с ID равным 3.
db.workers.find({id: 3})
db.workers.find({id: 3}, {firstname: 1, lastname: 1})

-- 4. Найти всех работников, у которых зарплата выше 2000. Вывести имя и зарплату
db.workers.find({salary: {$gt: 2000}}, {firstname: 1, salary: 1})

-- 5. Найти всех работников, у которых зарплата выше 2000 и возраст меньше 40. Вывести имя, зарплату и возраст.
db.workers.find({$and: [{salary: {$gt: 2000}}, {age: {$lt: 40}}]}, {firstname: 1, salary: 1, age: 1})

-- 6. Найти всех работников с зарплатой между 1800 и 2500.
db.workers.find({salary: {$gte: 1800, $lte: 2500}}, {firstname: 1, salary: 1, age: 1})

-- 7. Найти всех работников, возраст которых не равен 27.
db.workers.find({age: {$ne: 27}}, {firstname: 1, salary: 1, age: 1})

-- 8. Найти всех работников, занимающих должность "Barista" или "Chef".
db.workers.find({position: {$in: ['Barista', 'Chef']}}, {firstname: 1, position: 1})

-- 9. Найти всех работников, умеющих "taking orders" и "taking payments".
db.workers.find({skills: {$all: ['taking orders', 'taking payments']}})

-- 10. Найти всех работников, умеющих либо "baking bread" либо "preparing drinks"
db.workers.find({skills: {$in: ['baking bread', 'preparing drinks']}})

-- 11. Найти всех работников, не умеющих "answering phone calls".
db.workers.find({skills: {$ne: 'answering phone calls'}})

-- 12. Найти всех работников,  не умеющих  "baking bread" и "preparing drinks"
db.workers.find({skills: {$nin: ['baking bread', 'preparing drinks']}})

-- 13. change lastname with id = 1 to 'Smit'
db.workers.updateOne(
	{id: 1},
	{$set: {lastname: 'Smit'}}
)

-- 14. Обновить должность работника с ID равным 2 на "Head Server".
db.workers.updateOne(
	{id: 2},
	{$set: {position: 'Head Server'}}
)

-- 15. У пользователя Marina Sidorova заменить возраст на 23.
db.workers.updateOne(
	{firstname: 'Marina', lastname: 'Sidorova'},
	{$set: {age: 23}}
)

-- 16. Установить возраст всех работников с зарплатой выше 2000 равным 35.
db.workers.updateMany(
	{salary: {$gt: 2000}},
	{$set: {age: 35}}
)
db.workers.find({age: 35})

-- 17. mult age on 1.5 with id=2
db.workers.updateMany(
	{id: 2},
	{$mul: {age: 1.5}}
)

-- 18. Увеличить зарплату всех работников на 10%.
db.workers.updateMany(
	{},
	{$mul: {salary: 1.1}}
)

-- 19. add new skills with id=1
db.workers.updateMany(
{id: 1},
{$push: {skills: 'drink milch'}}
)

-- 20. Добавить новый навык "serving desserts" работнику с ID равным 3.
db.workers.updateMany(
	{id: 3},
	{$push: {skills: 'serving desserts'}}
)
db.workers.find({id: 3})

-- 21. Удалить навык "taking payments" у всех работников.
db.workers.updateMany(
	{},
	{$pull: {skills: 'taking payments'}}
)
db.workers.find()

-- 22. Увеличить зарплату работника с ID равным 1 на 300.
db.workers.updateOne(
	{id: 1},
	{$inc: {salary: 300}}
)
db.workers.find({id: 1})

-- 23. Уменьшить всем сотрудникам возраст на 4 года
db.workers.updateMany(
	{},
	{$inc: {age: -4}}
)
db.workers.find()

-- 24. change field 'position' to 'job'
db.workers.updateMany(
	{},
	{$rename: {'position': 'job'}}
)
db.workers.find()
