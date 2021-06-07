USE hockey_db;

INSERT INTO team (name)
VALUES ("Leafs"), ("Canadiens"), ("Senators"), ("Canucks"), ("Flames"), ("Jets"), ("Oilers");

INSERT INTO coach (first_name, last_name, team_id)
VALUES ("Bugs", "Bunny", 1), ("Peppermint", "Patty", 2), ("Montgomery", "Burns", 3), ("Lois", "Griffin", 4), ("Natasha", "Romanov", 5), 
("Aragorn", "son of Arathorn", 6), ("Harry", "Potter", 7);

INSERT INTO player (first_name, last_name, birth_date, email, street, city, province, postal_code, friend_first_name, friend_last_name,
position, experience_level,coach_id, fieldname, originalname, encoding, mimetype, destination, filename, path, friend_id)
VALUES ("Nick","Foligno", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",1, "avatar", "NickFoligno.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8473422.jpg", "Assets/player_photos/8473422.jpg", 0),
("Jack.", "Campbell", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Goalie", "Intermediate",1, "avatar", "JackCampbell.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8475789.jpg", "Assets/player_photos/8475789.jpg", 0),
("Zach", "Hyman", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",1, "avatar", "ZachHyman.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8475786.jpg", "Assets/player_photos/8475786.jpg", 0),
("Jeff", "Muzzin", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Beginner",1, "avatar", "JeffMuzzin.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8474162.jpg", "Assets/player_photos/8474162.jpg", 0),
("John", "Tavares", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",1, "avatar", "JohnTavares.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8475166.jpg","Assets/player_photos/8475166.jpg", 0),
("Pierre", "Engvall", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",1, "avatar", "PierreEngvall.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478115.jpg", "Assets/player_photos/8478115.jpg", 0),
("Pual", "Byron", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",2, "avatar", "PaulByron.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8474038.jpg", "Assets/player_photos/8474038.jpg", 0),
("Corey", "Perry", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",2, "avatar", "CoreyPerry.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8470621.jpg", "Assets/player_photos/8470621.jpg", 0),
("Jesperi", "Kotkaniemi", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Center", "Expert",2, "avatar", "JesperiKotkaniemi.jpg", "7bit", "image/jpeg","./Assets/player_photos/" "8480829.jpg", "Assets/player_photos/8480829.jpg", 0),
("Shea", "Weber", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Intermediate",2, "avatar", "SheaWeber.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8470642.jpg", "Assets/player_photos/8470642.jpg", 0),
("Jake", "Allen", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Golie", "Expert",2, "avatar", "JakeAllen.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8474596.jpg", "Assets/player_photos/8474596.jpg", 0),
("Jeff", "Petry", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Beginner",2, "avatar", "JeffPetry.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8473507.jpg", "Assets/player_photos/8473507.jpg", 0),
("Michale", "Amadio", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",3, "avatar", "MichaleAmadio.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478020.jpg", "Assets/player_photos/8478020.jpg", 0),
("Drake", "Batherson", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",3, "avatar", "DrakeBatherson.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8480208.jpg", "Assets/player_photos/8480208.jpg", 0),
("Ryan", "Dzingel", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",3, "avatar", "RyanDzingel.jpeg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476288.jpg", "Assets/player_photos/8476288.jpg", 0),
("Nikita", "Zaitsev", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Beginner",3, "avatar", "NikitaZaitsev.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8479458.jpg", "Assets/player_photos/8479458.jpg", 0),
("Victor", "Mete", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Expert",3, "avatar", "VictorMete.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8479376.jpg", "Assets/player_photos/8479376.jpg", 0),
("Anton", "Forsberg", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Goalie", "Intermediate",3, "avatar", "AntonForsberg.jpeg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476341.jpg", "Assets/player_photos/8476341.jpg", 0),
("Brock", "Boeser", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",4, "avatar", "BrockBoeser.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478444.jpg", "Assets/player_photos/8478444.jpg", 0),
("Travis", "Boyd", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",4, "avatar", "TravisBoyd.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476329.jpg", "Assets/player_photos/8476329.jpg", 0),
("Nils", "Hoglander", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",4, "avatar", "NilsHoglander.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8481535.jpg", "Assets/player_photos/8481535.jpg", 0),
("Madiosn", "Bowey", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Beginner",4, "avatar", "MadisonBowey.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8477474.jpg", "Assets/player_photos/8477474.jpg", 0),
("Alexander", "Edler", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Intermediate",4, "avatar", "AlexanderEdler.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8471303.jpg", "Assets/player_photos/8471303.jpg", 0),
("Thatcher", "Demko", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Goalie", "Expert",4, "avatar", "ThatcherDemko.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8477967.jpg", "Assets/player_photos/8477967.jpg", 0),
("Mikael", "Backlund", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",5, "avatar", "MikaelBacklund.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8474150.jpg", "Assets/player_photos/8474150.jpg", 0),
("Johnny", "Gaudreau", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",5, "avatar", "JohnnyGaudreau.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476346.jpg", "Assets/player_photos/8476346.jpg", 0),
("Brett", "Ritchie", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",5, "avatar", "BrettRitchie.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476439.jpg", "Assets/player_photos/8476439.jpg", 0),
("Rasmus", "Andersson", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Intermediate",5, "avatar", "RasmusAndersson.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478397.jpg", "Assets/player_photos/8478397.jpg", 0),
("Mark", "Giordano", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Expert",5, "avatar", "MarkGiordano.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8470966.jpg", "Assets/player_photos/8470966.jpg", 0),
("Louis", "Domingue", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Goalie", "Beginner",5, "avatar", "LouisDomingue.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8475839.jpg", "Assets/player_photos/8475839.jpg", 0),
("Masson", "Appleton", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",6, "avatar", "MasonAppleton.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478891.jpg", "Assets/player_photos/8478891.jpg", 0),
("Kyle", "Connor", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",6, "avatar", "KyleConnor.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478398.jpg", "Assets/player_photos/8478398.jpg", 0),
("Blake", "Wheeler", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",6, "avatar", "BlakeWheeler.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8471218.jpg", "Assets/player_photos/8471218.jpg", 0),
("Josh", "Morrissey", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Beginner",6, "avatar", "JoshMorrissey.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8477504.jpg", "Assets/player_photos/8477504.jpg", 0),
("Nelson", "Nogier", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Expert",6, "avatar", "NelsonNogier.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478031.jpg", "Assets/player_photos/8478031.jpg", 0),
("Mikhail", "Berdin", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Goalie", "Intermediate",6, "avatar", "MikhailBerdin.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8479574.jpg", "Assets/player_photos/8479574.jpg", 0),
("Josh", "Archibald", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Beginner",7, "avatar", "JoshArchibald.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476326.jpg", "Assets/player_photos/8476326.jpg", 0),
("Connor", "McDavid", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Intermediate",7, "avatar", "ConnorMcDavid.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8478402.jpg", "Assets/player_photos/8478402.jpg", 0),
("Joakim", "Nygard", "2007-08-09", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Forward", "Expert",7, "avatar", "JoakimNygard.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8481638.jpg", "Assets/player_photos/8481638.jpg", 0),
("Adam", "Larsson", "2010-11-12", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Beginner",7, "avatar", "AdamLarsson.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8476457.jpg", "Assets/player_photos/8476457.jpg", 0),
("Darnell", "Nurse", "2001-02-03", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Defense", "Intermediate",7, "avatar", "DarnellNurse.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8477498.jpg", "Assets/player_photos/8477498.jpg", 0),
("Mikko", "Koskinen", "2004-05-06", "test@test.com", "1 Bracondale Hill Rd", "Toronto", "ON", "M6G 3Z6", "null", "null", "Goalie", "Expert",7, "avatar", "MikkoKoskinen.jpg", "7bit", "image/jpeg", "./Assets/player_photos/" "8475156.jpg", "Assets/player_photos/8475156.jpg", 0)


