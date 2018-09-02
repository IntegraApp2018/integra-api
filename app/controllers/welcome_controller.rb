class WelcomeController < ApplicationController
  def index
    @text_field = <<-HEREDOC

    Receber o index dos cards idéias
    GET    /ideas

    Receber o index dos cards ações
    GET    /actions

    Criar um novo card
    POST   /cards
    parametros
      title,
      description,
      people_interested,
      category_id,
      people_needed,
      time,
      location,
      owner_id

    Receber informações de um card específico
    GET    /cards/:id

    Adicionar +1 a quantidade de pessoas interessadas no card
    POST   /cards/:id/add_people

    Criar uma nova categoria
    POST   /categories
    parametros:
      name

    Receber um array com todas categorias (como nome e id para o select, a form de criar um card envia só o ID da categoria)
    GET    /categories/list

    Criar um usuário (Vai retornar o usuário criado com ID dele, se tiver como guarda esse ID dele)
    POST   /users
    parametros:
      name,
      email,
      password

    Receber os participantes de um card
    GET    /cards/:card_id/participants

    Adicionar um participante a um card (precisa do ID de um usuário que foi criado)
    POST   /cards/:card_id/participants
    parametros:
      user_id
      
    HEREDOC
  end
end
