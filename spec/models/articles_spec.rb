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

  it 'parses from dsl.sk' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/dsl-title-page.html', encoding: 'windows-1250')
    Articles.parse_from_dsl(html)

    expect(Articles.count).not_to eq(0)
    expect(Articles.count).to eq(13)

    article = Articles.first

    expect(article.article_id).to eq(15760)
    expect(article.title).to eq('Google ukázal nový Android L, je dvakrát výkonnejší, má dlhšiu výdrž a vyzerá inak')
    expect(article.perex).to eq('Spoločnosť Google v stredu na svojej konferencii pre vývojárov Google I/O predstavila viacero produktových noviniek vrátane novej verzie svojho operačného systému Android, označovaná spoločnosťou za najvýznamnejšiu novú verziu v celej histórii tohto OS. V novej verzii prišlo k výraznému prepracovaniu dizajnu a rapídne sa má vďaka novému runtimu zvýšiť aj výkon a odozva, lepšia má byť aj spotreba a výdrž.')
    expect(article.url).to eq('http://dsl.sk/article.php?article=15760&title=')

    second_article = Articles.second

    expect(second_article.article_id).to eq(15698)
    expect(second_article.title).to eq('FIFA pustila do futbalu technológiu, na MS o góloch rozhoduje 14 kamier s 500 fps')
    expect(second_article.perex).to eq('Na 20. majstrovstvách sveta vo futbale, ktoré štartujú úvodným zápasom vo štvrtok, bude prvýkrát v histórii asistovať pri rozhodovaní technológia. Po nesprávnych rozhodnutiach rozhodcov okrem iného na predchádzajúcich MS 2010 bude posudzovať padnutie gólu plne automaticky nemecká kamerová technológia GoalControl-4D, ktorá umožní rozhodcom správne rozhodnúť aj v komplikovaných situáciách. Technológia sa spolieha na celkom 14 vysokorýchlostných kamier na jednom štadióne.')
    expect(second_article.url).to eq('http://dsl.sk/article.php?article=15698&title=')
  end

end
