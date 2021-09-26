# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# INSERT INTO `sheets` VALUES(1, 1, 'a'), (2, 2, 'a'), (3, 3, 'a'), (4, 4, 'a'), (5, 5, 'a'), (6, 1, 'b'), (7, 2, 'b'), (8, 3, 'b'), (9, 4, 'b'), (10, 5, 'b'), (11, 1, 'c'), (12, 2, 'c'), (13, 3, 'c'), (14, 4, 'c'), (15, 5, 'c');
sheets = Sheet.create([{ id: 1, column: 1, row: "a" }, { id: 2, column: 2, row: "a" }, { id: 3, column: 3, row: "a" }, { id: 4, column: 4, row: "a" }, { id: 5, column: 5, row: "a" }, { id: 6, column: 1, row: "b" }, { id: 7, column: 2, row: "b" }, { id: 8, column: 3, row: "b" }, { id: 9, column: 4, row: "b" }, { id: 10, column: 5, row: "b" }, { id: 11, column: 1, row: "c" }, { id: 12, column: 2, row: "c" }, { id: 13, column: 3, row: "c" }, { id: 14, column: 4, row: "c" }, { id: 15, column: 5, row: "c" }])
