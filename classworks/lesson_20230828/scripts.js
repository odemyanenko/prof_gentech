use tmp
db.createCollection('developers')
db.developers.insertMany(
[
 {
  "title" : "Eugene Suleimanov",
  "specialty" : "Java",
  "skills" : [
   "Java",
   "Hibernate",
   "Spring"
  ],
  "salary" : 3500
 },
 {
  "title" : "Ivan Ivanov",
  "specialty" : "Java",
  "skills" : [
   "Java",
   "Hibernate",
   "Spring"
  ],
  "salary" : 3500
 },
 {
  "title" : "Nikolay Nikolaev",
  "specialty" : "C++",
  "skills" : [
   "C++",
   "STL",
   "SQL"
  ],
  "salary" : 3500
 }
])

db.developers.aggregate([{$group: {_id: "$specialty", total_salary: {$sum: "$salary"}}}])

db.students.insertMany([
  {
    "first_name": "Анна",
    "last_name": "Иванова",
    "age": 20,
    "gender": "f",
    "city": "Berlin",
    "marks": [5, 4, 6, 7, 3]
  },
  {
    "first_name": "Петр",
    "last_name": "Смирнов",
    "age": 22,
    "gender": "m",
    "city": "Bremen",
    "marks": [6, 6, 5, 7, 4]
  },
  {
    "first_name": "Елена",
    "last_name": "Морозова",
    "age": 21,
    "gender": "f",
    "city": "New-York",
    "marks": [7, 7, 6, 6, 7]
  },
  {
    "first_name": "Иван",
    "last_name": "Козлов",
    "age": 23,
    "gender": "m",
    "city": "Berlin",
    "marks": [4, 5, 3, 4, 6]
  },
  {
    "first_name": "Мария",
    "last_name": "Петрова",
    "age": 20,
    "gender": "f",
    "city": "Bremen",
    "marks": [7, 6, 7, 7, 5]
  },
  {
    "first_name": "Алексей",
    "last_name": "Соколов",
    "age": 22,
    "gender": "m",
    "city": "New-York",
    "marks": [3, 4, 3, 5, 2]
  },
  {
    "first_name": "Анна",
    "last_name": "Михайлова",
    "age": 21,
    "gender": "f",
    "city": "Berlin",
    "marks": [6, 7, 5, 6, 7]
  },
  {
    "first_name": "Дмитрий",
    "last_name": "Волков",
    "age": 23,
    "gender": "m",
    "city": "Bremen",
    "marks": [4, 5, 4, 3, 6]
  }
]);

db.developers.aggregate([{$group: {_id: "$specialty", total_salary: {$sum: "$salary"}}}])

-- найти средний возраст студентов для каждого пола
db.students.aggregate([
	{$group: {
		_id: "$gender", 
		avg_age: {$avg: "$age"}}
	}
])

db.developers.aggregate([
	{$group: {
		_id: "$specialty", 
        first_developer: {$first: "$title"}
        }
	}
])

-- написать запрос, который выводит название города и имя первого студентв и имя последнего
db.students.aggregate([
	{$group: {
		_id: "$city", 
		first_student: {$first: "$last_name"},
		last_student: {$last: "$last_name"}
        }
	}
])

db.students.aggregate([
	{$group: {
		_id: "$city", 
		first_student: {
			$first: {first_name: "$first_name", last_name: "$last_name"}
            },
		last_student: {
			$last: {first_name: "$first_name", last_name: "$last_name"}			
            }
        }
	}
])

-- написать запрос, который выводит название пола имя первого студента данного пола фамилию первого студента данного пола
db.students.aggregate([
	{$group: {
		_id: "$gender", 
		first_student: {$first: "$first_name"},
		last_student: {$last: "$last_name"}
        }
	}
])

db.developers.aggregate([
	{
    $project: {
		_id: 1,
        title: 1,
        specialty: 1,
        first_skills: {$first: "$skills"}
		}
    }	
])

-- вывести имя и фамилию студента и его максимальную оценку
db.students.aggregate([
	{
    $project: {
		_id: 1,
        first_name: 1,
        last_name: 1,
        max_mark: {$max: "$marks"}
		}
    }	
])

-- вывести имя и фамилию студента и его максимальную, минимальную и среднюю оценку
db.students.aggregate([
	{
    $project: {
		_id: 0,
        first_name: 1,
        last_name: 1,
        max_mark: {$max: "$marks"},
        min_mark: {$min: "$marks"}
		}
    }	
])

db.developers.aggregate([
	{
    $match: {
		specialty: "Java"
		}	
	}
])

-- вывести студенток у которых возраст не более 21
db.students.aggregate([
	{
    $match: {
		gender: "f",
        age: {$lte: 21}
		}	
	}
])

-- добавить project и вывести только имя, фамилию, пол и возраст
db.students.aggregate([
	{
    $match: {
		gender: "f",
        age: {$lte: 21}
		}	
	},
    {
    $project: {
		_id: 0,
        first_name: 1,
        last_name: 1,
        gender: 1,
        age: 1
		}
    }
])

db.developers.aggregate([{
  $project: {
    _id: 1, 
    title: 1,
    specialty: 1,
    first_skill: {$first: "$skills"}
  }
},
{
	$match: {
		first_skill: 'Java'
    }
}])

-- вывести имя и фамилию и среднюю оценку студентов, у которых средняя оценка больше 5.5
db.students.aggregate([
{
  $project: {
    _id: 0, 
    first_name: 1,
    last_name: 1,
    avg_mark: {$avg: "$marks"}
  }
},
{
	$match: {
		avg_mark: {$gt: 5.5}
    }
}
])

-- вывелите имя и фамилию и суммарную оценку у студентов, у которых суммарная оценка равна 33
db.students.aggregate([
{
  $project: {
    _id: 0, 
    first_name: 1,
    last_name: 1,
    sum_mark: {$sum: "$marks"}
  }
},
{
	$match: {
		sum_mark: 33
    }
}
])

db.developers.aggregate([
{
	$sort: {title: 1}
}
])

-- вывести студентов в порядке убывания их возраста (9 -> 0)
db.students.aggregate([
{
	$sort: {age: -1}
}
])

-- вывести студентов в порядке убывания их возраста (9 -> 0) вывести имя, фамилию и возраст
db.students.aggregate([
{
	$sort: {age: -1}
},
{
  $project: {
    _id: 0, 
    first_name: 1,
    last_name: 1,
    age: 1
  }
}
])
