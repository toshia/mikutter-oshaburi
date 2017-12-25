# -*- coding: utf-8 -*-
require_relative 'model/user'
require_relative 'model/message'

Plugin.create(:oshaburi) do
  tab(:oshaburi_test, "おしゃぶり") do
    timeline :oshaburi_test
  end

  message = Plugin::Oshaburi::Message.new(description: 'hello, World!', created: Time.now, user: Plugin::Oshaburi::User.instance)

  Delayer.new do
    timeline(:oshaburi_test) << message
  end
end
