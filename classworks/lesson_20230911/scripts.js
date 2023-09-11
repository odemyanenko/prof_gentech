use restaurants

-- найти количество ресторанов, подающих cuisine: "Bakery" в районе "Bronx"
db.restaurants.aggregate([
	{$match: {
		cuisine: "Bakery", 
        borough: "Bronx"
		}
	}
])

db.restaurants.find({
    "cuisine": "Bakery",
    "borough": "Bronx"
}).count()

-- посчитать количество ресторанов, расположенных между 40 и 50 долготой включительно. Долгота - это элемент массива coords с индексом 1
db.restaurants.aggregate([
  {
    $match: {
      "address.coord.1": { $gte: 40, $lte: 50 }
    }
  }
])

db.restaurants.aggregate([
  {
    $match: {
      "address.coord.1": { $gte: 40, $lte: 50 }
    }
  },
    {
    $group: {
      _id: null,
      count: { $sum: 1 }
    }
  }
])

db.restaurants.find({
    "address.coord.1": {
        $gte: 40,
        $lte: 50
    }
}).count()

-- посчитать количество ресторанов, у которых есть хотя бы одна оценка А
db.restaurants.aggregate([
  {
    $match: {
      "grades": {$elemMatch: {grade: "A"}}
    }
  }
])

db.restaurants.aggregate([
  {
    $match: {
      "grades": {$elemMatch: {grade: "A"}}
    }
  },
    {
    $group: {
      _id: null,
      count: { $sum: 1 }
    }
  }
])

db.restaurants.find({
    grades: {
        $elemMatch: {
            grade: "A"
        }
    }
}).count()

-- посчитать количество ресторанов, которые не получали никаких оценок, кроме А
db.restaurants.aggregate([
  {
    $match: {
      "grades": {$not: {$elemMatch: {grade: {$ne: "A"}}}}
    }
  },
    {
    $group: {
      _id: null,
      count: { $count: {}}
    }
  }
])

db.restaurants.find({ grades: {$not: {$elemMatch: {grade: { $ne: "A"}}}}} ).count()
db.restaurants.find({
    grades: {
        $not: {
            $elemMatch: {
                grade: { $ne: "A" }
            }
        }
    }
}).count()

-- для каждого района посчитать число ресторанов  в нём. ответ вывести в формате { borough: <Имя района>, restaurants_count: <количество ресторанов> }
db.restaurants.aggregate([
    {
    $group: {
      _id: "$borough",
      restaurants_count: { $count: {}}
    }
  },
  {
    $project: {
      _id: 0, 
      borough: "$_id", 
      restaurants_count: 1 
    }
  }
])

-- для кажого района посчитать средний рейтинг средних рейтингов ресторанов в нём
db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $group: {
            _id: {
                _id: "$_id",
                borough: "$borough"
            },
            avg_grade: {
                $avg: "$grades.score"
            }
        }
    },
    {
        $group: {
            _id: "$_id.borough",
            avg_grade: {
                $avg: "$avg_grade"
            }
        }
    }
])

-- найти ресторан (имя + borough) с самой высокой средней оценкой
db.restaurants.aggregate([
    {
        $unwind: "$grades"
    },
    {
        $group: {
            _id: {
                _id: "$_id",
                borough: "$borough",
                name: "$name"
            },
            avg_grade: {
                $avg: "$grades.score"
            }
        }
    },
	{
		$sort: {avg_grade: -1}
    },
    { 
		$limit: 1 
	},
  {
    $project: {
      _id: 0, 
      name: "$_id.name", 
      borough: "$_id.borough",    
      avg_grade: 1 
    }
  }
])

-- для всех апартаментов посчитать сколько будет стоить трёхдневное пребывание. 
-- в ответе вывести название апартаментов, цену за ночь, цену уборки и total: цена за трёхдневное проживание + уборка

db.listings.updateMany({ cleaning_fee: { $exists: false } }, { $set: { cleaning_fee: 0 }  })

db.listings.aggregate([
	{
		$project: {
			_id: 0,
            name: 1,
			price: 1,
            cleaning_fee: 1,
            total: {
				$add: [
                {
					$multiply : ["$price", 3]
                },
                "$cleaning_fee"
                ]
            }
		}
	}
])

-- компания из 5 человек ищет жильё на неделю. каждый из них хочет жить в отдельной спальне. найти самый дешёвый вариант не менее чем с 10 отзывами
-- в ответе вывести название объекта + стоимость с человека
db.listings.aggregate([
	{
		$match: {
			"bedrooms": 5,            
			"number_of_reviews": {$gte: 10}
        }
	},
    {
		$project: {
			_id: 0,
            name: 1,
--             price: 1,
--             cleaning_fee: 1,
--             extra_people: 1,
-- 			guests_included: 1,
--             bedrooms: 1,
            total: {
				$add: [
					{$multiply : ["$price", 7]},
                    "$cleaning_fee"
                ]
             }
        }
    },
   	{
		$sort: {total: 1}
    },
    { 
		$limit: 1 
	}
])

db.listings.aggregate([
	{
		$match: {
			"bedrooms": 5,            
			"number_of_reviews": {$gte: 10}
        }
	},
    {
        $project: {
            _id: 0,
            name: 1,
            total: {
                $divide: [{$add: [{$multiply: ['$price', 7]}, '$cleaning_fee']}, 5 ]
            }
        }
    },
   	{
		$sort: {total: 1}
    },
    { 
		$limit: 1 
	}
])

