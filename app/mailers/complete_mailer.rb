class CompleteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.complete_mailer.complete_mail.subject
  #
  def complete_mail
    mail to: '自身のメールアドレス', subject: '注文完了のお知らせ'
  end
end
