# setup static pages meta defalut values
['homepage','products','news','categories','contact','faq','about','download','milestones'].each do |name|
  Metum.create(page_name: name)
end

# setup static pages image folders
['home', 'system', 'about'].each do |dir|
  dir_name = "public/images/#{dir}"
  Dir.mkdir(dir_name) unless File.exists?(dir_name)
end

# setup frontend translations
I18n.available_locales.each do |locale|
  translations = YAML::load_file("#{Rails.root}/config/locales/#{locale.to_s}.yml")
  data = translations.values.first.slice('frontend')
  data.each do |k1, v1|
    v1.each do |k2, v2|
      v2.each do |k3, v3|
        Translation.create(locale: locale, key: "#{k1}.#{k2}.#{k3}", value: v3)
      end
    end
  end
end