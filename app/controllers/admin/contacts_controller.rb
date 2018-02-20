class Admin::ContactsController < AdminController
  before_action :find_contacts
  require 'yaml'

  def index
    @admin_contacts_en = @admin_contacts.slice('hq_en')
    @admin_contacts_zh = @admin_contacts.except('hq_en')
  end

  def create
    # load
    # @admin_contacts = YAML::load_file("#{Rails.root}/config/contacts.yml")
    
    # write
    data = params[:contacts]
    data.each do |k1, v1|
      v1.each do |k2, v2|
        @admin_contacts[k1][k2] = v2
      end
    end
    
    # store
    File.write("#{Rails.root}/config/contacts.yml", @admin_contacts.to_yaml)

    redirect_back(fallback_location: request.referrer)
  end

  private
  
  def find_contacts
    @admin_contacts = YAML::load_file("#{Rails.root}/config/contacts.yml")
  end

end