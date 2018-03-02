['about', 'contact', 'home', 'faq'].each do |name|
Metum.create(page_name: name)
end


# ['zh-TW', 'en'].each do |locale|
# Translation.create(locale: locale, key: '', value: '')
# end