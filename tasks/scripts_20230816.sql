-- https://western-appeal-39b.notion.site/GenTech-Summary-Aug-16-2023-49ef99ed6a894ac5ab3746be93486955

use network

-- Задача. Добавить пять транзакций
db.transactions.insertMany([
    { _id: 1, sender_id: 1, recipient_id: 2, amount: 20, currency: 'eur', is_completed: true },
    { _id: 2, sender_id: 2, recipient_id: 1, amount: 80, currency: 'usd', is_completed: true },
    { _id: 3, sender_id: 3, recipient_id: 2, amount: 10, currency: 'eur' },
    { _id: 4, sender_id: 1, recipient_id: 1, amount: 180, currency: 'usd', is_completed: true },
    { _id: 5, sender_id: 1, recipient_id: 2, amount: 48, currency: 'eur' }
])

-- **Задача. Вывести все транзакции**
db.transactions.find()
db.transactions.aggregate()

-- **Задача. Вывести `USD`-транзакции**
db.transactions.aggregate([
	{$match: {currency: "usd"}}
])

-- **Задача. Вывести одну самую большую `EUR`-транзакцию**
db.transactions.aggregate([
	{$match: {currency: "eur"}},
    {$sort: {amount: -1}},
    {$limit: 1}
])

-- Задача. Вывести транзакцию, которая на втором месте по размеру среди транзакций до 1000 EUR
db.transactions.aggregate([
    {
        $match: {
            currency: 'eur',
            amount: { $lte: 1000 }
        }
    },
    { $sort: { amount: -1 } },
    { $skip: 1 },
    { $limit: 1 }
])
