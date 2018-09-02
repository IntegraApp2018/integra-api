# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lucas = User.create(name:"Lucas Silva", email:"lucas@teste.com", password: "123123")
luana = User.create(name:"Luana Souza", email:"luana@teste.com", password: "123123")
leia = User.create(name:"Princesa Leia", email:"leia@teste.com", password: "123123")
yoda = User.create(name:"Mestre Yoda", email:"yoda@teste.com", password: "123123")
anakin = User.create(name:"Anakin Skywalker", email:"anakin@teste.com", password: "123123")

transporte = Category.create(name:"Transporte")
infraestrutura = Category.create(name:"Infraestrutura")
animais = Category.create(name:"Animais")

card = Card.create(
  title:"Carona Solidária",
  description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
  category_id: transporte.id,
  owner_id: lucas.id,
  people_needed: 3,
  time: DateTime.parse("2018-10-10T10:00:00+07:00")
)

card.participants.create(user_id:leia.id)
card.participants.create(user_id:yoda.id)
card.participants.create(user_id:anakin.id)

card = Card.create(
  title:"Pintura do ginásio da escola",
  description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
  category_id: infraestrutura.id,
  owner_id: luana.id,
  people_needed: 2,
  time: DateTime.parse("2018-10-10T10:00:00+07:00")
)

card.participants.create(user_id:leia)
card.participants.create(user_id:yoda)
card.participants.create(user_id:anakin)

card = Card.create(
  title:"Feira de adoção",
  description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit.",
  category_id: animais.id,
  owner_id: luana.id,
  people_needed: 2,
  time: DateTime.parse("2018-10-10T10:00:00+07:00")
)

card.participants.create(user_id:leia)
card.participants.create(user_id:yoda)
card.participants.create(user_id:anakin)
