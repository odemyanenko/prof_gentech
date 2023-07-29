db.workers.find({ last_name: "Ivanova" })
db.workers.find()

db.workers.find({ last_name: /a$/i })

https://www.w3resource.com/javascript/object-property-method/creating-regular-expression.php

db.workers.find({ last_name: "Ivanova", first_name: "Olga" })

db.workers.find({ $or: [ { first_name: "Olga" }, { last_name: "Ivanova" } ] })

db.workers.find({ age: 35 })
db.workers.find({ age: { $gt: 30 } })
db.workers.find({ age: { $lt: 30 } })

db.workers.find({ age: { $lte: 32 } })
db.workers.find({ age: { $gte: 20, $lte: 33 } })

db.workers.find({ age: { $not: { $gte: 20, $lte: 33 } } })
db.workers.find({ first_name: { $not: { $eq: "Olga" } } })

-- 1. найти все рестораны из района Bronx
db.restaurants.find({borough: "Bronx"})

-- 2. найти все рестораны, название которых начинается на Wii
db.restaurants.find({ name: /Wii/i })
db.restaurants.find({ name: { $regex: '^Wii' , $options: 'i'} })
db.restaurants.find({ name: /Wi/i }, {name: true, borough: true, cuisine: true})
db.restaurants.find({ name: /Wii/i }, {name: false})

-- 3. вывести restaurant_id, name, borough у ресторанов, 
--    имя которых заканчивается на ces
db.restaurants.find({ name: /ces$/i }, {restaurant_id: true, name: true, borough: true})

-- 4. вывести name и cuisine у ресторанов, в названии которых есть буквосочетание "reg"
db.restaurants.find({ name: /reg/i}, {name: true, cuisine: true})
db.restaurants.find({ name: /reg/i }, { _id: 0, name: 1, cuisine: 1 })

--
db.restaurants.find({ "address.street": "Morris Park Ave" })
db.restaurants.find({ "address.coord.1": 40.848447 })

-- 5. найти все рестораны, у которых долгота меньше чем -95.754168
db.restaurants.find({ "address.coord.0": { $lt:  -95.754168 } })

-- 6. найти name, cuisine и borough ресторанов, которые готовят 
--    НЕ "American " кухню и расположены на широте меньше, 
--    чем -65.754168
db.restaurants.find({cuisine: {$not: {$eq: "American "}},  "address.coord.0": { $lt:  -65.754168 } }, {_id:0, name: 1, cuisine: 1, borough: 1})
db.restaurants.find({cuisine: {$not: {$eq: "American "}},  "address.coord.0": { $lt:  -65.754168 } }, {_id:0, name: 1, cuisine: 1, borough: 1}).count()

-- 7. найти name borough и cuisine у ресторанов, 
--    которые расположены в Bronx и подают или "American " или Chinese кухню
db.restaurants.find({$or: [{cuisine: "American "}, {cuisine: "Chinese"}], borough: "Bronx"}, {_id:0, cuisine: 1, borough: 1})
db.restaurants.find({ borough: "Bronx", cuisine: { $in: [ "American ", "Chinese" ] } })

-- 8. посчитать сколько ресторанов расположено в Bronx, Staten Island, Queens и Brooklyn
db.restaurants.find({borough: { $in: [ "Bronx", "Staten Island", "Queens", "Brooklyn"] } }).count()
