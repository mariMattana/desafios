class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Bem Vindo ao meusesafios.com')
  end

  def invitation(challenger, invited)
    @challenger = challenger
    @invited = invited

    mail(to: @invited.email, subject: "Novo Desafio de #{@challenger.first_name + " " + @challenger.last_name}")
  end
end
