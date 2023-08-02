-- Пример. Добавить юзеров
use network
db.users.insertMany([
{_id: 1, fullname: "user1", country: "Germany"},
{_id: 2, fullname: "user2", country: "USA"},
{_id: 3, fullname: "user3", country: "China"}
])

-- Задача. Вывести юзеров из China
db.users.find({country: "China"})

-- Задача. Вывести юзеров не из China
db.users.find({country: {$ne: "China"}})

-- Задача. Заблокировать юзеров из China
db.users.updateMany(
	{country: "China"},
	{$set: {isBanned: true}}
)
db.users.updateMany({}, { $rename: { "isBanned": "is_blocked" } })

-- Задача. Вывести имена заблокированных юзеров
db.users.find({is_blocked: true}, {fullname: 1, _id: 0})

-- Задача. Вывести незаблокированных юзеров
db.users.find({is_blocked: {$ne: true}}, {fullname: 1, _id: 0})

-- Задача. Разблокировать всех юзеров
db.users.updateMany(
	{is_blocked: true},
	{$unset: {is_blocked: null}}
)

-- Задача. Добавить произвольный тег юзеру 1
db.users.updateOne(
{_id: 1},
{$addToSet: {tag: "admin"}}
)

