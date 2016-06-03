class MailingList < Sequel::Model(:mailing_list)
  include ASModel
  corresponds_to JSONModel(:mailing_list)

  set_model_scope :global

end
