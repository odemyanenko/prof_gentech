use tmp
-- 1. Создать коллекцию users и заполнить документами (4 штуки) со следующими свойствами (id, name, age, gender).
db.createCollection("hwusers")
db.hwusers.insertMany([
  {id: 1, name: 'Anatoliy', age: 28, gender: 'm'},
  {id: 2, name: 'Svetlana', age: 25, gender: 'f'},
  {id: 3, name: 'Nikita', age: 33, gender: 'm'},
  {id: 4, name: 'Olga', age: 22, gender: 'f'},
])

-- 2. Вывести данные о всех представительницах женского пола
db.hwusers.find({gender: 'f'})

-- 3. Вывести данные о всех представительницах женского пола и людях старше 30 лет
db.hwusers.find({$or: [{gender: 'f'}, {age: {$gt: 30}}]})

-- 4. Вывести всех пользователей, у которых имя входит в список (Анатолий, Дмитрий, Ольга, Семен)
db.hwusers.find({name: {$in: ['Anatoliy', 'Dmitriy', 'Olga', 'Semen']}})

-- 5. Вывести пользователя с идентификатором 3
db.hwusers.find({id: 3})

-- 6. Вывести пользователей в возрасте от 30 до 40 (включая концы)
db.hwusers.find({age: {$gte: 30, $lte: 40}})






