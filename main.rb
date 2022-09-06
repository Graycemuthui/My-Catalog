require_relative 'modules/app'

puts 'Welcome to My Catalog'

def main
  app = Catalog.new
  app.act_regarding_input
end

main
