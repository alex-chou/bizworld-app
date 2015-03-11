# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150309014013) do

  create_table "classroom_students", :force => true do |t|
    t.integer "classroom_id"
    t.integer "student_id"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.string   "program"
    t.string   "class_type"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "teacher_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "students", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "ethnicity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "student_id"
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "school_name"
    t.string   "city"
    t.string   "state"
    t.string   "email"
    t.string   "username"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
