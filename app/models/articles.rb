class Articles < ActiveRecord::Base

  def self.parse_from_osel(html)
    doc = Nokogiri::HTML.parse(html)

    doc.search('.clanek_uvodka_new').map do |div|
      anchor = div.search('a.nadpis_clanku2').first

      Articles.create!(
          article_id: anchor[:href][/clanek=(\d+)/, 1].to_i,
          title: anchor.text,
          perex: div.search('.popisek').text,
          url: "http://osel.cz/" + anchor[:href]
      )
    end
  end

  def self.parse_from_dsl(html)
    doc = Nokogiri::HTML.parse(html)
    first_link = doc.search('a.title_day').first

    Articles.create!(
      article_id: first_link[:href][/article=(\d+)/, 1].to_i,
      title: first_link.text,
      perex: doc.search('.article_perex').first.text,
      url: "http://dsl.sk/" + first_link[:href]
    )

    doc.search('td').map do |div|
      anchor = div.search('> a.title').first
      perex = div.search('> .article_perex').first

      Articles.create!(
        article_id: anchor[:href][/article=(\d+)/, 1].to_i,
        title: anchor.text,
        perex: perex.text,
        url: "http://dsl.sk/" + anchor[:href]
      ) if anchor && perex
    end
  end

end
