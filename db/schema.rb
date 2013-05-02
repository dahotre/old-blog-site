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

ActiveRecord::Schema.define(:version => 20120322020152) do

  create_table "admins", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "atype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "seed"
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "bio"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "exhibit"
    t.string   "art"
    t.string   "fb_url"
  end

  create_table "citations", :force => true do |t|
    t.string   "link"
    t.string   "citation_title"
    t.string   "author"
    t.integer  "rambling_id"
    t.integer  "programming_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "comment"
    t.string   "commentor"
    t.string   "email"
    t.integer  "rambling_id"
    t.integer  "programming_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "dodTitle"
    t.string   "dodImage"
    t.string   "dodPrice"
    t.string   "dodSave"
    t.string   "buzzTitle"
    t.string   "buzzImage"
    t.string   "buzzPrice"
    t.string   "buzzSave"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programmings", :force => true do |t|
    t.string   "url_title"
    t.string   "title"
    t.text     "html"
    t.integer  "views"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "draft"
  end

  add_index "programmings", ["url_title"], :name => "index_programmings_on_url_title", :unique => true

  create_table "programmings_tags", :id => false, :force => true do |t|
    t.integer "programming_id"
    t.integer "tag_id"
  end

  create_table "ramblings", :force => true do |t|
    t.string   "url_title"
    t.string   "title"
    t.text     "html"
    t.integer  "views"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "draft"
  end

  add_index "ramblings", ["url_title"], :name => "index_ramblings_on_url_title", :unique => true

  create_table "ramblings_tags", :id => false, :force => true do |t|
    t.integer "rambling_id"
    t.integer "tag_id"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.string   "vendor"
    t.text     "affiliate_code"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "affiliate_code_expanded"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "programming_id"
    t.integer  "rambling_id"
    t.string   "remote_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_agent"
    t.boolean  "rec"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wallpapers", :force => true do |t|
    t.string   "url"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width"
    t.integer  "height"
    t.date     "fromDate"
    t.date     "toDate"
    t.string   "copyright_image_url"
    t.string   "copyright_source_url"
    t.string   "story"
  end

  add_index "wallpapers", ["url"], :name => "index_wallpapers_on_url", :unique => true

end
