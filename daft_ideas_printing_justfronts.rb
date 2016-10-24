require 'squib'
require 'pp'

Squib::Deck.new(cards: 297, width: "8.9cm", height: "5.9cm") do

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

  tmp_new_names_fronts = []
  tmp_new_names_backs = []
  tmp_new_names_sub_fronts = []
  tmp_new_names_sub_backs = []

  data['name'].each do |name|
    puts count
    name = name.upcase
    front_text = '<span font_desc="Futura T OT Book 100">'+name[0]+'</span>'+name[1, name.length]
    fonts.push("Futura T OT Book 80")
    tmp_new_names_fronts.push(front_text)

    tt = types[count].upcase
    back_text = '<span font_desc="Futura T OT Book 100">'+tt[0]+'</span>'+tt[1, tt.length]
    tmp_new_names_backs.push(back_text)

#    new_colours_background.push("#FEFFE8")
#    new_colours_background.push("#FEFFE8")
    new_colours_background.push("#FFFFFF")
#    new_colours_background.push("#FFFFFF")
    fonts.push("Futura T OT Book 80")

    new_colours_text.push(colours[count])
 #   new_colours_text.push(colours[count])

    tmp_new_names_sub_fronts.push(types[count].upcase)
    tmp_new_names_sub_backs.push("EMF-WORKSHOP-2016".upcase)
    count = count +1
    if(count%9==0)
       new_names.push(tmp_new_names_fronts)      
       new_names_sub.push(tmp_new_names_sub_fronts)      
       tmp_new_names_fronts = []
       tmp_new_names_sub_fronts = []
#       new_names.push(tmp_new_names_backs)      
#       new_names_sub.push(tmp_new_names_sub_backs)      
       tmp_new_names_backs = []
       tmp_new_names_sub_backs = []
    end
  end

  new_names.flatten!
  new_names_sub.flatten!

  bleed  = "0.2cm"

  background color: new_colours_background
  rect color: 'black'
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

  save_pdf format: :pdf,
             margin: 70, gap: 1,
             file: "daft_ideas_fronts.pdf"

end
