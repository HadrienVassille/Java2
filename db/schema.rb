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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180219104838) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "posts_count", default: 0
  end

  create_table "meta", force: :cascade do |t|
    t.string "name"
    t.string "mettaable_type"
    t.integer "mettaable_id"
    t.index ["mettaable_type", "mettaable_id"], name: "index_meta_on_mettaable_type_and_mettaable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "slug"
    t.boolean "online", default: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.index ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id"
    t.index ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

end
