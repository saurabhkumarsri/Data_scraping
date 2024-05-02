class BusinessesController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

    def index
      all_link.each do |link|
        profile_link = "https://rubyonremote.com/jobs#{link}"
        doc = Nokogiri::HTML(URI.open(profile_link))

        business = []
          doc.css(".hidden a.text-sm:nth-of-type(2)").each do |link|
            web_link = link.attr("href")
            business_name = link.text.to_s.strip
            business << {web_link: web_link, business_name: business_name}
          end


          business_name = []
          doc.css(".schema-job-title").each do |business_name|
            business_name << business_name.text.to_s.strip
          end


          business.each_with_index do |bus, ind|
            data = Business.where(web_link: bus[:web_link]).first_or_create
            data.update({
              web_link: bus[:business_name],
              profile_link: profile_link,
              web_link: bus[:web_link],
              business_name: business_name[ind]
            })
          end
      end
    end

  private
    def all_link
      [ "/34294-founding-engineer-at-scholarly",
        "/34411-senior-ruby-on-rails-react-developer-at-lemon-io",
        "/34599-archivesspace-technical-lead-at-lyrasis"
      ]
  end
end




