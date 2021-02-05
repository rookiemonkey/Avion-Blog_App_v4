# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
  Article.create( title: "Sample Article #{i}", 
                  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu mauris metus. Nulla viverra mollis sapien non aliquet. Aliquam nec euismod tellus. Nullam rutrum turpis tristique est placerat, eleifend lobortis erat ultrices. Curabitur dictum mollis odio eu lobortis. Integer nec lectus massa. Duis a orci ut turpis faucibus dictum. Etiam finibus aliquam est sit amet venenatis. Aliquam erat volutpat. Duis sodales nunc at pellentesque suscipit.")
end