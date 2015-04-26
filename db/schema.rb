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

ActiveRecord::Schema.define(:version => 20150426180717) do

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

  create_table "question_surveys", :force => true do |t|
    t.integer "question_id"
    t.integer "survey_id"
  end

  create_table "questions", :force => true do |t|
    t.string  "question"
    t.string  "answer"
    t.string  "key"
    t.boolean "correct"
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
    t.string   "first_name"
    t.integer  "age"
    t.string   "gender"
    t.string   "ethnicity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "last_name"
    t.string   "school_name"
    t.string   "teacher_name"
    t.string   "state"
    t.integer  "grade"
    t.string   "city_name"
    t.integer  "classroom_id"
  end

  create_table "surveys", :force => true do |t|
    t.string   "survey_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "student_id"
    t.float    "score"
    t.boolean  "master"
    t.integer  "version"
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "school_name"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

end
