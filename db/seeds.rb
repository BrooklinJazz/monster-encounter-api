# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
monsterArrOfObj = [{
"Name": "Aboleth",
"Source": "Monster Manual",
"Type": "Large aberration, lawful evil",
"HP": {
"Value": 135,
"Notes": "(18d10+36)"
},
"AC": {
"Value": 17,
"Notes": "(natural armor)"
},
"InitiativeModifier": 0,
"Speed": [
"10 ft.",
"swim 40 ft."
],
"Abilities": {
"Str": 21,
"Dex": 9,
"Con": 15,
"Int": 18,
"Wis": 15,
"Cha": 18
},
"DamageVulnerabilities": [],
"DamageResistances": [],
"DamageImmunities": [],
"ConditionImmunities": [],
"Saves": [
{
"Name": "Con",
"Modifier": 6
},
{
"Name": "Int",
"Modifier": 8
},
{
"Name": "Wis",
"Modifier": 6
}
],
"Skills": [
{
"Name": "History",
"Modifier": 12
},
{
"Name": "Perception",
"Modifier": 10
}
],
"Senses": [
"darkvision 120 ft."
],
"Languages": [
"Deep Speech",
"telepathy 120 ft."
],
"Challenge": "10",
"Traits": [
{
"Name": "Amphibious",
"Content": "The aboleth can breathe air and water.",
"Usage": ""
},
{
"Name": "Mucous Cloud",
"Content": "While underwater, the aboleth is surrounded by transformative mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 ft. of it must make a DC 14 Constitution saving throw. On a failure, the creature is diseased for 1d4 hours. The diseased creature can breathe only underwater.",
"Usage": ""
},
{
"Name": "Probing Telepathy",
"Content": "If a creature communicates telepathically with the aboleth, the aboleth learns the creature's greatest desires if the aboleth can see the creature.",
"Usage": ""
}
],
"Actions": [
{
"Name": "Multiattack",
"Content": "The aboleth makes three tentacle attacks.",
"Usage": ""
},
{
"Name": "Tentacle",
"Content": "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 12 (2d6 + 5) bludgeoning damage. If the target is a creature, it must succeed on a DC 14 Constitution saving throw or become diseased. The disease has no effect for 1 minute and can be removed by any magic that cures disease. After 1 minute, the diseased creature's skin becomes translucent and slimy, the creature can't regain hit points unless it is underwater, and the disease can be removed only by heal or another disease-curing spell of 6th level or higher. When the creature is outside a body of water, it takes 6 (1d12) acid damage every 10 minutes unless moisture is applied to the skin before 10 minutes have passed.",
"Usage": ""
},
{
"Name": "Tail",
"Content": "Melee Weapon Attack: +9 to hit, reach 10 ft. one target. Hit: 15 (3d6 + 5) bludgeoning damage.",
"Usage": ""
},
{
"Name": "Enslave (3/day)",
"Content": "The aboleth targets one creature it can see within 30 ft. of it. The target must succeed on a DC 14 Wisdom saving throw or be magically charmed by the aboleth until the aboleth dies or until it is on a different plane of existence from the target. The charmed target is under the aboleth's control and can't take reactions, and the aboleth and the target can communicate telepathically with each other over any distance.\nWhenever the charmed target takes damage, the target can repeat the saving throw. On a success, the effect ends. No more than once every 24 hours, the target can also repeat the saving throw when it is at least 1 mile away from the aboleth.",
"Usage": ""
}
],
"Reactions": [],
"LegendaryActions": [
{
"Name": "Detect",
"Content": "The aboleth makes a Wisdom (Perception) check.",
"Usage": ""
},
{
"Name": "Tail Swipe",
"Content": "The aboleth makes one tail attack.",
"Usage": ""
},
{
"Name": "Psychic Drain (Costs 2 Actions)",
"Content": "One creature charmed by the aboleth takes 10 (3d6) psychic damage, and the aboleth regains hit points equal to the damage the creature takes.",
"Usage": ""
}
],
"Description": "",
"Player": ""
}]

PASSWORD = 'supersecret'

# When Combat.destroy_all is after User, you will get an error:
# ERROR:  update or delete on table "users" violates foreign key constraint
# "fk_rails_33bc2337d8" on table "combats"

# You're trying to delete a record that its primary key is functioning as a foreign key in another table, thus you can't delete it.
#
# In order to delete that record, first, delete the record with the foreign key, and then delete the original that you wanted to delete.
Combat.destroy_all
User.destroy_all

super_user = User.create(
  first_name: 'Jon',
  last_name: 'Snow',
  email: 'js@winterfell.gov',
  password: PASSWORD
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

10.times.each do
  Combat.create(
    name: Faker::Name.first_name,
    fight: monsterArrOfObj,
    user: User.all.sample
  )
end

users = User.all

puts Cowsay.say("Created #{users.count} users", :tux)

combats = Combat.all

puts Cowsay.say("Created #{combats.count} combats", :tux)

# then at the bottom
puts "Login with #{super_user.email} and password of '#{PASSWORD}'!"
