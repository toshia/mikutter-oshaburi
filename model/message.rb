# -*- coding: utf-8 -*-

module Plugin::Oshaburi
  class Message < Diva::Model
    include Diva::Model::MessageMixin

    register :oshaburi_message, name: "おしゃぶりテキスト"

    field.has :user, Plugin::Oshaburi::User, required: true
    field.string :description, required: true
    field.time :created, required: true
  end
end
