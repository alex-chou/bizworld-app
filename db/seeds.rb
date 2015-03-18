# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teacher = Teacher.create(city: 'Berkeley', email: 'cs169-bizworld@bizworld.org', name: 'Armando Fox', school_name: 'UC Berkeley', state: 'CA', username: 'AFox')
teacher.classrooms.create(name: 'MWF 3-4 PM', class_type: '3', program: 'bizworld')
