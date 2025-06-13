# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Basic seed data for local testing

yamaha = Brand.find_or_create_by!(name: "Yamaha")
honda  = Brand.find_or_create_by!(name: "Honda")

engines     = Category.find_or_create_by!(name: "Engine")
suspension  = Category.find_or_create_by!(name: "Suspension")

Product.find_or_create_by!(name: "Shock Absorber") do |p|
  p.sku = "SH-001"
  p.price = 199.99
  p.description = "Demo product for testing"
  p.brand = yamaha
  p.category = suspension
end

Product.find_or_create_by!(name: "Oil Filter") do |p|
  p.sku = "OF-100"
  p.price = 29.99
  p.description = "Demo product for testing"
  p.brand = honda
  p.category = engines
end

