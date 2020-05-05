shelter1 = Shelter.create(name: "Randy's Rodent Ranch", address: "555 Hamster Ave", city: "Richmond", state: "VA", zip: "12345")
shelter2 = Shelter.create(name: "Turkey Paradise", address: "876 Sandwich Lane", city: "Cheyenne", state: "WY", zip: "23456")

pet1 = shelter1.pets.create(name: "Geraldo", 
                                    image: "https://images.freeimages.com/images/large-previews/4bc/rodent-1383599.jpg", 
                                    age: 2,
                                    sex: "male")
pet2 = shelter2.pets.create(name: "Belinda", 
                                    image: "https://images.freeimages.com/images/large-previews/790/turkey-1368576.jpg", 
                                    age: 4,
                                    sex: "female")

