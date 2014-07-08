require 'rails_helper'

RSpec.describe Articles, :type => :model do
  it 'parses from osel.cz' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/osel_title_page.html', encoding: 'windows-1250')
    Articles.parse_from_osel(html)

    expect(Articles.count).not_to eq(0)

    article = Articles.first

    expect(article.article_id).to eq(7678)
    expect(article.title).to eq('Šikovná nanoměřidla z DNA origami pro výzkum rakoviny ')
    expect(article.perex).to eq('Technologie DNA origami umožňuje poskládat v nanoměřítku takřka cokoliv. Například přesná měřidla pro studium efrinového receptoru EphA2, který je významný v některých typech rakoviny.')
    expect(article.url).to eq('http://osel.cz/index.php?clanek=7678')
  end

end
