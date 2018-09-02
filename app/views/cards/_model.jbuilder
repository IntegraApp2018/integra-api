week_day = case card.time.wday
when 0
  "Domingo"
when 1
  "Segunda"
when 2
  "Terça"
when 3
  "Quarta"
when 4
  "Quinta"
when 5
  "Sexta"
when 6
  "Sabado"
end if card.time

month = case card.time.month
when 1
  "Janeiro"
when 2
  "Fevereiro"
when 3
  "Março"
when 4
  "Abril"
when 5
  "Maio"
when 6
  "Junho"
when 7
  "Julho"
when 8
  "Agosto"
when 9
  "Setembro"
when 10
  "Outubro"
when 11
  "Novembro"
when 12
  "Dezembro"
end if card.time

json.(
  card,
  :title,
  :description,
  :people_interested,
  :people_needed,
  :location,
  )

days = (card.to_date - DateTime.now.to_date).to_i rescue 0

json.time do
  json.title      "#{week_day}, #{card.time.day} de #{month}"
  json.hours      card.time.strftime('%H:%M')
  json.remaining  "Em #{days} dias"
end if card.time


json.leader do
  json.id     card.owner_id
  json.name   card.owner.try(:name)
end

json.participants card.participants do |participant|
  json.name   participant.user.name
  json.id     participant.user.id
end

json.materials card.materials do |material|
  json.name         material.name
  json.quantity     material.quantity
end

json.category do
  json.id     card.category.try(:id)
  json.name   card.category.try(:name)
end
