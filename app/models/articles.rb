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

end
