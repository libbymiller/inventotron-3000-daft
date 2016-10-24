require 'squib'
require 'pp'

Squib::Deck.new(cards: 154, width: "8.9cm", height: "5.9cm") do

  data = csv file: 'daft_ideas.csv'
  new_names_sub = []
  fonts = []
  new_names = []
  new_colours = []
  new_colours_text = []
  new_colours_background = []
  types = data['type']
  colours = data['colour']

  count = 0
  data['name'].each do |name|
    puts count
    name = name.upcase
    front_text = '<span font_desc="Futura T OT Book 100">'+name[0]+'</span>'+name[1, name.length]
    fonts.push("Futura T OT Book 80")
    new_names.push(front_text)

    tt = types[count].upcase
    back_text = '<span font_desc="Futura T OT Book 100">'+tt[0]+'</span>'+tt[1, tt.length]
    new_names.push(back_text)

    new_colours_background.push("#FEFFE8")
    new_colours_background.push(colours[count])
    fonts.push("Futura T OT Book 80")

    new_colours_text.push(colours[count])
    new_colours_text.push("#FEFFE8")

    new_names_sub.push(types[count].upcase)
    new_names_sub.push("INVENTOTRON-3000.COM V0.1".upcase)
    count = count +1
  end


  bleed  = "0.2cm"

  background color: new_colours_background
  text str: new_names,
        #hint: :red,
        markup: true,
        x: bleed, y: bleed,
        width: "8.5cm", height: "5.5cm",
        color: new_colours_text, font: fonts,
        align: :center, valign: 'MIDDLE'

  text str: new_names_sub,
        #hint: :red,
        x: bleed, y: "5cm",
        width: "8.5cm", height: "0.5cm",
        color: new_colours_text, font: 'Futura T OT Book 30',
        align: :center, valign: 'BOTTOM'

  save prefix: 'daft_ideas_', format: :png

end
