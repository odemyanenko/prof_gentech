db.listings.aggregate([
    {
        $group: {
            _id: "$property_type",
            bedrooms: {
                $first: "$bedrooms"
            }
        }
    }
])

-- для каждой страны найти самый популярный $property_type. ответ вывести в формате country + property_type
db.listings.aggregate([
    {
        $group: {
            _id: {
                country: "$address.country",
                property_type: "$property_type"
            },
            amount: {
                $sum: 1
            }
        }
    },
    {
        $sort: {
            amount: -1
        }
    },
    {
        $group: {
            _id: "$_id.country",
            property_type: {
                $first: "$_id.property_type"
            }
        }
    },
    {
        $project: {
            property_type: 1,
            _id: 0,
            country: "$_id"
        }
    }
])

-- по статистике, апартаменты с Cable TV стоят на 20% дороже, чем без. установка Cable TV стоит 500 долларов. 
-- Для всех апартаментов, у которых нет Cable TV посчитать, через сколько дней установка окупится. В ответе вывести name + amount_of_days. число дней может быть дробным
db.listings.aggregate([
    {
        $match: {
            amenities: {
                $not: {
                    $elemMatch: {
                        $eq: "Cable TV"
                    }
                }
            }
        }
    },
    {
        $project: {
            _id: 0,
            name: 1,
            amount_of_days: {
                $divide: [
                    500,
                    {
                        $multiply: [
                            "$price", 0.2
                        ]
                    }
                ]
            }
        }
    }
])

-- для каждого уникального хоста вывести его имя и число апартаментов
-- ответ отсортировать по количеству апартментов
db.listings.aggregate([
    {
        $group: {
            _id: {
                host_id: "$host.host_id",
                host_name: "$host.host_name"
            },
            amount: {
                $sum: 1
            }
        }
    },
	{
        $sort: {
            amount: -1
        }
    },
    {
		$project: {
            host_name: "$_id.host_name",
            _id: 0,
            amount: 1
        }
    }
])

-- для каждой страны найти самый дешёвый property_type
db.listings.aggregate([
    {
        $group: {
            _id: {
                country: "$address.country",
                property_type: "$property_type"
            },
            price: {
                $min: "$price"
            }
        }
    },
    {
        $sort: {
            price: 1
        }
    },
    {
        $group: {
            _id: "$_id.country",
            property_type: {
                $first: "$_id.property_type"
            }
        }
    },
    {
        $project: {
            property_type: 1,
            _id: 0,
            country: "$_id"
        }
    }
])

-- для каждой amenities посчитать во скольких апартаментах она встречается
-- вывести ответ в формате amenity + amount
db.listings.aggregate([
    {
        $unwind: "$amenities"
    },
	{
		$group: {
			_id: "$amenities",
            amount: {$count: {}}
        }
    },
    {
		$sort: {amount: -1}
    },
    {
		$project: {
			_id: 0,
			amenity: "$_id",
            amount: 1
        }
    }
]) 

-- предположим, что цена за квартиру складывается из стоимости услуг. например, если цена за квартиру 80$ и в ней 4 amenities, 
-- то каждая услуга приносит по 20 долларов. посчитать среднюю стоимость каждой услуги
db.listings.aggregate([
    {
        $project: {
            _id: 1,
            amenities: 1,
            amenities_copy: "$amenities",
            price: 1
        }
    },
    {
        $unwind: "$amenities"
    },
    {
        $group: {
            _id: "$_id",
            amenities: { $first: "$amenities_copy" },
            price: { $first: "$price" },
            amount: {
                $sum: 1
            }
        }
    },
    {
        $project: {
            _id: 1,
            amenities: 1,
            price_per_amenity: {
                $divide: [ "$price", "$amount" ]
            }
        }
    },
    {
        $unwind: "$amenities"
    },
    {
        $group: {
            _id: "$amenities",
            avg_price: {
                $avg: "$price_per_amenity"
            }
        }
    }
])
-- !!! h/w переписать под проценты

-- для каждого type посчитать число фильмов в нём
db.videos.aggregate([
	{
		$group: {
			_id: "$type",
            count: {$count: {}}
		}
    },
    {
		$project: {
			_id: 0,
			type: "$_id",
            count: 1
        }
    }
])

db.movies.aggregate([
    {
        $group: {
            _id: "$type",
            count: {
                $sum: 1
            }
        }
    }
])

-- для каждого режиссёра найти годы его деятельности. вывести в формате name, start_year, end_year
db.videos.renameCollection("movies")

db.movies.aggregate([
	{
		$unwind: "$directors"
	},
	{
		$group: {
			_id: "$directors",
            start_year: {$min: "$year"},
            end_year: {$max: "$year"}
		}
    },
    {
		$project: {
			_id: 0,
            director: "$_id",
            start_year: 1,
            end_year: 1
        }
    }
])

-- для каждой пары режисер + актёр посчитать количество фильмов, где они вместе. отсортировать по количеству фильмов
db.movies.aggregate([
	{
		$unwind: "$directors"
	},
	{
		$unwind: "$cast"
	},    
	{
		$group: {
			_id: {
				director: "$directors",
                actor: "$cast"
            },
            count: {$count: {}}
		}
    },
	{
		$sort: {count: -1}
    },
    {
		$project: {
			_id: 0,
            director: "$_id.director",
            actor: "$_id.actor",
            count: 1
        }
    }
])