use students

db.createCollection('students')

db.students.find()

-- Найти всех студентов из города Berlin
db.students.aggregate([
	{$match: {ciry: "Berlin"}}
])

db.students.find({ciry: "Berlin"})

-- rename
db.students.updateMany({}, { $rename: { "ciry": "city" } })

db.students.find({city: "Berlin"}, {first_name: 1, last_name: 1})

-- Найти студентов с возрастом младше 22 лет
db.students.aggregate([
	{$match: {
		age: {$lt: 22}
        }
	}
])
db.students.find({age: {$lt: 22}})

-- Найти студентов с возрастом не более 22 лет и с оценкой выше 4:
db.students.aggregate([
	{$match: {
		age: {$lt: 22},
        marks: {$gt: 4}
        }
	},
    {$project: {
		first_name: 1, last_name: 1, age: 1, marks: 1
    }}    
])

db.students.find({age: {$lt: 22}, marks: {$gt: 4}}, {first_name: 1, last_name: 1, age: 1, marks: 1})

-- Найти студентов с именем "Анна" или "Иван"
db.students.aggregate([
	{$match: {
		first_name: {$in: ['Анна', 'Иван']}
        }
	},
    {$project: {
		first_name: 1, last_name: 1
    }}    
])

db.students.find({first_name: {$in: ['Анна', 'Иван']}}, {first_name: 1, last_name: 1})

-- Найти студентов из города New-York с возрастом от 20 до 23 лет (включительно)
db.students.aggregate([
	{$match: {
		city: "New-York",
		age: {$gte: 20, $lte: 23} 
        }
	},
    {$project: {first_name: 1, last_name: 1, age: 1, city: 1}}    
])

db.students.find(
	{city: "New-York", age: {$gte: 20, $lte: 23} }, 
    {first_name: 1, last_name: 1, age: 1, city: 1}
)

-- Вывести студентов из Нью-Йорка, у которых возраст не входит в диапазон от 20 до 23 (концы исключаем)
db.students.aggregate([
	{$match: {
		city: "New-York",
		age: {$not: {$gte: 20, $lte: 23}}
        }
	},
    {$project: {
		first_name: 1, last_name: 1, age: 1, city: 1
    }}    
])

db.students.find(
	{city: "New-York", age: {$not: {$gt: 20, $lt: 23}}}, 
    {first_name: 1, last_name: 1, age: 1, city: 1}
)

-- Найти студентов у которых есть оценка ниже 4 и городом не Berlin:
db.students.aggregate([
	{$match: {
		city: {$ne: "Berlin"},
		marks: {$lt: 4}
        }
	},
    {$project: {
		first_name: 1, last_name: 1, city: 1, marks: 1
    }}    
])

db.students.find(
	{city: {$ne: "Berlin"}, marks: {$lt: 4}}, 
    {first_name: 1, last_name: 1, city: 1, marks: 1}
)

-- Вывести имя и фамилию студентов, у которых оценки только 5 и 4
db.students.aggregate([
	{$match: {		
		marks: {$elemMatch: {$in: [6, 7]}}
        }
	},
    {$project: {
		first_name: 1, last_name: 1, city: 1, marks: 1
    }}    
])

-- $all
db.students.find(
	{marks: {$all: [4, 5]}}, 
    {first_name: 1, last_name: 1, city: 1, marks: 1}
)

db.students.aggregate([
	{$group: {
		_id: "$gender", 
        avgAge: {$avg: "$age"}
        }
	}
])

-- Найдите самого старшего студента в каждом городе
db.students.aggregate([
	{$group: {
		_id: "$city", 
        maxAge: {$max: "$age"}
        }
	}
])

db.students.aggregate([
	{$match: 
		{city: "New-York"}
	},
	{$group: {
		_id: null, 
        maxAge: {$max: "$age"}
        }
	}
])

-- Найти средний возраст студентов в каждом городе у которых в оценках встречаются тройки
db.students.aggregate([
	{$match: 
		{marks: 3}
	},
	{$group: {
		_id: "$city", 
        maxAge: {$max: "$age"}
        }
	}
])

-- Найти сумму возрастов у каждого пола
db.students.aggregate([	
	{$group: {
		_id: "$gender", 
        sumAge: {$sum: "$age"}
        }
	}
])

-- Найти кол-во студентов каждого пола
db.students.aggregate([	
	{$group: {
		_id: "$gender", 
        count: {$sum: 1}
        }
	}
])

db.students.aggregate([	
	{$project: {
			first_name: 1,
            last_name: 1,
            avgMark: {$avg: "$marks"}
		}
    }	
])

-- Для каждого студента найти максимальную, минимальную и среднюю оценку
db.students.aggregate([	
	{$project: {
			first_name: 1,
            last_name: 1,
            avgMark: {$avg: "$marks"},
            minMark: {$min: "$marks"},
            maxMark: {$max: "$marks"}
		}
    }	
])

db.students.aggregate([	
	{$project: {
			first_name: 1,
            last_name: 1,
            avgMark: {$avg: "$marks"},
            minMark: {$min: "$marks"},
            maxMark: {$max: "$marks"},
            marksStats: {
				avgMark: {$avg: "$marks"}
            }
		}
    }	
])

db.students.aggregate([	
	{$project: {
			first_name: 1,
            last_name: 1,
            marksStats: {
				avgMark: {$avg: "$marks"},
				minMark: {$min: "$marks"},
				maxMark: {$max: "$marks"}
            }
		}
    }	
])



