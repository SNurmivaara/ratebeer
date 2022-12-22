# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

s1 = Style.create name: "Hefeweizen", description: "A south German style of wheat beer (weissbier) typically made with a ratio of 50 percent barley to 50 percent wheat. Sometimes the percentage of wheat is even higher. \"Hefe\" means \"with yeast,\" hence the beer's unfiltered and cloudy appearance. The particular ale yeast used produces unique esters and phenols of banana and cloves with an often dry and tart edge, some spiciness, and notes of bubblegum or apples. Hefeweizens are typified by little hop bitterness, and a moderate level of alcohol. Often served with a lemon wedge (popularized by Americans), to cut the wheat or yeasty edge, some may find this to be either a flavorful snap or an insult that can damage the beer's taste and head retention."
s2 = Style.create name: "Lager", description: "The word lager comes from the German word lagern which means, \"to store\". A perfect description as lagers are brewed with bottom fermenting yeast that work slowly at around 34 degrees F, and are often further stored at cool temperature to mature. Lager yeast produce fewer by-product characters than ale yeast which allows for other flavors to pull through, such as hops."
s3 = Style.create name: "Bock", description: "Bock is a bottom fermenting lager that generally takes extra months of lagering (cold storage) to smooth out such a strong brew. Bock beer in general is stronger than your typical lager, more of a robust malt character with a dark amber to brown hue. Hop bitterness can be assertive enough to balance, though must not get in the way of the malt flavor, most are only lightly hopped."
s4 = Style.create name: "English Brown Ale", description: "Spawned from the Mild Ale tradition, English Brown Ales tend to be maltier and sweeter on the palate, with a somewhat fuller body. Color can range from a medium amber/reddish hue to dark brown. Some versions will lean towards fruity esters, while others tend to be drier with nutty characteristics. Roasty malt notes give this style complexity, but almost every example has both a minimal amount of hop aroma and low degree of hop bitterness. As with most historical English styles, alcohol levels are kept low to promote drinkability."
s5 = Style.create name: "New England IPA", description: "Emphasizing hop aroma and flavor without bracing bitterness, the New England IPA leans heavily on late and dry hopping techniques to deliver a bursting juicy, tropical hop experience. The skillful balance of technique and ingredient selection, often including the addition of wheat or oats, lends an alluring haze to this popular take on the American IPA."
s6 = Style.create name: "Sahti", description: "A farmhouse ale with roots in Finland, Sahti was first brewed by peasants in the 1500s. Turbid with tremendous body, a low-flocculating Finnish baker's yeast creates a cloudy unfiltered beer with an abundance of sediment. Its color usually falls somewhere between pale yellow and deep brown. Traditionally unhopped, juniper twigs used during the brewing process create balance, imparting an unusual resiny character and serving as a preservative. Meanwhile, exposure to wild yeast and bacteria gives Sahti its signature tartness."

b1 = Brewery.create name: "Koff", year: 1897
b2 = Brewery.create name: "Malmgard", year: 2001
b3 = Brewery.create name: "Weihenstephaner", year: 1040

b1.beers.create name: "Iso 3", style: s2
b1.beers.create name: "Karhu", style: s2
b1.beers.create name: "Tuplahumala", style: s2
b2.beers.create name: "Huvila Pale Ale", style: s5
b2.beers.create name: "Tuplapukki", style: s3
b3.beers.create name: "Hefeweizen", style: s1
b3.beers.create name: "Helles", style: s2
