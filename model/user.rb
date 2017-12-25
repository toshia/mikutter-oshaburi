# -*- coding: utf-8 -*-

module Plugin::Oshaburi
  class User < Diva::Model
    include Diva::Model::UserMixin

    register :oshaburi_user, name: "おしゃぶりユーザ"

    field.string :username, required: true
    field.string :nodename, required: true

    def self.instance
      new(username: Etc.getlogin, **Etc.uname)
    end

    def name
      "#{username}@#{nodename}"
    end

    def icon
      Skin['list.png']
    end

  end
end
