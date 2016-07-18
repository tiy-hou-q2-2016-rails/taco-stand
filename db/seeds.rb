User.delete_all
Taco.delete_all

jwo = User.create! username: "jwo", email: "jwo@example.com", password: "12345678"
bob = User.create! username: "bob", email: "bob@example.com", password: "12345678"

Taco.create! user: jwo, name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
Taco.create! user: jwo, name: "Fish Tacos", price: 6.50, photo_url: "http://www.thenovicechefblog.com/wp-content/uploads/2010/07/DSC_7383-1024x801.jpg"
Taco.create! user: bob, name: "Beef Fajitas", price: 6.56, photo_url: "http://grouchymuffin.com/wp-content/uploads/2013/05/lupe-tortillas-fajitas.jpg"
