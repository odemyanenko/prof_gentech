-- https://western-appeal-39b.notion.site/GenTech-Summary-Aug-30-2023-c5c1531a6e3240caaa8bf391bc07dc35
-- https://github.com/LedenevRoman/070223/pulls

db.videos.drop()

db.videos.insertMany([
    {
        _id: 1,
        title: "Streaming | Aug 30, 2023",
        duration_secs: 60,
        tags: ['fun'],
        author_id: 1,
        created_at: new Date(),
        views: 500
    },
    {
        _id: 2,
        title: "My Birthday",
        duration_secs: 30,
        tags: ['fun'],
        author_id: 2,
        created_at: new Date(),
        views: 1500
    },
    {
        _id: 3,
        title: "Test Video",
        duration_secs: 15,
        tags: ['fun'],
        author_id: 3,
        created_at: new Date(),
        views: 50
    },
    {
        _id: 4,
        title: "My First Video",
        duration_secs: 300,
        tags: ['fun'],
        author_id: 1,
        created_at: new Date(),
        views: 5000
    },
    {
        _id: 5,
        title: "Funny Cats",
        duration_secs: 600,
        tags: ['fun'],
        author_id: 2,
        created_at: new Date(),
        views: 1000
    }
])

-- Задача. Вывести данные о роликах с продолжительностью от 
-- (проекция: `название_ролика`, `имя_автора`, `продолжительность_secs`)

db.videos.aggregate([
    { $match: { duration_secs: { $gte: 300 } } },
    {
        $lookup: { // "подтянуть"
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'author'
        }
    },
    { $unwind: '$author' },
    {
        $project: {
            title: 1,
            author_fullname: '$author.fullname',
            duration_secs: 1,
            _id: 0
        }
    }
])

-- Пример. Вывести один произвольный видео-ролик
db.videos.aggregate([
    {
        $sample: { size: 1 }
    }
])

-- Задача. Вывести среднюю продолжительность видеороли
db.videos.aggregate([
	{
		$group: {
			_id: null,
			avg_duration: {$avg: "$duration_secs"}       
        }
	},
     {
        $project: {            
            _id: 0
        }
    }
])    

-- **Задача. Вывести среднюю продолжительность роликов для каждого автора**
-- (проекция: `имя_автора`, `ср_продложительность_роликов`)

db.videos.aggregate([
	{
		$group: {
			_id: "$author_id",
			avg_duration: {$avg: "$duration_secs"}       
        }
	},
    {
        $lookup: { // "подтянуть"
            from: 'users',
            localField: '_id',
            foreignField: '_id',
            as: 'author'
        }
    },
    { $unwind: '$author' },
    {
        $project: {            
            author_fullname: '$author.fullname',            
            avg_duration: 1,
            _id: 0
        }
    }
])

-- Задача. Вывести юзеров, у которых нет роликов
db.users.aggregate([	
    {
        $lookup: { 
            from: 'videos',
            localField: 'author_id',
            foreignField: '_id',
            as: 'user_video_id'
        }
    },
  {
    -- $match: {videos: []}
    $match: {
      user_video_id: { $size: 0 }   // Отбираем только тех пользователей, у которых нет роликов
    }
  },
  {
    $project: {
      _id: 0,
      username: 1
    }
  }
])