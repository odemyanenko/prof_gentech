-- show dbs
-- use db
-- show dbs
-- db.createCollections('posts')
-- show collections
-- db.posts.insertOne({"title": "Post 1", "text": 'text 1'})
-- db.posts.find()
-- db.posts.insertMany([{"title": "Post 1", "text": 'text 1'}, {"title": "Post 2", "text": 'text 2'}, {"title": "Post 3", "text": 'text 3'}])
-- db.posts.find()

-- Задача 1

-- 1. В рамках базы данных db
-- Создать коллекцию users и заполнить документами (4 штуки) со следующими свойствами (id, name, age, gender). Используйте следующие данные:
--  
-- 1 Анатолий 28 m
-- 2 Светлана 25 f
-- 3 Никита 33 m
-- 4 Ольга 22 f

-- Задача 2
-- Создать коллекцию vegetables и заполнить документами со следующими свойствами: id, title, price, count, country. 
-- Используйте следующие данные:
--  
-- 1 Potato 370 5 Germany
-- 2 Onion 320 3 Poland
-- 3 Tomato 210 9 Spain
-- 4 Carrot 280 4 France

-- 1) Вывести данные о всех представительницах женского пола
-- db.users.find({gender: "f"})
-- 2) Вывести пользователей в возрасте до 30 (включительно)
-- db.users.find({age : {$lte: 30}})