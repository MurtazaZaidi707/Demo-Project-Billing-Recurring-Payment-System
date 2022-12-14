# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_907_125_738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'features', force: :cascade do |t|
    t.string 'name'
    t.string 'code'
    t.integer 'unit_price'
    t.integer 'max_unit_limit'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'plan_id'
    t.index ['plan_id'], name: 'index_features_on_plan_id'
  end

  create_table 'invoices', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'subscribe_id'
    t.integer 'total_amount'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'status'
    t.date 'billing_date'
    t.integer 'unit_consumed'
    t.index ['subscribe_id'], name: 'index_invoices_on_subscribe_id'
    t.index ['user_id'], name: 'index_invoices_on_user_id'
  end

  create_table 'payments', force: :cascade do |t|
    t.integer 'user_id'
    t.date 'transaction_date'
    t.integer 'subscribe_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'invoice_id'
    t.index ['invoice_id'], name: 'index_payments_on_invoice_id'
    t.index ['subscribe_id'], name: 'index_payments_on_subscribe_id'
    t.index ['user_id'], name: 'index_payments_on_user_id'
  end

  create_table 'plans', force: :cascade do |t|
    t.integer 'monthly_fee'
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource'
  end

  create_table 'subscribes', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'plan_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.date 'billing_date'
    t.index ['plan_id'], name: 'index_subscribes_on_plan_id'
    t.index ['user_id'], name: 'index_subscribes_on_user_id'
  end

  create_table 'usages', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'unit_consumed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'payment_id'
    t.integer 'subscribe_id'
    t.index ['payment_id'], name: 'index_usages_on_payment_id'
    t.index ['subscribe_id'], name: 'index_usages_on_subscribe_id'
    t.index ['user_id'], name: 'index_usages_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'full_name'
    t.string 'type'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end

  add_foreign_key 'subscribes', 'plans'
  add_foreign_key 'subscribes', 'users'
end
