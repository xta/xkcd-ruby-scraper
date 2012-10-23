require 'open-uri'
require 'nokogiri'
require 'fileutils'

# run this .rb file, and get locally an index file with all comics & alt tags in a navigational form
  # index is link of original xkcd as Source, link to comic locally
  # each page, show comic elements

  site = "http://xkcd.com/"

  def page_doc(url, page_elements) 
    Nokogiri::HTML(open(url))/page_elements
  end

# get number of latest comic from index
  index_body_text = page_doc(site,"body").inner_text
  latest_comic_num = index_body_text.match(/(comic: http:\/\/xkcd.com\/)\d+\//).to_s.split('/')[-1].to_i

# scrape comic pages
  for i in 1..latest_comic_num
    comic_page_path = site + i.to_s + "/"    

    comic_title = page_doc(comic_page_path,"#ctitle").text
    
    page_doc(comic_page_path, "#comic > img").each do |image|
      comic_img_src = image['src']
      comic_img_title = image['title']
      comic_img_alt = image['alt']
    end

  #process into html & related files
    # comic_title
    # comic_img_src
    # comic_img_title
    # comic_img_alt

  end