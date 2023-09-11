-- https://western-appeal-39b.notion.site/GenTech-Summary-Sep-6-2023-3e7b223b270246b3b49a6ef3848b57c7

-- Задача. Вывести статистику по видео(`ср_продолжительность`, `к_во_видеороликов`)
db.videos.aggregate([
    {
        $group: {
            _id: null,
            avg_duration: {$avg: "$duration_secs"},
            count: { $count: {}}
        }
    },
    {
        $project: {
            _id: 0
        }
    }
])

-- **Задача. Вывести самое короткое видео** (проекции: `название`, `продолжительность`)
db.videos.aggregate([
    {
	$sort: {duration_secs: 1}
    },
    { 
		$limit: 1 
	},
    {
        $project: {
            _id: 0,
            title: 1,
            duration_secs: 1
        }
    }
])

-- Задача. Увеличить баланс всех незаблокированных юзеров на 15%
db.users.updateMany(
	{is_blocked: {$ne: true}},
	{$mul: {balance: 1.25}}	
)

-- Задача. Увеличить баланс всех юзеров из Germany и USA на 100
db.users.updateMany(
	{country: {$in: ["Germany", "USA"]} },
	{$inc: {balance: 100}}
)

