# Seed basic reference data for local development and test environments.
# These records are created idempotently so the seed can be safely
# executed multiple times.

brands = %w[Polaris Yamaha Honda].map do |name|
  Brand.find_or_create_by!(name: name)
end

categories = %w[Engine Suspension Accessories].map do |name|
  Category.find_or_create_by!(name: name)
end

products_data = [
  {
    name: 'Polaris RZR Belt',
    sku: 'PRZR-BELT',
    price: 49.99,
    brand: brands[0],
    category: categories[0],
    description: 'High quality drive belt for Polaris RZR.'
  },
  {
    name: 'Yamaha Oil Filter',
    sku: 'YAM-OF',
    price: 12.95,
    brand: brands[1],
    category: categories[0],
    description: 'Genuine Yamaha oil filter.'
  },
  {
    name: 'Honda Cargo Rack',
    sku: 'HON-RACK',
    price: 85.50,
    brand: brands[2],
    category: categories[2],
    description: 'Durable rear cargo rack.'
  },
  {
    name: 'Universal Shock Absorber',
    sku: 'UNI-SHOCK',
    price: 120.0,
    brand: brands[1],
    category: categories[1],
    description: 'Adjustable suspension component.'
  },
  {
    name: 'ATV Helmet',
    sku: 'ATV-HELM',
    price: 60.75,
    brand: brands[0],
    category: categories[2],
    description: 'Protective helmet for off‑road riding.'
  }
]

products_data.each do |attrs|
  Product.find_or_create_by!(name: attrs[:name]) do |product|
    product.assign_attributes(attrs)
  end
end
