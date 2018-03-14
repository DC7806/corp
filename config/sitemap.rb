# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.host_name
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create_index = false
SitemapGenerator::Sitemap.create do  
  I18n.available_locales.each do |locale|
    group(filename: "sitemap-"+locale.to_s) do
      add root_path(locale: locale), lastmod: 1.day.ago, priority: 1, changefreq: 'daily'
      ['products','categories','news','contact','faq','about','download','milestones'].each do |page|
        add "#{locale.to_s}/#{page}", lastmod: 1.month.ago, priority: 0.6, changefreq: 'monthly'
      end
      Product.find_each do |product|
        add product_path(product.permalink, locale: locale), lastmod: 1.week.ago, priority: 0.8, changefreq: 'weekly'
      end
      Category.find_each do |category|
        add category_path(category.permalink, locale: locale), lastmod: 1.month.ago, priority: 0.7, changefreq: 'monthly'
      end
      News.find_each do |news|
        add news_path(news.permalink, locale: locale), lastmod: 1.week.ago, priority: 0.7, changefreq: 'weekly'
      end
    end
  end
end
