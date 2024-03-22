class UserDecorator < Draper::Decorator
    # delegate_all

    def email_domain 
        email = user.email
        email.slice(0...email.index('@'))
    end
end