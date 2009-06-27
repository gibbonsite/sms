# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090624201223) do

  create_table "acl_actions", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acl_actions_roles", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "acl_action_id"
  end

  create_table "class_rooms", :force => true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_rooms_subjects", :id => false, :force => true do |t|
    t.integer "class_room_id"
    t.integer "subject_id"
  end

  create_table "lesson_times", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "blocked"
    t.string   "parent_email"
    t.integer  "parent1_id"
    t.integer  "parent2_id"
    t.string   "home_address"
    t.integer  "student_group_id"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "schedule_items", :force => true do |t|
    t.integer  "week_day"
    t.integer  "lesson_time_id"
    t.integer  "student_group_id"
    t.integer  "subject_id"
    t.integer  "class_room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_groups", :force => true do |t|
    t.integer  "year"
    t.string   "letter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "hours_per_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_subjects", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.integer  "student_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
