# setup static pages meta defalut values
['about', 'contact', 'home', 'faq', 'download'].each do |name|
  Metum.create(page_name: name)
# end

# setup frontend translations
['zh-TW', 'en'].each do |locale|
  
  translations = YAML::load_file("#{Rails.root}/config/locales/#{locale}.yml")

  data = translations.values.first.slice('frontend')
  
  data.each do |k1, v1|
    v1.each do |k2, v2|
      v2.each do |k3, v3|
        Translation.create(locale: locale, key: "#{k1}.#{k2}.#{k3}", value: v3)
      end
    end
  end

end