-- db.restaurants.find({ cuisine: "American " }).limit(5)
-- db.restaurants.find({ cuisine: "American " }).limit(5).skip(10)
-- db.restaurants.find({ cuisine: "American " }).limit(5).sort({ "name": -1 })
-- db.restaurants.find({ grades: { $elemMatch: { grade: "C" } } })

-- 1. вывести первые 5 ресторанов из района Bronx
-- db.restaurants.find({ borough: "Bronx" }).limit(5)

-- 2. вывести количество ресторанов, которые хотя бы в одном отзыве получили score >= 90
-- db.restaurants.find({grades: {$elemMatch: {score: { $gte: 90 }} }}).count()

-- 3. посчитать сколько ресторанов готовят НЕ "American " кухню и получили хотя бы в одном отзыве оценку от 50 до 70
-- db.restaurants.find({ cuisine: {$not: {$eq: "American "}}, grades: {$elemMatch: {score: { $gte: 50, $lte: 70}}}} ).count()

-- 4. найти количество ресторанов, которое не получало оценок отличных от A
-- db.restaurants.find({ grades: {$not: {$elemMatch: {grade: { $ne: "A"}}}}} ).count()

-- 5. найти количество всех ресторанов, у которых есть оценка со score: 2 и со score: 6
-- db.restaurants.find({$and: [{grades: {$elemMatch: {score: 2}}}, {grades: {$elemMatch: {score: 6}}}]}).count()

-- 6. найти все рестораны, которые получали score 2 ИЛИ 6
-- db.restaurants.find({grades: {$elemMatch: {score: {$in: [2,6]}}}}).count()

-- 7. посчитать сколько ресторанов расположены в Manhattan или Brooklyn и имеют score > 5
-- db.restaurants.find({grades: {$elemMatch: {score: {$gte: 5}}}, borough: {$in: ["Manhattan", "Brooklyn"]}}).count()

-- 8. посчитать сколько объектов с property_type = "House" имеют Wifi
-- db.listings.find({property_type: "House", amenities: {$elemMatch: {$eq: "Wifi"}}}).count()

-- 9.посчитать сколько объектов с property_type: "House" имеют цену < 150.00
-- db.listings.find({property_type: "House", price: {$lt: 150.00}}).count()


-- 9. посчитать, сколько объектов из Canada имеют Heating в своих amenities
-- db.listings.find({"address.country": "Canada", amenities: {$elemMatch: {$eq: "Heating"}}}).count()

-- 10. Посчитать сколько объектов из USA имеют подтвержденного хоста
-- db.listings.find({"address.country": "United States", "host.host_identity_verified": true}).count()

-- 11. найти количество объектов, в названии которых есть буквосочетание max в любом регистре
-- db.listings.find({name:  /max/i}).count()

-- Homework--------
-- в коллекции restaurants:
-- 1. Найти количество ресторанов НЕ из Bronx, Manhattan или Brooklyn, подающих "American " кухню.
-- 2. Найти все рестораны, которые получали только оценки A и B и вывести их, отсортировав по полю name.
-- 3. Найти количество ресторанов, которые получали только оценки со score < 10.
-- 4. Найти количество ресторанов, расположенных между 42 и 52 долготой включительно. Долгота - второй элемент массива coords.
-- 5. Вывести поля name, cuisine и borough первых 3 ресторанов, название которых начинается на "Mad".