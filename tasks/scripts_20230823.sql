-- https://western-appeal-39b.notion.site/GenTech-Summary-Aug-23-2023-a3b90ba596114d4c816309007e445fa5

use network

-- Пример. Найти средний размер ТХ для каждой валюты
db.transactions.aggregate([
	{$group: {
		_id: '$currency',
        avg_amount: {$avg: "$amount"}
        }
	}	
])

-- Задача. Вывести ко-во завершенных транзакций для каждой валюты
db.transactions.aggregate([
	{$match: {
		is_completed: true
        }
	},
	{$group: {
		_id: '$currency',
        count: {$sum: 1}        
        }
	}	
])

-- Задача. Вывести самую большую USD-транзакцию (проекция: сумма)
db.transactions.aggregate([
    { $match: { currency: "usd" } },
    { $sort: { amount: -1 } },
    { $limit: 1 },
    { $project: { amount: 1, _id: 0 } }
]);

db.transactions.aggregate([
	{$match: {
		currency: 'usd'
        }
	},
	{$group: {
		_id: null,
        max: {$max: "$amount"}       
        }
	},
    {$project: { 
		max: 1, 
        _id: 0 
        } 
	}
])
