USE gamechop;

-- GENRES
INSERT INTO genres (name) VALUES
('Action'),
('Adventure'),
('RPG'),
('FPS'),
('Sports'),
('Racing'),
('Horror'),
('Platformer'),
('Fighting'),
('Strategy'),
('Simulation'),
('Open World'),
('Stealth'),
('Survival'),
('Puzzle');

-- PUBLISHERS
INSERT INTO publishers (name, logo, banner) VALUES
('Nintendo',            'https://logos-api.apistemic.com/domain:nintendo.com',        'https://cdn.gamechop.com/publishers/nintendo/banner.png'),
('Sony Interactive',    'https://logos-api.apistemic.com/domain:playstation.com',            'https://cdn.gamechop.com/publishers/sony/banner.png'),
('Microsoft Studios',   'https://logos-api.apistemic.com/domain:xbox.com',      'https://cdn.gamechop.com/publishers/microsoft/banner.png'),
('Electronic Arts',     'https://logos-api.apistemic.com/domain:ea.com',              'https://cdn.gamechop.com/publishers/ea/banner.png'),
('Activision Blizzard', 'https://logos-api.apistemic.com/domain:activision.com',     'https://cdn.gamechop.com/publishers/activision/banner.png'),
('Bandai Namco',        'https://logos-api.apistemic.com/domain:bandainamcoent.com',          'https://cdn.gamechop.com/publishers/bandai/banner.png'),
('Ubisoft',             'https://logos-api.apistemic.com/domain:ubisoft.com',         'https://cdn.gamechop.com/publishers/ubisoft/banner.png'),
('Square Enix',         'https://logos-api.apistemic.com/domain:square-enix.com',     'https://cdn.gamechop.com/publishers/squareenix/banner.png'),
('Capcom',              'https://logos-api.apistemic.com/domain:capcom.com',          'https://cdn.gamechop.com/publishers/capcom/banner.png'),
('Bethesda',            'https://logos-api.apistemic.com/domain:bethesda.net',        'https://cdn.gamechop.com/publishers/bethesda/banner.png'),
('2K Games',            'https://logos-api.apistemic.com/domain:2k.com',              'https://cdn.gamechop.com/publishers/2k/banner.png'),
('Rockstar Games',      'https://logos-api.apistemic.com/domain:rockstargames.com',        'https://cdn.gamechop.com/publishers/rockstar/banner.png'),
('Sega',                'https://logos-api.apistemic.com/domain:sega.com',            'https://cdn.gamechop.com/publishers/sega/banner.png'),
('CD Projekt Red',      'https://logos-api.apistemic.com/domain:cdprojektred.com',            'https://cdn.gamechop.com/publishers/cdpr/banner.png');

-- DEVELOPERS
INSERT INTO developers (publisher_id, name, logo, banner) VALUES
(1,  'Nintendo EPD',        'https://cdn.gamechop.com/developers/epd/logo.png',             'https://cdn.gamechop.com/developers/epd/banner.png'),
(2,  'Naughty Dog',         'https://cdn.gamechop.com/developers/naughtydog/logo.png',      'https://cdn.gamechop.com/developers/naughtydog/banner.png'),
(2,  'Insomniac Games',     'https://cdn.gamechop.com/developers/insomniac/logo.png',       'https://cdn.gamechop.com/developers/insomniac/banner.png'),
(3,  'Obsidian',            'https://cdn.gamechop.com/developers/obsidian/logo.png',        'https://cdn.gamechop.com/developers/obsidian/banner.png'),
(4,  'Respawn',             'https://cdn.gamechop.com/developers/respawn/logo.png',         'https://cdn.gamechop.com/developers/respawn/banner.png'),
(5,  'Infinity Ward',       'https://cdn.gamechop.com/developers/iw/logo.png',              'https://cdn.gamechop.com/developers/iw/banner.png'),
(6,  'FromSoftware',        'https://cdn.gamechop.com/developers/fromsoftware/logo.png',   'https://cdn.gamechop.com/developers/fromsoftware/banner.png'),
(7,  'Ubisoft Montreal',    'https://cdn.gamechop.com/developers/ubisoftmtl/logo.png',     'https://cdn.gamechop.com/developers/ubisoftmtl/banner.png'),
(8,  'Square Enix CS3',     'https://cdn.gamechop.com/developers/cs3/logo.png',             'https://cdn.gamechop.com/developers/cs3/banner.png'),
(9,  'Capcom R&D 1',        'https://cdn.gamechop.com/developers/capcomrd1/logo.png',       'https://cdn.gamechop.com/developers/capcomrd1/banner.png'),
(10, 'Bethesda Game Studios','https://cdn.gamechop.com/developers/bgs/logo.png',            'https://cdn.gamechop.com/developers/bgs/banner.png'),
(11, 'Firaxis Games',       'https://cdn.gamechop.com/developers/firaxis/logo.png',        'https://cdn.gamechop.com/developers/firaxis/banner.png'),
(12, 'Rockstar North',      'https://cdn.gamechop.com/developers/rockstarnorth/logo.png',  'https://cdn.gamechop.com/developers/rockstarnorth/banner.png'),
(13, 'Sonic Team',          'https://cdn.gamechop.com/developers/sonicteam/logo.png',      'https://cdn.gamechop.com/developers/sonicteam/banner.png'),
(14, 'CD Projekt Red',      'https://cdn.gamechop.com/developers/cdpr/logo.png',           'https://cdn.gamechop.com/developers/cdpr/banner.png'),
(2,  'Santa Monica Studio', 'https://cdn.gamechop.com/developers/santamonica/logo.png',    'https://cdn.gamechop.com/developers/santamonica/banner.png'),
(4,  'BioWare',             'https://cdn.gamechop.com/developers/bioware/logo.png',        'https://cdn.gamechop.com/developers/bioware/banner.png'),
(9,  'Capcom R&D 2',        'https://cdn.gamechop.com/developers/capcomrd2/logo.png',      'https://cdn.gamechop.com/developers/capcomrd2/banner.png');

-- STORES
INSERT INTO stores (address, city, state, open_hour, close_hour, google_map_url) VALUES
('4567 International Dr',   'Orlando',       'FL', 10, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+4567+International+Dr+Orlando+FL'),
('8901 Sunset Blvd',        'Los Angeles',   'CA', 10, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+8901+Sunset+Blvd+Los+Angeles+CA'),
('321 Michigan Ave',        'Chicago',       'IL',  9, 20, 'https://www.google.com/maps/search/?api=1&query=GameStop+321+Michigan+Ave+Chicago+IL'),
('654 Peachtree St',        'Atlanta',       'GA', 10, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+654+Peachtree+St+Atlanta+GA'),
('789 Broadway',            'New York',      'NY',  9, 22, 'https://www.google.com/maps/search/?api=1&query=GameStop+789+Broadway+New+York+NY'),
('1122 Westheimer Rd',      'Houston',       'TX', 10, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+1122+Westheimer+Rd+Houston+TX'),
('2200 Las Vegas Blvd',     'Las Vegas',     'NV', 10, 22, 'https://www.google.com/maps/search/?api=1&query=GameStop+2200+Las+Vegas+Blvd+Las+Vegas+NV'),
('3300 N Clark St',         'Chicago',       'IL',  9, 20, 'https://www.google.com/maps/search/?api=1&query=GameStop+3300+N+Clark+St+Chicago+IL'),
('5500 Robson St',          'Vancouver',     'BC', 10, 20, 'https://www.google.com/maps/search/?api=1&query=GameStop+5500+Robson+St+Vancouver+BC'),
('101 Fremont St',          'San Francisco', 'CA', 10, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+101+Fremont+St+San+Francisco+CA'),
('4400 NW Loop 410',        'San Antonio',   'TX', 10, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+4400+NW+Loop+410+San+Antonio+TX'),
('900 N Michigan Ave',      'Chicago',       'IL',  9, 21, 'https://www.google.com/maps/search/?api=1&query=GameStop+900+N+Michigan+Ave+Chicago+IL');

INSERT INTO games (title, summary, thumbnail, release_date, price) VALUES
('Elden Ring',
 'A vast open world RPG set in the Lands Between, crafted by FromSoftware and George R.R. Martin.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1245620/library_600x900.jpg', '2022-02-25', 59.99),
('The Last of Us Part I',
 'A post-apocalyptic survival story following Joel and Ellie across a ruined America.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1888930/library_600x900.jpg', '2013-06-14', 39.99),
('Marvel Spider-Man 2',
 'Swing through New York as both Peter Parker and Miles Morales.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/2651280/library_600x900.jpg', '2023-10-20', 69.99),
('Apex Legends',
 'A free-to-play hero battle royale set in the Titanfall universe.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1172470/library_600x900.jpg', '2019-02-04', 0.00),
('Call of Duty MW3',
 'Modern military FPS with an intense campaign and expansive multiplayer.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/3595270/library_600x900.jpg', '2023-11-10', 69.99),
('The Legend of Zelda: Tears of the Kingdom',
 'Explore Hyrule from the skies to the depths in this open world sequel.',
 'https://cdn.gamechop.com/games/totk/thumbnail.png', '2023-05-12', 69.99),
('Hogwarts Legacy',
 'An open world RPG set in the 1800s wizarding world.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/990080/library_600x900.jpg', '2023-02-10', 59.99),
('God of War Ragnarok',
 'Kratos and Atreus journey through the Nine Realms to prevent Ragnarok.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/2322010/library_600x900.jpg', '2022-11-09', 69.99),
('Cyberpunk 2077',
 'An open world action RPG set in the dystopian Night City.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1091500/library_600x900.jpg', '2020-12-10', 39.99),
('Final Fantasy XVI',
 'A dark action RPG following Clive Rosfield in the world of Valisthea.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/2515020/library_600x900.jpg', '2023-06-22', 59.99),
('Resident Evil 4 Remake',
 'A ground-up remake of the survival horror classic.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/2050650/library_600x900.jpg', '2023-03-24', 59.99),
('Starfield',
 'Bethesdas space exploration RPG set across a thousand planets.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1716740/library_600x900.jpg', '2023-09-06', 69.99),
('Assassins Creed Mirage',
 'Return to the roots of the franchise in ninth century Baghdad.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/2679870/library_600x900.jpg', '2023-10-05', 49.99),
('Street Fighter 6',
 'A new era of street fighting with a massive roster and World Tour mode.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1364780/library_600x900.jpg', '2023-06-02', 59.99),
('Grand Theft Auto V',
 'Three criminals pull off heists across the sprawling city of Los Santos.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/271590/library_600x900.jpg', '2013-09-17', 29.99),
('Red Dead Redemption 2',
 'An epic tale of life in Americas unforgiving heartland.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1174180/library_600x900.jpg', '2018-10-26', 39.99),
('Baldurs Gate 3',
 'A story-rich RPG with deep choices set in the Dungeons and Dragons universe.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1086940/library_600x900.jpg', '2023-08-03', 59.99),
('Sonic Frontiers',
 'Sonic explores vast open zones in his most ambitious adventure yet.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1237320/library_600x900.jpg', '2022-11-08', 49.99),
('The Witcher 3: Wild Hunt',
 'A story-driven open world RPG set in a visually stunning fantasy universe.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/292030/library_600x900.jpg', '2015-05-19', 29.99),
('Dragon Age: Inquisition',
 'Lead the Inquisition and save the world from a mysterious tear in the sky.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1222690/library_600x900.jpg', '2014-11-18', 19.99),
('Monster Hunter World',
 'Hunt massive monsters across lush ecosystems in this action RPG.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/582010/library_600x900.jpg', '2018-01-26', 29.99),
('Devil May Cry 5',
 'Three demon hunters battle the demonic invasion of the human world.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/601150/library_600x900.jpg', '2019-03-08', 29.99),
('FIFA 24',
 'The worlds most popular football simulation returns with HyperMotionV.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/2195250/library_600x900.jpg', '2023-09-29', 69.99),
('Forza Horizon 5',
 'Race across a gorgeous open world recreation of Mexico.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1551360/library_600x900.jpg', '2021-11-09', 59.99),
('Hades',
 'Defy the god of the dead as you hack and slash out of the Underworld.',
 'https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/library_600x900.jpg', '2020-09-17', 24.99);

-- GAME_PREVIEWS
INSERT INTO game_previews (game_id, preview_id, url) VALUES
(1,  1, 'https://cdn.gamechop.com/games/elden-ring/preview-1.mp4'),
(1,  2, 'https://cdn.gamechop.com/games/elden-ring/preview-2.jpg'),
(1,  3, 'https://cdn.gamechop.com/games/elden-ring/preview-3.jpg'),
(2,  1, 'https://cdn.gamechop.com/games/the-last-of-us/preview-1.mp4'),
(2,  2, 'https://cdn.gamechop.com/games/the-last-of-us/preview-2.jpg'),
(2,  3, 'https://cdn.gamechop.com/games/the-last-of-us/preview-3.jpg'),
(3,  1, 'https://cdn.gamechop.com/games/spider-man-2/preview-1.mp4'),
(3,  2, 'https://cdn.gamechop.com/games/spider-man-2/preview-2.jpg'),
(3,  3, 'https://cdn.gamechop.com/games/spider-man-2/preview-3.jpg'),
(4,  1, 'https://cdn.gamechop.com/games/apex-legends/preview-1.mp4'),
(4,  2, 'https://cdn.gamechop.com/games/apex-legends/preview-2.jpg'),
(5,  1, 'https://cdn.gamechop.com/games/cod-mw3/preview-1.mp4'),
(5,  2, 'https://cdn.gamechop.com/games/cod-mw3/preview-2.jpg'),
(5,  3, 'https://cdn.gamechop.com/games/cod-mw3/preview-3.jpg'),
(6,  1, 'https://cdn.gamechop.com/games/totk/preview-1.mp4'),
(6,  2, 'https://cdn.gamechop.com/games/totk/preview-2.jpg'),
(6,  3, 'https://cdn.gamechop.com/games/totk/preview-3.jpg'),
(7,  1, 'https://cdn.gamechop.com/games/hogwarts-legacy/preview-1.mp4'),
(7,  2, 'https://cdn.gamechop.com/games/hogwarts-legacy/preview-2.jpg'),
(7,  3, 'https://cdn.gamechop.com/games/hogwarts-legacy/preview-3.jpg'),
(8,  1, 'https://cdn.gamechop.com/games/gow-ragnarok/preview-1.mp4'),
(8,  2, 'https://cdn.gamechop.com/games/gow-ragnarok/preview-2.jpg'),
(8,  3, 'https://cdn.gamechop.com/games/gow-ragnarok/preview-3.jpg'),
(9,  1, 'https://cdn.gamechop.com/games/cyberpunk-2077/preview-1.mp4'),
(9,  2, 'https://cdn.gamechop.com/games/cyberpunk-2077/preview-2.jpg'),
(9,  3, 'https://cdn.gamechop.com/games/cyberpunk-2077/preview-3.jpg'),
(10, 1, 'https://cdn.gamechop.com/games/ff16/preview-1.mp4'),
(10, 2, 'https://cdn.gamechop.com/games/ff16/preview-2.jpg'),
(10, 3, 'https://cdn.gamechop.com/games/ff16/preview-3.jpg'),
(11, 1, 'https://cdn.gamechop.com/games/re4/preview-1.mp4'),
(11, 2, 'https://cdn.gamechop.com/games/re4/preview-2.jpg'),
(11, 3, 'https://cdn.gamechop.com/games/re4/preview-3.jpg'),
(12, 1, 'https://cdn.gamechop.com/games/starfield/preview-1.mp4'),
(12, 2, 'https://cdn.gamechop.com/games/starfield/preview-2.jpg'),
(12, 3, 'https://cdn.gamechop.com/games/starfield/preview-3.jpg'),
(13, 1, 'https://cdn.gamechop.com/games/ac-mirage/preview-1.mp4'),
(13, 2, 'https://cdn.gamechop.com/games/ac-mirage/preview-2.jpg'),
(14, 1, 'https://cdn.gamechop.com/games/sf6/preview-1.mp4'),
(14, 2, 'https://cdn.gamechop.com/games/sf6/preview-2.jpg'),
(15, 1, 'https://cdn.gamechop.com/games/gtav/preview-1.mp4'),
(15, 2, 'https://cdn.gamechop.com/games/gtav/preview-2.jpg'),
(16, 1, 'https://cdn.gamechop.com/games/rdr2/preview-1.mp4'),
(16, 2, 'https://cdn.gamechop.com/games/rdr2/preview-2.jpg'),
(16, 3, 'https://cdn.gamechop.com/games/rdr2/preview-3.jpg'),
(17, 1, 'https://cdn.gamechop.com/games/bg3/preview-1.mp4'),
(17, 2, 'https://cdn.gamechop.com/games/bg3/preview-2.jpg'),
(17, 3, 'https://cdn.gamechop.com/games/bg3/preview-3.jpg'),
(18, 1, 'https://cdn.gamechop.com/games/sonic-frontiers/preview-1.mp4'),
(18, 2, 'https://cdn.gamechop.com/games/sonic-frontiers/preview-2.jpg'),
(19, 1, 'https://cdn.gamechop.com/games/witcher-3/preview-1.mp4'),
(19, 2, 'https://cdn.gamechop.com/games/witcher-3/preview-2.jpg'),
(19, 3, 'https://cdn.gamechop.com/games/witcher-3/preview-3.jpg'),
(20, 1, 'https://cdn.gamechop.com/games/da-inquisition/preview-1.mp4'),
(20, 2, 'https://cdn.gamechop.com/games/da-inquisition/preview-2.jpg'),
(21, 1, 'https://cdn.gamechop.com/games/mhw/preview-1.mp4'),
(21, 2, 'https://cdn.gamechop.com/games/mhw/preview-2.jpg'),
(21, 3, 'https://cdn.gamechop.com/games/mhw/preview-3.jpg'),
(22, 1, 'https://cdn.gamechop.com/games/dmc5/preview-1.mp4'),
(22, 2, 'https://cdn.gamechop.com/games/dmc5/preview-2.jpg'),
(23, 1, 'https://cdn.gamechop.com/games/fifa24/preview-1.mp4'),
(23, 2, 'https://cdn.gamechop.com/games/fifa24/preview-2.jpg'),
(24, 1, 'https://cdn.gamechop.com/games/fh5/preview-1.mp4'),
(24, 2, 'https://cdn.gamechop.com/games/fh5/preview-2.jpg'),
(24, 3, 'https://cdn.gamechop.com/games/fh5/preview-3.jpg'),
(25, 1, 'https://cdn.gamechop.com/games/hades/preview-1.mp4'),
(25, 2, 'https://cdn.gamechop.com/games/hades/preview-2.jpg');

-- ACHIEVEMENTS
-- 4-5 per game, 25 games
INSERT INTO achievements (title, description) VALUES
-- Elden Ring (1-5)
('Elden Lord',           'Reach the Elden Lord ending.'),
('Dragon Slayer',        'Defeat a dragon for the first time.'),
('Shardbearer',          'Defeat your first major boss.'),
('Rune Master',          'Accumulate 1,000,000 runes.'),
('Tarnished No More',    'Unlock every other achievement.'),

-- The Last of Us (6-10)
('Survivor',             'Complete the game on any difficulty.'),
('Scavenger',            'Collect every collectible in the game.'),
('Firefly',              'Complete the game on Survivor difficulty.'),
('Partner',              'Save Ellie from every danger without being prompted.'),
('Prepared for the Worst','Craft every item in the game.'),

-- Spider-Man 2 (11-15)
('Both Spiders',         'Play as both Peter and Miles in a single session.'),
('Web of Wonders',       'Unlock all web gadgets.'),
('Friendly Neighborhood','Complete all side missions.'),
('Symbiote Slayer',      'Defeat 100 symbiote enemies.'),
('Platinum Web',         'Unlock every other achievement.'),

-- Apex Legends (16-19)
('Champion',             'Win your first match.'),
('Legend',               'Reach level 50 with any legend.'),
('Kill Leader',          'Become the Kill Leader in a match.'),
('Squad Goals',          'Win a match without any squadmate going down.'),

-- CoD MW3 (20-24)
('Classified',           'Complete the campaign on any difficulty.'),
('Killstreak',           'Get a 10 killstreak in multiplayer.'),
('Veteran',              'Complete the campaign on Veteran difficulty.'),
('Weapons Specialist',   'Unlock all weapons in the armory.'),
('Warzone Ready',        'Win a match in every multiplayer mode.'),

-- Zelda TotK (25-29)
('Sky Explorer',         'Discover all sky islands.'),
('Master Builder',       'Build 50 unique contraptions.'),
('Dragon Chaser',        'Follow a dragon to its destination.'),
('Shrine Seeker',        'Complete all 152 shrines.'),
('True Hero of Hyrule',  'Defeat Ganondorf and watch the credits.'),

-- Hogwarts Legacy (30-34)
('Top of the Class',     'Learn every spell in the game.'),
('Merlin Trial Master',  'Complete all Merlin Trials.'),
('Beast Tamer',          'Rescue and breed every magical beast.'),
('Collector',            'Fill every page of the Field Guide.'),
('Hallowed Hero',        'Unlock every other achievement.'),

-- God of War Ragnarok (35-39)
('Father and Son',       'Complete the main story.'),
('Berserker King',       'Defeat all Berserker bosses.'),
('Fully Armed',          'Upgrade Kratos to full power.'),
('Realm Walker',         'Visit all Nine Realms.'),
('Spartan Fury',         'Defeat 1000 enemies.'),

-- Cyberpunk 2077 (40-44)
('Legend of Night City',  'Reach max Street Cred.'),
('The Whole City',        'Discover every district.'),
('Corpo Rat',             'Complete the Corpo lifepath.'),
('Ripperdoc Regular',     'Install 30 cyberware upgrades.'),
('Ghost',                 'Complete a mission without being detected.'),

-- Final Fantasy XVI (45-49)
('Dominant',              'Unlock all Eikonic abilities.'),
('Hunted',                'Complete every hunt in the game.'),
('Bearer of a Thousand Blades', 'Craft every weapon.'),
('Echoes of the Fallen',  'Complete the first DLC.'),
('The Rising Tide',       'Complete the second DLC.'),

-- Resident Evil 4 Remake (50-54)
('Leon S. Kennedy',       'Complete the game on Standard.'),
('A Fathers Love',        'Rescue Ashley from the castle.'),
('Minimalist',            'Complete the game using only a knife.'),
('Merchant Friend',       'Spend 100,000 pesetas at the merchant.'),
('S Rank',                'Complete any chapter with an S rank.'),

-- Starfield (55-59)
('Constellation',         'Join the Constellation faction.'),
('Planet Hopper',         'Land on 50 planets.'),
('Starborn',              'Complete New Game Plus once.'),
('Outpost Builder',       'Build an outpost on any planet.'),
('Into the Unknown',      'Complete the main story.'),

-- Assassins Creed Mirage (60-63)
('Hidden One',            'Complete the main story.'),
('Eagle Eye',             'Synchronize all viewpoints.'),
('Pickpocket',            'Steal from 50 NPCs without being caught.'),
('Black Box Master',      'Complete all Black Box missions stealthily.'),

-- Street Fighter 6 (64-68)
('World Warrior',         'Win a match with every character.'),
('Perfect Round',         'Win a round without taking damage.'),
('Tour Completed',        'Finish World Tour mode.'),
('Combo Master',          'Land a 10-hit combo.'),
('Ranked Up',             'Reach Diamond rank in Ranked Battle.'),

-- GTA V (69-73)
('Los Santos Legend',     'Achieve 100% game completion.'),
('Three Man Army',        'Survive 3 minutes on 3 stars with all characters.'),
('Solid Gold',            'Gold medal all missions.'),
('The Big One',           'Complete the final heist.'),
('Wanted: Alive or Alive','Escape a 5 star wanted level.'),

-- Red Dead Redemption 2 (74-78)
('Legendary',             'Unlock Arthur Morgans full legend.'),
('Posse Up',              'Create a posse and ride together.'),
('Bounty Hunter',         'Complete all bounty hunter missions.'),
('Horse Whisperer',       'Reach max bond with a horse.'),
('Good For Nothing',      'Reach 0 honor.'),

-- Baldurs Gate 3 (79-83)
('Illithid Wisdom',       'Use a tadpole power for the first time.'),
('Party of Four',         'Recruit all origin companions.'),
('Devil Deal',            'Make a deal with Raphael.'),
('Honor Mode',            'Complete the game on Honor difficulty.'),
('Dark Urge',             'Complete the Dark Urge origin.'),

-- Sonic Frontiers (84-87)
('Full Speed Ahead',      'Reach max speed upgrade.'),
('Titan Slayer',          'Defeat all Titan bosses.'),
('Island Hopper',         'Complete all islands.'),
('Cyber Space Explorer',  'Clear all Cyber Space stages.'),

-- The Witcher 3 (88-92)
('Geralt of Rivia',       'Complete the main story.'),
('Card Collector',        'Collect all Gwent cards.'),
('Monster Slayer',        'Complete all monster contracts.'),
('Hearts of Stone',       'Complete the Hearts of Stone expansion.'),
('Blood and Wine',        'Complete the Blood and Wine expansion.'),

-- Dragon Age Inquisition (93-97)
('Herald of Andraste',    'Open the Breach for the first time.'),
('Well Read',             'Read 30 codex entries.'),
('Inquisitor',            'Reach Inquisition level 20.'),
('The Inner Circle',      'Complete all companion quests.'),
('Trespasser',            'Complete the Trespasser DLC.'),

-- Monster Hunter World (98-102)
('Hunter Extraordinaire', 'Slay or capture 100 monsters.'),
('Elder Dragon Slayer',   'Slay all elder dragons.'),
('Fashion Hunter',        'Craft a full armor set from every monster.'),
('Handler Approved',      'Complete all Handler quests.'),
('Tempered Threat',       'Defeat a tempered elder dragon.'),

-- Devil May Cry 5 (103-107)
('Smokin Sexy Style',     'Get an S rank in Style on any mission.'),
('Dante Must Die',        'Complete the game on DMD difficulty.'),
('Triple Threat',         'Play as all three characters.'),
('Royal Guard',           'Parry 50 attacks with Royal Guard.'),
('Jackpot',               'Defeat the final boss.'),

-- FIFA 24 (108-111)
('First Goal',            'Score your first goal in any mode.'),
('Ultimate Team',         'Build a squad with 100 chemistry.'),
('Season Champion',       'Win a league season in Career Mode.'),
('Hat Trick Hero',        'Score a hat trick in a single match.'),

-- Forza Horizon 5 (112-116)
('Mexican Roads',         'Drive on every road in Mexico.'),
('Speed Demon',           'Hit 300 mph in any car.'),
('Collector',             'Own 50 different cars.'),
('Festival Starter',      'Complete the intro festival.'),
('Horizon Champion',      'Win the Horizon Grand Championship.'),

-- Hades (117-121)
('Fresh Start',           'Escape the Underworld for the first time.'),
('Death Defying',         'Escape 10 times.'),
('True Ending',           'Reach the true ending of the story.'),
('Boons of the Gods',     'Receive a boon from every Olympian.'),
('Heat Seeker',           'Complete a run at maximum heat.');

-- GAME_ACHIEVEMENTS
-- Maps each achievement block to its game
INSERT INTO game_achievements (achievement_id, game_id) VALUES
-- Elden Ring (1-5) = game 1
(1,1),(2,1),(3,1),(4,1),(5,1),
-- The Last of Us (6-10) = game 2
(6,2),(7,2),(8,2),(9,2),(10,2),
-- Spider-Man 2 (11-15) = game 3
(11,3),(12,3),(13,3),(14,3),(15,3),
-- Apex Legends (16-19) = game 4
(16,4),(17,4),(18,4),(19,4),
-- CoD MW3 (20-24) = game 5
(20,5),(21,5),(22,5),(23,5),(24,5),
-- Zelda TotK (25-29) = game 6
(25,6),(26,6),(27,6),(28,6),(29,6),
-- Hogwarts Legacy (30-34) = game 7
(30,7),(31,7),(32,7),(33,7),(34,7),
-- God of War Ragnarok (35-39) = game 8
(35,8),(36,8),(37,8),(38,8),(39,8),
-- Cyberpunk 2077 (40-44) = game 9
(40,9),(41,9),(42,9),(43,9),(44,9),
-- Final Fantasy XVI (45-49) = game 10
(45,10),(46,10),(47,10),(48,10),(49,10),
-- RE4 Remake (50-54) = game 11
(50,11),(51,11),(52,11),(53,11),(54,11),
-- Starfield (55-59) = game 12
(55,12),(56,12),(57,12),(58,12),(59,12),
-- AC Mirage (60-63) = game 13
(60,13),(61,13),(62,13),(63,13),
-- Street Fighter 6 (64-68) = game 14
(64,14),(65,14),(66,14),(67,14),(68,14),
-- GTA V (69-73) = game 15
(69,15),(70,15),(71,15),(72,15),(73,15),
-- RDR2 (74-78) = game 16
(74,16),(75,16),(76,16),(77,16),(78,16),
-- Baldurs Gate 3 (79-83) = game 17
(79,17),(80,17),(81,17),(82,17),(83,17),
-- Sonic Frontiers (84-87) = game 18
(84,18),(85,18),(86,18),(87,18),
-- The Witcher 3 (88-92) = game 19
(88,19),(89,19),(90,19),(91,19),(92,19),
-- Dragon Age Inquisition (93-97) = game 20
(93,20),(94,20),(95,20),(96,20),(97,20),
-- Monster Hunter World (98-102) = game 21
(98,21),(99,21),(100,21),(101,21),(102,21),
-- Devil May Cry 5 (103-107) = game 22
(103,22),(104,22),(105,22),(106,22),(107,22),
-- FIFA 24 (108-111) = game 23
(108,23),(109,23),(110,23),(111,23),
-- Forza Horizon 5 (112-116) = game 24
(112,24),(113,24),(114,24),(115,24),(116,24),
-- Hades (117-121) = game 25
(117,25),(118,25),(119,25),(120,25),(121,25);

-- PUBLISHER_GAMES
-- publishers: 1=Nintendo, 2=Sony, 3=Microsoft,
-- 4=EA, 5=Activision, 6=Bandai, 7=Ubisoft,
-- 8=Square Enix, 9=Capcom, 10=Bethesda,
-- 11=2K, 12=Rockstar, 13=Sega, 14=CD Projekt Red
INSERT INTO publisher_games (game_id, publisher_id) VALUES
(1,  6),   -- Elden Ring = Bandai Namco
(2,  2),   -- The Last of Us = Sony
(3,  2),   -- Spider-Man 2 = Sony
(4,  4),   -- Apex Legends = EA
(5,  5),   -- CoD MW3 = Activision
(6,  1),   -- Zelda TotK = Nintendo
(7,  3),   -- Hogwarts Legacy = Microsoft
(8,  2),   -- God of War Ragnarok = Sony
(9,  14),  -- Cyberpunk 2077 = CD Projekt Red
(10, 8),   -- Final Fantasy XVI = Square Enix
(11, 9),   -- RE4 Remake = Capcom
(12, 10),  -- Starfield = Bethesda
(13, 7),   -- AC Mirage = Ubisoft
(14, 9),   -- Street Fighter 6 = Capcom
(15, 12),  -- GTA V = Rockstar
(16, 12),  -- RDR2 = Rockstar
(17, 11),  -- Baldurs Gate 3 = 2K
(18, 13),  -- Sonic Frontiers = Sega
(19, 14),  -- Witcher 3 = CD Projekt Red
(20, 4),   -- Dragon Age Inquisition = EA
(21, 9),   -- Monster Hunter World = Capcom
(22, 9),   -- Devil May Cry 5 = Capcom
(23, 4),   -- FIFA 24 = EA
(24, 3),   -- Forza Horizon 5 = Microsoft
(25, 11);  -- Hades = 2K

-- DEVELOPER_GAMES
-- developers: 1=Nintendo EPD, 2=Naughty Dog,
-- 3=Insomniac, 4=Obsidian, 5=Respawn,
-- 6=Infinity Ward, 7=FromSoftware,
-- 8=Ubisoft Montreal, 9=Square Enix CS3,
-- 10=Capcom R&D 1, 11=BGS, 12=Firaxis,
-- 13=Rockstar North, 14=Sonic Team,
-- 15=CD Projekt Red, 16=Santa Monica,
-- 17=BioWare, 18=Capcom R&D 2
INSERT INTO developer_games (game_id, developer_id) VALUES
(1,  7),   -- Elden Ring = FromSoftware
(2,  2),   -- The Last of Us = Naughty Dog
(3,  3),   -- Spider-Man 2 = Insomniac
(4,  5),   -- Apex Legends = Respawn
(5,  6),   -- CoD MW3 = Infinity Ward
(6,  1),   -- Zelda TotK = Nintendo EPD
(7,  4),   -- Hogwarts Legacy = Obsidian
(8,  16),  -- God of War Ragnarok = Santa Monica
(9,  15),  -- Cyberpunk 2077 = CD Projekt Red
(10, 9),   -- Final Fantasy XVI = Square Enix CS3
(11, 10),  -- RE4 Remake = Capcom R&D 1
(12, 11),  -- Starfield = Bethesda Game Studios
(13, 8),   -- AC Mirage = Ubisoft Montreal
(14, 18),  -- Street Fighter 6 = Capcom R&D 2
(15, 13),  -- GTA V = Rockstar North
(16, 13),  -- RDR2 = Rockstar North
(17, 12),  -- Baldurs Gate 3 = Firaxis
(18, 14),  -- Sonic Frontiers = Sonic Team
(19, 15),  -- Witcher 3 = CD Projekt Red
(20, 17),  -- Dragon Age Inquisition = BioWare
(21, 10),  -- Monster Hunter World = Capcom R&D 1
(22, 10),  -- Devil May Cry 5 = Capcom R&D 1
(23, 4),   -- FIFA 24 = EA (Obsidian placeholder)
(24, 4),   -- Forza Horizon 5 = Obsidian placeholder
(25, 12);  -- Hades = Firaxis placeholder

-- GAME_GENRES
-- genre ids: 1=Action, 2=Adventure, 3=RPG,
-- 4=FPS, 5=Sports, 6=Racing, 7=Horror,
-- 8=Platformer, 9=Fighting, 10=Strategy,
-- 11=Simulation, 12=Open World, 13=Stealth,
-- 14=Survival, 15=Puzzle
INSERT INTO game_genres (game_id, genre_id) VALUES
(1,  1),(1,  3),(1,  12),          -- Elden Ring: Action, RPG, Open World
(2,  1),(2,  2),(2,  7),(2,  14),  -- TLOU: Action, Adventure, Horror, Survival
(3,  1),(3,  2),(3,  12),          -- Spider-Man 2: Action, Adventure, Open World
(4,  1),(4,  4),                   -- Apex: Action, FPS
(5,  1),(5,  4),                   -- CoD MW3: Action, FPS
(6,  1),(6,  2),(6,  12),          -- Zelda TotK: Action, Adventure, Open World
(7,  2),(7,  3),(7,  12),          -- Hogwarts: Adventure, RPG, Open World
(8,  1),(8,  2),                   -- GoW Ragnarok: Action, Adventure
(9,  1),(9,  3),(9,  12),          -- Cyberpunk: Action, RPG, Open World
(10, 1),(10, 3),                   -- FF16: Action, RPG
(11, 1),(11, 7),(11, 14),          -- RE4: Action, Horror, Survival
(12, 2),(12, 3),(12, 12),          -- Starfield: Adventure, RPG, Open World
(13, 1),(13, 2),(13, 13),          -- AC Mirage: Action, Adventure, Stealth
(14, 1),(14, 9),                   -- SF6: Action, Fighting
(15, 1),(15, 12),                  -- GTA V: Action, Open World
(16, 1),(16, 2),(16, 12),          -- RDR2: Action, Adventure, Open World
(17, 2),(17, 3),(17, 10),          -- BG3: Adventure, RPG, Strategy
(18, 1),(18, 8),(18, 12),          -- Sonic: Action, Platformer, Open World
(19, 1),(19, 3),(19, 12),          -- Witcher 3: Action, RPG, Open World
(20, 2),(20, 3),(20, 10),          -- Dragon Age: Adventure, RPG, Strategy
(21, 1),(21, 3),(21, 14),          -- MHW: Action, RPG, Survival
(22, 1),                           -- DMC5: Action
(23, 5),(23, 11),                  -- FIFA 24: Sports, Simulation
(24, 6),(24, 12),                  -- Forza H5: Racing, Open World
(25, 1),(25, 2),(25, 15);          -- Hades: Action, Adventure, Puzzle

-- STORE_GAMES
-- Digital-only games (Apex, id=4) excluded.
-- Each store carries a realistic subset.
INSERT INTO store_games (store_id, game_id, copies) VALUES
-- Orlando (store 1)
(1,1,12),(1,2,8),(1,3,15),(1,5,10),(1,6,7),(1,7,9),(1,8,11),(1,9,6),(1,11,8),(1,15,20),(1,16,14),(1,23,18),(1,24,10),
-- Los Angeles (store 2)
(2,1,5),(2,3,20),(2,5,14),(2,6,11),(2,7,6),(2,8,9),(2,10,4),(2,12,7),(2,14,5),(2,15,15),(2,19,8),(2,22,6),(2,23,12),
-- Chicago store 1 (store 3)
(3,1,9),(3,2,4),(3,5,8),(3,6,3),(3,7,12),(3,8,7),(3,11,5),(3,15,10),(3,16,9),(3,18,6),(3,21,4),(3,24,8),
-- Atlanta (store 4)
(4,1,7),(4,2,6),(4,3,9),(4,6,5),(4,7,8),(4,9,4),(4,13,6),(4,15,12),(4,16,10),(4,19,5),(4,22,3),(4,23,9),
-- New York (store 5)
(5,1,20),(5,2,15),(5,3,25),(5,5,18),(5,6,10),(5,7,14),(5,8,16),(5,9,8),(5,10,6),(5,11,12),(5,12,9),(5,13,7),(5,14,10),(5,15,25),(5,16,20),(5,17,8),(5,19,11),(5,21,7),(5,22,5),(5,23,20),(5,24,14),
-- Houston (store 6)
(6,1,11),(6,3,9),(6,5,7),(6,6,6),(6,7,10),(6,8,8),(6,15,13),(6,16,9),(6,19,6),(6,23,11),(6,24,7),
-- Las Vegas (store 7)
(7,1,8),(7,3,12),(7,5,9),(7,6,7),(7,7,5),(7,8,6),(7,11,4),(7,14,8),(7,15,15),(7,23,14),(7,24,9),
-- Chicago store 2 (store 8)
(8,1,6),(8,2,3),(8,5,5),(8,7,8),(8,9,3),(8,15,9),(8,16,7),(8,19,4),(8,21,3),(8,22,2),
-- Vancouver (store 9)
(9,1,4),(9,2,3),(9,6,5),(9,7,4),(9,8,3),(9,9,2),(9,15,6),(9,19,3),(9,21,2),
-- San Francisco (store 10)
(10,1,9),(10,3,11),(10,5,7),(10,6,8),(10,8,6),(10,9,4),(10,12,5),(10,15,12),(10,16,8),(10,19,5),(10,24,6),
-- San Antonio (store 11)
(11,1,7),(11,5,6),(11,6,5),(11,7,6),(11,15,10),(11,16,8),(11,23,9),(11,24,5),
-- Chicago store 3 (store 12)
(12,1,5),(12,2,3),(12,7,4),(12,15,8),(12,16,6),(12,19,3),(12,21,2),(12,23,7);

-- REQUIREMENTS
-- Odd IDs = minimum, Even IDs = recommended
INSERT INTO requirements (id, os, cpu, mem, gpu, storage) VALUES
-- Elden Ring
(1,  'Windows 10',       'Intel i5-8400 / AMD Ryzen 3 3300X',       '12 GB', 'GTX 1060 3GB / RX 580 4GB',         '60 GB'),
(2,  'Windows 10/11',    'Intel i7-8700K / AMD Ryzen 5 3600X',      '16 GB', 'GTX 1070 8GB / RX Vega 56 8GB',     '60 GB'),
-- The Last of Us Part I
(3,  'Windows 10',       'Intel i7-4770K / AMD Ryzen 5 1500X',      '16 GB', 'GTX 970 / RX 480 4GB',              '100 GB'),
(4,  'Windows 10/11',    'Intel i7-8700K / AMD Ryzen 5 3600X',      '16 GB', 'RTX 2070 Super / RX 5700 XT',       '100 GB'),
-- Spider-Man 2
(5,  'Windows 10',       'Intel i5-8400 / AMD Ryzen 5 3600',        '16 GB', 'GTX 1070 / RX 5700',                '100 GB'),
(6,  'Windows 10/11',    'Intel i7-12700K / AMD Ryzen 7 5800X',     '32 GB', 'RTX 3070 / RX 6800 XT',             '100 GB'),
-- Apex Legends
(7,  'Windows 10',       'Intel i3-6300 / AMD FX-4350',             '6 GB',  'GT 640 / Radeon HD 7730',            '56 GB'),
(8,  'Windows 10/11',    'Intel i5-3570K / AMD Ryzen 5 1400',       '8 GB',  'GTX 970 / R9 290',                   '56 GB'),
-- Call of Duty MW3
(9,  'Windows 10',       'Intel i5-6600 / AMD Ryzen 5 1400',        '8 GB',  'GTX 960 / RX 470',                   '78 GB'),
(10, 'Windows 10/11',    'Intel i7-8700K / AMD Ryzen 7 3700X',      '16 GB', 'RTX 3060 / RX 6600 XT',             '78 GB'),
-- Zelda TotK (emulated PC specs estimate)
(11, 'Windows 10',       'Intel i5-10400 / AMD Ryzen 5 3600',       '8 GB',  'GTX 1060 6GB / RX 580 8GB',         '16 GB'),
(12, 'Windows 10/11',    'Intel i7-10700 / AMD Ryzen 7 3700X',      '16 GB', 'RTX 2060 / RX 5600 XT',             '16 GB'),
-- Hogwarts Legacy
(13, 'Windows 10',       'Intel i5-6600 / AMD Ryzen 5 1400',        '16 GB', 'GTX 960 / RX 470 4GB',              '85 GB'),
(14, 'Windows 10/11',    'Intel i7-8700 / AMD Ryzen 5 3600',        '16 GB', 'RTX 2080 / RX 5700 XT',             '85 GB'),
-- God of War Ragnarok
(15, 'Windows 10',       'Intel i5-8400 / AMD Ryzen 5 2600',        '8 GB',  'GTX 1070 / RX 5600 XT',             '100 GB'),
(16, 'Windows 10/11',    'Intel i7-10700K / AMD Ryzen 7 5800X',     '16 GB', 'RTX 3070 / RX 6800 XT',             '100 GB'),
-- Cyberpunk 2077
(17, 'Windows 10',       'Intel i7-6700 / AMD Ryzen 5 1600',        '12 GB', 'GTX 1060 6GB / RX 580 8GB',         '70 GB'),
(18, 'Windows 10/11',    'Intel i7-12700 / AMD Ryzen 7 5800X',      '16 GB', 'RTX 2060 Super / RX 5700 XT',       '70 GB'),
-- Final Fantasy XVI
(19, 'Windows 10',       'Intel i5-8400 / AMD Ryzen 5 3600',        '16 GB', 'GTX 1070 / RX 5700',                '90 GB'),
(20, 'Windows 10/11',    'Intel i7-10700 / AMD Ryzen 7 5800X',      '16 GB', 'RTX 2080 / RX 6700 XT',             '90 GB'),
-- Resident Evil 4 Remake
(21, 'Windows 10',       'Intel i5-8400 / AMD Ryzen 3 3300X',       '12 GB', 'GTX 1060 3GB / RX 480 4GB',         '60 GB'),
(22, 'Windows 10/11',    'Intel i7-8700 / AMD Ryzen 5 3600',        '16 GB', 'RTX 2070 / RX 5700',                '60 GB'),
-- Starfield
(23, 'Windows 10',       'Intel i7-6800K / AMD Ryzen 5 2600X',      '16 GB', 'GTX 1070 Ti / RX 5700',             '125 GB'),
(24, 'Windows 10/11',    'Intel i9-12900H / AMD Ryzen 7 7800X3D',   '16 GB', 'RTX 2080 / RX 6800 XT',             '125 GB'),
-- Assassins Creed Mirage
(25, 'Windows 10',       'Intel i5-8400 / AMD Ryzen 5 1600',        '8 GB',  'GTX 1060 6GB / RX 570 4GB',         '40 GB'),
(26, 'Windows 10/11',    'Intel i7-9700K / AMD Ryzen 7 3700X',      '16 GB', 'RTX 2070 / RX 5700 XT',             '40 GB'),
-- Street Fighter 6
(27, 'Windows 10',       'Intel i5-7500 / AMD Ryzen 3 1200',        '8 GB',  'GTX 1060 / RX 580',                  '60 GB'),
(28, 'Windows 10/11',    'Intel i7-8700 / AMD Ryzen 5 3600',        '16 GB', 'RTX 2070 / RX 5700 XT',             '60 GB'),
-- GTA V
(29, 'Windows 10',       'Intel i5-3470 / AMD FX-8350',             '8 GB',  'GTX 660 2GB / HD 7870 2GB',          '72 GB'),
(30, 'Windows 10/11',    'Intel i5-6600K / AMD Ryzen 5 1500X',      '16 GB', 'GTX 1060 / RX 480 4GB',             '72 GB'),
-- Red Dead Redemption 2
(31, 'Windows 10',       'Intel i5-2500K / AMD FX-6300',            '8 GB',  'GTX 770 2GB / R9 280 3GB',           '150 GB'),
(32, 'Windows 10/11',    'Intel i7-4770K / AMD Ryzen 5 1500X',      '12 GB', 'GTX 1060 6GB / RX 480 4GB',         '150 GB'),
-- Baldurs Gate 3
(33, 'Windows 10',       'Intel i5-4690 / AMD FX-8350',             '8 GB',  'GTX 970 / RX 480 4GB',               '150 GB'),
(34, 'Windows 10/11',    'Intel i7-8700K / AMD Ryzen 5 3600',       '16 GB', 'RTX 2060 Super / RX 5700 XT',       '150 GB'),
-- Sonic Frontiers
(35, 'Windows 10',       'Intel i5-3470 / AMD Ryzen 5 1400',        '8 GB',  'GTX 660 2GB / RX 470 4GB',           '30 GB'),
(36, 'Windows 10/11',    'Intel i5-6600 / AMD Ryzen 5 2600',        '12 GB', 'GTX 1060 / RX 580 8GB',             '30 GB'),
-- The Witcher 3
(37, 'Windows 10',       'Intel i5-2500K / AMD Phenom II X4 940',   '6 GB',  'GTX 660 / Radeon HD 7870',           '50 GB'),
(38, 'Windows 10/11',    'Intel i7-3770 / AMD FX-8350',             '8 GB',  'GTX 770 / Radeon R9 290',            '50 GB'),
-- Dragon Age Inquisition
(39, 'Windows 10',       'Intel i5-2400 / AMD FX-8150',             '4 GB',  'GTX 660 / Radeon HD 7870',           '26 GB'),
(40, 'Windows 10/11',    'Intel i7-3770 / AMD FX-8350',             '8 GB',  'GTX 780 / Radeon R9 290X',           '26 GB'),
-- Monster Hunter World
(41, 'Windows 10',       'Intel i5-4460 / AMD FX-6300',             '8 GB',  'GTX 760 / R7 260x 2GB',              '48 GB'),
(42, 'Windows 10/11',    'Intel i7-3770 / AMD Ryzen 5 1500X',       '8 GB',  'GTX 1060 3GB / RX 570 4GB',         '48 GB'),
-- Devil May Cry 5
(43, 'Windows 10',       'Intel i5-4460 / AMD FX-6300',             '8 GB',  'GTX 760 / R7 260x',                  '35 GB'),
(44, 'Windows 10/11',    'Intel i7-3770 / AMD Ryzen 5 2600',        '16 GB', 'GTX 1060 6GB / RX 480 8GB',         '35 GB'),
-- FIFA 24
(45, 'Windows 10',       'Intel i5-6600K / AMD Ryzen 5 1600',       '8 GB',  'GTX 1050 Ti / RX 570',               '100 GB'),
(46, 'Windows 10/11',    'Intel i7-6700 / AMD Ryzen 7 2700X',       '12 GB', 'RTX 2060 / RX 5600 XT',             '100 GB'),
-- Forza Horizon 5
(47, 'Windows 10',       'Intel i5-4460 / AMD Ryzen 3 1200',        '8 GB',  'GTX 970 / RX 470',                   '110 GB'),
(48, 'Windows 10/11',    'Intel i7-10700K / AMD Ryzen 7 3800XT',    '16 GB', 'RTX 3080 / RX 6800 XT',             '110 GB'),
-- Hades
(49, 'Windows 10',       'Intel Core 2 Duo / AMD Athlon 64 X2',     '4 GB',  'GTX 460 / Radeon HD 6850',           '15 GB'),
(50, 'Windows 10/11',    'Intel i5-2400 / AMD FX-4350',             '8 GB',  'GTX 660 / RX 470',                   '15 GB');

-- GAME_REQUIREMENTS
-- Links each game to its min (odd) and rec (even) requirements
INSERT INTO game_requirements (req_id, game_id, recommended) VALUES
(1,  1,  FALSE), (2,  1,  TRUE),   -- Elden Ring
(3,  2,  FALSE), (4,  2,  TRUE),   -- The Last of Us
(5,  3,  FALSE), (6,  3,  TRUE),   -- Spider-Man 2
(7,  4,  FALSE), (8,  4,  TRUE),   -- Apex Legends
(9,  5,  FALSE), (10, 5,  TRUE),   -- CoD MW3
(11, 6,  FALSE), (12, 6,  TRUE),   -- Zelda TotK
(13, 7,  FALSE), (14, 7,  TRUE),   -- Hogwarts Legacy
(15, 8,  FALSE), (16, 8,  TRUE),   -- God of War Ragnarok
(17, 9,  FALSE), (18, 9,  TRUE),   -- Cyberpunk 2077
(19, 10, FALSE), (20, 10, TRUE),   -- Final Fantasy XVI
(21, 11, FALSE), (22, 11, TRUE),   -- RE4 Remake
(23, 12, FALSE), (24, 12, TRUE),   -- Starfield
(25, 13, FALSE), (26, 13, TRUE),   -- AC Mirage
(27, 14, FALSE), (28, 14, TRUE),   -- Street Fighter 6
(29, 15, FALSE), (30, 15, TRUE),   -- GTA V
(31, 16, FALSE), (32, 16, TRUE),   -- RDR2
(33, 17, FALSE), (34, 17, TRUE),   -- Baldurs Gate 3
(35, 18, FALSE), (36, 18, TRUE),   -- Sonic Frontiers
(37, 19, FALSE), (38, 19, TRUE),   -- Witcher 3
(39, 20, FALSE), (40, 20, TRUE),   -- Dragon Age Inquisition
(41, 21, FALSE), (42, 21, TRUE),   -- Monster Hunter World
(43, 22, FALSE), (44, 22, TRUE),   -- Devil May Cry 5
(45, 23, FALSE), (46, 23, TRUE),   -- FIFA 24
(47, 24, FALSE), (48, 24, TRUE),   -- Forza Horizon 5
(49, 25, FALSE), (50, 25, TRUE);   -- Hades

DELETE FROM game_previews;
INSERT INTO game_previews (game_id, preview_id, url) VALUES
(1, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_943bf6fe62352757d9070c1d33e50b92fe8539f1.1920x1080.jpg?t=1767883716')
,(1, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_dcdac9e4b26ac0ee5248bfd2967d764fd00cdb42.1920x1080.jpg?t=1767883716')
,(1, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_3c41384a24d86dddd58a8f61db77f9dc0bfda8b5.1920x1080.jpg?t=1767883716')
,(1, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_e0316c76f8197405c1312d072b84331dd735d60b.1920x1080.jpg?t=1767883716')
,(1, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_ef61b771ee6b269b1f0cb484233e07a0bfb5f81b.1920x1080.jpg?t=1767883716')
,(1, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_b1b91299d7e4b94201ac840aa64de54d9f5cb7f3.1920x1080.jpg?t=1767883716')
,(1, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_510a02cf3045e841e180f2b77fb87545e0c8b59d.1920x1080.jpg?t=1767883716')
,(1, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_c494372930ca791bdc6221eca134f2270fb2cb9f.1920x1080.jpg?t=1767883716')
,(1, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_fa6b881ef7c30522012ab2b2b83001e79baee093.1920x1080.jpg?t=1767883716')
,(1, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1245620/ss_c2baf8aada6140beee79d701d14043899e91af47.1920x1080.jpg?t=1767883716')
,(2, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_3f1805ecddafacee7f61f87cb8e4624435a83ee3.1920x1080.jpg?t=1750959031')
,(2, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_89fffc2857dcae29dee2a09f1be33d745610e19d.1920x1080.jpg?t=1750959031')
,(2, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_8cd55ab975b2e47f4d4d9a0da4ae6948040ef807.1920x1080.jpg?t=1750959031')
,(2, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_f4829000d3677a9b5b2f234482a7deff12b31ac9.1920x1080.jpg?t=1750959031')
,(2, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_3bed642215856b863799884f6f11671a1ef014d4.1920x1080.jpg?t=1750959031')
,(2, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_a80060b89b2c81121c2d7a3fc2a3b13ddc18a0a6.1920x1080.jpg?t=1750959031')
,(2, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_412d9b0e95b40f3111b5b7d830c4bf6354ed42a6.1920x1080.jpg?t=1750959031')
,(2, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_98b476104b239764ba2a3280b1a9e09a24701041.1920x1080.jpg?t=1750959031')
,(2, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_1fdb892568d2ea8e8df9810c43e3b4dba8996a51.1920x1080.jpg?t=1750959031')
,(2, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_4b82b51ca2d09c971d73ec464a3cb5e7b3e04716.1920x1080.jpg?t=1750959031')
,(2, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_c2853eee7ca824c42e008e83f3f45ad42d9e8547.1920x1080.jpg?t=1750959031')
,(2, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_abc373417afe2172ddf7b6d91442a14366a46975.1920x1080.jpg?t=1750959031')
,(2, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_0330e4473e70f6c0850f38204d712d5aa66e6223.1920x1080.jpg?t=1750959031')
,(2, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_ec1a71230d4fb477282fa7f25688af37b702ce49.1920x1080.jpg?t=1750959031')
,(2, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_ea8b45bb65d05fafa911387df16399ead11e6878.1920x1080.jpg?t=1750959031')
,(2, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_1d4757f62cb17a674f451ab18136a87fe5959ad5.1920x1080.jpg?t=1750959031')
,(2, 17, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_5d7cf9e0857d10924def80a1bb0ce8f5f8da1b02.1920x1080.jpg?t=1750959031')
,(2, 18, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_3ee73e4d741ba90d9bbabaae105c3e6d2e7941a3.1920x1080.jpg?t=1750959031')
,(2, 19, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_e67d2ca76b0c8985a3615afb38c21e893df73272.1920x1080.jpg?t=1750959031')
,(2, 20, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_56a85dbf963bda77e1f9e7aefebbed025f33e6f3.1920x1080.jpg?t=1750959031')
,(2, 21, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_32792cba98a3e8e807d1fdcd835202f46e2999c2.1920x1080.jpg?t=1750959031')
,(2, 22, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1888930/ss_4a74a42ccfbaa370b38df2526719c7eaa173a0f5.1920x1080.jpg?t=1750959031')
,(3, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_e4b67059ddedaeebd91fce113745f3eb99736f56.1920x1080.jpg?t=1763569811')
,(3, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_b4be948946130b7e140be82f24f1f9ccefae9117.1920x1080.jpg?t=1763569811')
,(3, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_f4140ba12158b812d9c1adc86c484d8e84b92e92.1920x1080.jpg?t=1763569811')
,(3, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_7ef8bc176702470fdc73f62f8e537c3912e70444.1920x1080.jpg?t=1763569811')
,(3, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_474a7ffe98998719c22025cc99da1f45dfca025e.1920x1080.jpg?t=1763569811')
,(3, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_aa8346cf207a1e114c5f9e7f6c3086c5dc9c3050.1920x1080.jpg?t=1763569811')
,(3, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_b34716a6d4505bfe32f83530e46aac5a5728f441.1920x1080.jpg?t=1763569811')
,(3, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_0fda7c96ee3f16038559fffa8c2cd7b3ac433c2b.1920x1080.jpg?t=1763569811')
,(3, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_2fb76f7e76dbddf87715d18ae1bcb5cd1dda5747.1920x1080.jpg?t=1763569811')
,(3, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_74e612eb0ae275bd6e7f69d407dda8b03d83629f.1920x1080.jpg?t=1763569811')
,(3, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_03d59d4e4a6638b1e0200bc3dde2a0b0d1a43ada.1920x1080.jpg?t=1763569811')
,(3, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_cde4862328227ea8cfb2981c92b6411b705ed0f4.1920x1080.jpg?t=1763569811')
,(3, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2651280/ss_c6a0adf568d91d49a5c0f7f5e4df7e1cef71ee28.1920x1080.jpg?t=1763569811')
,(4, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/d86d5fe798addd4ff7219938f891268affb1ea2d/ss_d86d5fe798addd4ff7219938f891268affb1ea2d.1920x1080.jpg?t=1770753360')
,(4, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/f786d0d1e567be0e5a801a62855970f9b6bae6fd/ss_f786d0d1e567be0e5a801a62855970f9b6bae6fd.1920x1080.jpg?t=1770753360')
,(4, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/c1f5eb613c365fc96f5d59dd69bd852793929f69/ss_c1f5eb613c365fc96f5d59dd69bd852793929f69.1920x1080.jpg?t=1770753360')
,(4, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/3424111e83c2adfc7e6c056573d5089c27fdc711/ss_3424111e83c2adfc7e6c056573d5089c27fdc711.1920x1080.jpg?t=1770753360')
,(4, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/339c1a98c4ae3a6d662e2766cad9660c3ca8f8aa/ss_339c1a98c4ae3a6d662e2766cad9660c3ca8f8aa.1920x1080.jpg?t=1770753360')
,(4, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/07975408cfe38c64a9dc60885908614488dd7ac0/ss_07975408cfe38c64a9dc60885908614488dd7ac0.1920x1080.jpg?t=1770753360')
,(4, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/7050e6270b93cce9ff0ed2d2f455ff63b2d4db1c/ss_7050e6270b93cce9ff0ed2d2f455ff63b2d4db1c.1920x1080.jpg?t=1770753360')
,(4, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1172470/749581e184be808f7ab67018746940d040bace0a/ss_749581e184be808f7ab67018746940d040bace0a.1920x1080.jpg?t=1770753360')
,(5, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/8694e5cb8262343c867d8f8edb70526b19b49cf8/ss_8694e5cb8262343c867d8f8edb70526b19b49cf8.1920x1080.jpg?t=1764711750')
,(5, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/757e49ee3ff2b6ebf60e479731d983cec47faa41/ss_757e49ee3ff2b6ebf60e479731d983cec47faa41.1920x1080.jpg?t=1764711750')
,(5, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/f713211188a2a872d638089b2d959a337639e91a/ss_f713211188a2a872d638089b2d959a337639e91a.1920x1080.jpg?t=1764711750')
,(5, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/ee37e2686b1a21ede5b74e853d046ba9bd087878/ss_ee37e2686b1a21ede5b74e853d046ba9bd087878.1920x1080.jpg?t=1764711750')
,(5, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/e23921966033db7075d68e33e233120756357093/ss_e23921966033db7075d68e33e233120756357093.1920x1080.jpg?t=1764711750')
,(5, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/f778362cc479898f1f54f5e4de4f88130cf2b140/ss_f778362cc479898f1f54f5e4de4f88130cf2b140.1920x1080.jpg?t=1764711750')
,(5, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/2a5b9db9430ee79aed122a309460e8c121d67765/ss_2a5b9db9430ee79aed122a309460e8c121d67765.1920x1080.jpg?t=1764711750')
,(5, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/1db97cd94c0f2c80016967904ccc43a72df79f98/ss_1db97cd94c0f2c80016967904ccc43a72df79f98.1920x1080.jpg?t=1764711750')
,(5, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/2d536bd00da327ced20e890eb900d6ad6053ba42/ss_2d536bd00da327ced20e890eb900d6ad6053ba42.1920x1080.jpg?t=1764711750')
,(5, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/3595270/c76407bd14ff3b516494e59298c66a19b88b9102/ss_c76407bd14ff3b516494e59298c66a19b88b9102.1920x1080.jpg?t=1764711750')
,(7, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/990080/ss_725bf58485beb4aa37a3a69c1e2baa69bf3e4653.1920x1080.jpg?t=1773932856')
,(7, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/990080/ss_df93b5e8a183f7232d68be94ae78920a90de1443.1920x1080.jpg?t=1773932856')
,(7, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/990080/ss_94058497bf0f8fabdde17ee8d59bece609a60663.1920x1080.jpg?t=1773932856')
,(7, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/990080/ss_8e08976236d29b1897769257ac3c64e9264792a5.1920x1080.jpg?t=1773932856')
,(7, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/990080/ss_d4930d675af053dc1e61a876a34fc003e85e261f.1920x1080.jpg?t=1773932856')
,(8, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_7c59382e67eadf779e0e15c3837ee91158237f11.1920x1080.jpg?t=1750909504')
,(8, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_05f27139b15c5410d07cd59b7b52adbdf73e13da.1920x1080.jpg?t=1750909504')
,(8, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_974a7b998c0c14da7fe52a342cf36c98850a57ac.1920x1080.jpg?t=1750909504')
,(8, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_78350297511e81f287b4bc361935efbc3016f6db.1920x1080.jpg?t=1750909504')
,(8, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_7cbcd6847cac4d2d42f496954d0df715c6af0b3a.1920x1080.jpg?t=1750909504')
,(8, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_c6240e5611e6aa1c2219dbf778f79b2b5244d912.1920x1080.jpg?t=1750909504')
,(8, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_5f1bca8b9b0de6e747f1849b0d459b9a6ce614e7.1920x1080.jpg?t=1750909504')
,(8, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_1848b58003fcc199092227f871770a216d9430f9.1920x1080.jpg?t=1750909504')
,(8, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_0ac7ad0a72243bc405131af24328faeeeffb1b73.1920x1080.jpg?t=1750909504')
,(8, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_3eaf327c18df7ba72cbb00bb8f62d5a6ecd9afe8.1920x1080.jpg?t=1750909504')
,(8, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_244a3845262a2a15b3a355ecf2881b8ccd5b1401.1920x1080.jpg?t=1750909504')
,(8, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_97adb8f0fe83a8b297c3e107497e31b618746651.1920x1080.jpg?t=1750909504')
,(8, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_debcd99977362c3c9f24aa58e38b6133cbc35d0f.1920x1080.jpg?t=1750909504')
,(8, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_ba494253a54ee2dedce6b4cc3c4a4523dace0a37.1920x1080.jpg?t=1750909504')
,(8, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2322010/ss_ada650347f78592237dd3ca48ac7834ac9e22747.1920x1080.jpg?t=1750909504')
,(9, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_2f649b68d579bf87011487d29bc4ccbfdd97d34f.1920x1080.jpg?t=1769690377')
,(9, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_0e64170751e1ae20ff8fdb7001a8892fd48260e7.1920x1080.jpg?t=1769690377')
,(9, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_af2804aa4bf35d4251043744412ce3b359a125ef.1920x1080.jpg?t=1769690377')
,(9, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_7924f64b6e5d586a80418c9896a1c92881a7905b.1920x1080.jpg?t=1769690377')
,(9, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_4eb068b1cf52c91b57157b84bed18a186ed7714b.1920x1080.jpg?t=1769690377')
,(9, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_b529b0abc43f55fc23fe8058eddb6e37c9629a6a.1920x1080.jpg?t=1769690377')
,(9, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_8640d9db74f7cad714f6ecfb0e1aceaa3f887e58.1920x1080.jpg?t=1769690377')
,(9, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_9284d1c5b248726760233a933dbb83757d7d5d95.1920x1080.jpg?t=1769690377')
,(9, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_4bda6f67580d94832ed2d5814e41ebe018ba1d9e.1920x1080.jpg?t=1769690377')
,(9, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_e5a94665dbfa5a30931cff2f45cdc0ebea9fcebb.1920x1080.jpg?t=1769690377')
,(9, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_429db1d013a0366417d650d84f1eff02d1a18c2d.1920x1080.jpg?t=1769690377')
,(9, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_872822c5e50dc71f345416098d29fc3ae5cd26c1.1920x1080.jpg?t=1769690377')
,(9, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_ae4465fa8a44dd330dbeb7992ba196c2f32cabb1.1920x1080.jpg?t=1769690377')
,(9, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_f79fda81e6f3a37e0978054102102d71840f8b57.1920x1080.jpg?t=1769690377')
,(9, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_bb1a60b8e5061caef7208369f42c5c9d574c9ac4.1920x1080.jpg?t=1769690377')
,(9, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_a0c4e4015b5cf766d19bf97eee8b086183510e04.1920x1080.jpg?t=1769690377')
,(9, 17, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_b20689e73e3ac19bcc5fad2c18d0353c769de144.1920x1080.jpg?t=1769690377')
,(9, 18, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_ff3d920e254d18aa2a25d3765ac2ebe845efd208.1920x1080.jpg?t=1769690377')
,(9, 19, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_0002f18563d313bdd1d82c725d411408ebf762b0.1920x1080.jpg?t=1769690377')
,(9, 20, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_526123764d1c628caa1eb62c596f1b732f416c8c.1920x1080.jpg?t=1769690377')
,(9, 21, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_284ba40590de8f604ae693631c751a0aefdc452e.1920x1080.jpg?t=1769690377')
,(9, 22, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/ss_9beef14102f164fa1163536d0fb3a51d0a2e4a3f.1920x1080.jpg?t=1769690377')
,(10, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_99530c1f839832ceeab2cf3450d5c0905312de47.1920x1080.jpg?t=1773294537')
,(10, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_7620e893321e1661bdf821617f349196c2b0019f.1920x1080.jpg?t=1773294537')
,(10, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_04ef537e3123d4a8dcbbadccc190cf87dee67783.1920x1080.jpg?t=1773294537')
,(10, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_d3aea73c0bea755c7152ee339ebb7f7dfefe8f91.1920x1080.jpg?t=1773294537')
,(10, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_90a7849fb556c73db88ac37afb1cce44ac39bfab.1920x1080.jpg?t=1773294537')
,(10, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_656229eb5e6846753160378c748d7d32143cf55a.1920x1080.jpg?t=1773294537')
,(10, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_1f19a79460eba5d3d7f88bf6488f17c29f374a84.1920x1080.jpg?t=1773294537')
,(10, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_cd52855dc62ce1488379d7f831acd4423b05c02a.1920x1080.jpg?t=1773294537')
,(10, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_8f22781f1fbea926f39157b5f6600cbbdbe7f930.1920x1080.jpg?t=1773294537')
,(10, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_7c550cc10ccf287489a3e63a0c3b08558814e327.1920x1080.jpg?t=1773294537')
,(10, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2515020/ss_a3b7190f4bbba01dc589f8a8f23efdf663192091.1920x1080.jpg?t=1773294537')
,(11, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_59d1b19964cc532213df92c8287b75a0bffeb33c.1920x1080.jpg?t=1772502922')
,(11, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_ab807f8ad9e968a620777caf483cb6020367b9ee.1920x1080.jpg?t=1772502922')
,(11, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_0442f7fb4327d79802c2db8ea8d23d228a28d896.1920x1080.jpg?t=1772502922')
,(11, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_69810f4cd155912fdfdd21da70181df7d454c874.1920x1080.jpg?t=1772502922')
,(11, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_0596bac955340495562f3ff2538756ebd9a7f073.1920x1080.jpg?t=1772502922')
,(11, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_0554b945aafc847d55f780f7968de00aafa968a3.1920x1080.jpg?t=1772502922')
,(11, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_29ffb23060c862bcbe1d1434e83d41ab10484d8e.1920x1080.jpg?t=1772502922')
,(11, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_22d21ef8c4e54cc5f8418f9b233178bf7869ee01.1920x1080.jpg?t=1772502922')
,(11, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_5a4297e594297a13f1f4c665966eb3d88d37b58d.1920x1080.jpg?t=1772502922')
,(11, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_440756cbcb0231dd325991d38b85d3b60d976b95.1920x1080.jpg?t=1772502922')
,(11, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_72888d13c9e3995f05a2886a51f0dc8791e28afa.1920x1080.jpg?t=1772502922')
,(11, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_d90819dc43141eee26b69a6cab43be00164adcb0.1920x1080.jpg?t=1772502922')
,(11, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_b9fbb8b2d7e1204a074033e9bb9a19fa54f765fb.1920x1080.jpg?t=1772502922')
,(11, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_d8967ced32ccbbd94f852b3843a5b76febf3ef16.1920x1080.jpg?t=1772502922')
,(11, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_98d9687b6acf5feff600b483d9f30e52079091e9.1920x1080.jpg?t=1772502922')
,(11, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_82cef99075c8e19ec71d2aae8b0a19815695c5a7.1920x1080.jpg?t=1772502922')
,(11, 17, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2050650/ss_2f026b10ab2facd11820737453512b3b88c5a863.1920x1080.jpg?t=1772502922')
,(12, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_4887dc140a637684ddcfca518458668409f946dc.1920x1080.jpg?t=1775743548')
,(12, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_b2821283cb140cd5a6289a8160016b6a60d8f96e.1920x1080.jpg?t=1775743548')
,(12, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_68f15d580bf91971f637be5e464bc803482d78f7.1920x1080.jpg?t=1775743548')
,(12, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_aae99c177004bb5ec653d2fcb65a5d30489ec7b8.1920x1080.jpg?t=1775743548')
,(12, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_c8594798fadfd8e042b2fc8afff7bcf4872c5198.1920x1080.jpg?t=1775743548')
,(12, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_2288919a390c0147b7d2226354a61452016fd087.1920x1080.jpg?t=1775743548')
,(12, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_45c1dc3cd5399eb16230ed85dab25ce945c46726.1920x1080.jpg?t=1775743548')
,(12, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_930710a45c08eaa4c10fa0be7c0663900e1d32f3.1920x1080.jpg?t=1775743548')
,(12, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1716740/ss_177d2492278d3ccc5b1c58bc96dcb63aacddb1a5.1920x1080.jpg?t=1775743548')
,(13, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2679870/ss_8e46370f76bf305c3d5ec5e38a1f02a08389d360.1920x1080.jpg?t=1755024430')
,(13, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2679870/ss_47129e8ead5dffec6f9c03789d8d097e59e74295.1920x1080.jpg?t=1755024430')
,(13, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2679870/ss_e41325055c81a15bc2c8314ac33b152a89387d20.1920x1080.jpg?t=1755024430')
,(13, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2679870/ss_c854e6319b1c8c4e308a9825da41f31521bc7b1d.1920x1080.jpg?t=1755024430')
,(13, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2679870/ss_f7626d0d5ad84036364489d0afb64b1987b0fbed.1920x1080.jpg?t=1755024430')
,(14, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_387137f8cccb048c35a8685634372e97785d40aa.1920x1080.jpg?t=1773812087')
,(14, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_a381f1b3b450c18900d47b991ce8e7456e9cdba5.1920x1080.jpg?t=1773812087')
,(14, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_f62ce93269a6d8e0027853358af4d6368e2c4b93.1920x1080.jpg?t=1773812087')
,(14, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_d186566a92ada8cdb08b04769a8c95cd1e380006.1920x1080.jpg?t=1773812087')
,(14, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_ed46aaa9ed94dd6f35a703070f8df16cee5aef61.1920x1080.jpg?t=1773812087')
,(14, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_10191fb5ab48cee99d7a43e636db9202938f143e.1920x1080.jpg?t=1773812087')
,(14, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_449d488d2edbe785c4e6010fede1c3b8dae8e388.1920x1080.jpg?t=1773812087')
,(14, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_2cfc2472e7ff99fd354935135d91e36e81951795.1920x1080.jpg?t=1773812087')
,(14, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_3ceb422dbef5f8495e690ed526f684fdcb1022ec.1920x1080.jpg?t=1773812087')
,(14, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1364780/ss_201488fc9f1aa5e29e2fc6d96ef2b66e41ddf32e.1920x1080.jpg?t=1773812087')
,(15, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_32aa18ab3175e3002217862dd5917646d298ab6b.1920x1080.jpg?t=1765387725')
,(15, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_2744f112fa060320d191a50e8b3a92441a648a56.1920x1080.jpg?t=1765387725')
,(15, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_da39c16db175f6973770bae6b91d411251763152.1920x1080.jpg?t=1765387725')
,(15, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_bd5db78286be0a7c6b2c62519099a9e27e6b06f3.1920x1080.jpg?t=1765387725')
,(15, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_b1a1cb7959d6a0e6fcb2d06ebf97a66c9055cef3.1920x1080.jpg?t=1765387725')
,(15, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_bc5fc79d3366c837372327717249a4887aa46d63.1920x1080.jpg?t=1765387725')
,(15, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_d2eb9d3e50f9e4cb8db37d2976990b3795da8187.1920x1080.jpg?t=1765387725')
,(15, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_bd944debbec9936769f6dfb39ee456ca605615e3.1920x1080.jpg?t=1765387725')
,(15, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_66daaa8e0416b805ffb9a853235e21468d6b85bc.1920x1080.jpg?t=1765387725')
,(15, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_3820844756ae43340809e247fea327025dca1e39.1920x1080.jpg?t=1765387725')
,(15, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_5eafc9316db476e74c1b38b25f15c1326f4d574a.1920x1080.jpg?t=1765387725')
,(15, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_fbb16a4376f0205178de722aa14b9d243c2a47ea.1920x1080.jpg?t=1765387725')
,(15, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_bab596ea9a6924055cd8c097bba75f052c18025d.1920x1080.jpg?t=1765387725')
,(15, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_c5df068273a036bf224c89d3fcd534811790a808.1920x1080.jpg?t=1765387725')
,(15, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_1487c2c7ddd9a1ae6b55f7e50d5d63ada6915921.1920x1080.jpg?t=1765387725')
,(15, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ef2be2226f012c4c1bc6f04ab8ed35ca3ffc8342.1920x1080.jpg?t=1765387725')
,(15, 17, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_3b7d6905185d1fd12eeaba603a55c0a246985f02.1920x1080.jpg?t=1765387725')
,(15, 18, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_a3d4e239735052cd2c81722aa2930b6fcefa9bec.1920x1080.jpg?t=1765387725')
,(15, 19, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_e8cd9901cec9bc5e7c6b8a9dc3e746fa77988a26.1920x1080.jpg?t=1765387725')
,(15, 20, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_549709ca54069eb849986204adb0fe438853e48d.1920x1080.jpg?t=1765387725')
,(15, 21, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_e3412658add19155ba35d6c80862559bf002845d.1920x1080.jpg?t=1765387725')
,(15, 22, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ea4a3bab5f7ba3a6fcf8067c2864b9d349fe387c.1920x1080.jpg?t=1765387725')
,(15, 23, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_90f67258a3d991fe1b72030e56035ede688a82d7.1920x1080.jpg?t=1765387725')
,(15, 24, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_4322495419b762d3e0ca2e31e61dff9a86eac3e9.1920x1080.jpg?t=1765387725')
,(15, 25, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_d7f501f20ed23e2ee0e5e6b3c09922021c2f9aaa.1920x1080.jpg?t=1765387725')
,(15, 26, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_e65286ab9bba88c6d0d9ad30cf6b5d34578c51ce.1920x1080.jpg?t=1765387725')
,(15, 27, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_e929649b2b98ad76795d92d8489470bc5dbffddb.1920x1080.jpg?t=1765387725')
,(15, 28, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_e080b9646300458e7e6fde55ad68c8fd3650371c.1920x1080.jpg?t=1765387725')
,(15, 29, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_62a2f95c1784f138c3abbecf376c5cc99cc94a57.1920x1080.jpg?t=1765387725')
,(15, 30, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_a5ca40b51e95d5c592e5eb77b3d78d5149ea5fd6.1920x1080.jpg?t=1765387725')
,(15, 31, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_d1dfbddaafe8e4e8c3a4d8a9e13cdf89e2deb7ab.1920x1080.jpg?t=1765387725')
,(15, 32, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_7bcc40aa6ba276d1ec246127d2e623b75fa315eb.1920x1080.jpg?t=1765387725')
,(15, 33, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ef673abfaf1555f10c071c4e5e0cd9d513be4c3c.1920x1080.jpg?t=1765387725')
,(15, 34, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_6b3e35dfc1acf5a742998fcd21690b5cddc367df.1920x1080.jpg?t=1765387725')
,(15, 35, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_108d9c5f4244a6186662850a56898028913d28a4.1920x1080.jpg?t=1765387725')
,(15, 36, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_89040ec8716e6422260580640f485f8c825cae62.1920x1080.jpg?t=1765387725')
,(15, 37, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_0cb0627d2d4559ae6ca7be60c43a9dc4aa4e1bb3.1920x1080.jpg?t=1765387725')
,(15, 38, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_8b7ae7209f3c3422e76d452c290bd282265caa35.1920x1080.jpg?t=1765387725')
,(15, 39, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_d6b4c13c1f59fe3c3973a4289c64047c3d350201.1920x1080.jpg?t=1765387725')
,(15, 40, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_fae62fcb24412928d97ec23b6bd9473b26690596.1920x1080.jpg?t=1765387725')
,(15, 41, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_9383e097bbdba1deaa79e77f8bb6664041036066.1920x1080.jpg?t=1765387725')
,(15, 42, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_3ce5439cfdd04d1c53487f7057d45360839c0205.1920x1080.jpg?t=1765387725')
,(15, 43, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_bb5725e2200df97b28908bccb9e8268780489506.1920x1080.jpg?t=1765387725')
,(15, 44, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ea299fb00e9789ce97bc6c690d9f99180bab03ab.1920x1080.jpg?t=1765387725')
,(15, 45, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ac0dea35915ab1d7f2eacb386befb36a3b684ee6.1920x1080.jpg?t=1765387725')
,(15, 46, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_942afc86f5724f8eafb8075b123cfc848fb736da.1920x1080.jpg?t=1765387725')
,(15, 47, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_3a20a814df620793186348058d9201f1c60b1bc2.1920x1080.jpg?t=1765387725')
,(15, 48, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_d1f60c9aae855a810bcdabebf43a1e03e9600ac0.1920x1080.jpg?t=1765387725')
,(15, 49, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ff987bc8b943034c3bb989710b88dd7d629da783.1920x1080.jpg?t=1765387725')
,(15, 50, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_eb0a041f0699ad4c98c6ef2b8222c264e0435864.1920x1080.jpg?t=1765387725')
,(15, 51, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_7454420b01944e4a0f382c3a2d6c7d3d990561fb.1920x1080.jpg?t=1765387725')
,(15, 52, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_99fe78592b8c15211d9b518d921e6a104430c918.1920x1080.jpg?t=1765387725')
,(15, 53, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_80b965d66b13d6eb5e1468151a371e12fe159663.1920x1080.jpg?t=1765387725')
,(15, 54, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_1a30befe6a3ed468981a6b2aaed7d2bb79bc1ce0.1920x1080.jpg?t=1765387725')
,(15, 55, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_9efa694175609b73e9d3dca54190cbd8f6a0bc60.1920x1080.jpg?t=1765387725')
,(15, 56, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_ea78dfa1d7d81c3781287cab165f64ca70f1f2ea.1920x1080.jpg?t=1765387725')
,(15, 57, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_d1555f147b4667f70fac769985df629cbfda40b8.1920x1080.jpg?t=1765387725')
,(15, 58, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_680684304e38a9c58a55866cde99469ae8ef510c.1920x1080.jpg?t=1765387725')
,(15, 59, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_be2b9e45c671f95b8bc9fde58dbbd1154b0b633a.1920x1080.jpg?t=1765387725')
,(15, 60, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_54a59b51d9a3dbd5cf6b8d8745716b293633a50b.1920x1080.jpg?t=1765387725')
,(15, 61, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_320f7bf17d387eddb1c7153e2bf8de8e14bc4d39.1920x1080.jpg?t=1765387725')
,(15, 62, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_c7766bbf4f0800ea989e11b26991a3d90197568c.1920x1080.jpg?t=1765387725')
,(15, 63, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_65677665937a9164fb10b3194ff1d89bb1f1d848.1920x1080.jpg?t=1765387725')
,(15, 64, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_8ca5134d9826629ea01c9cfb6d8a51c2b1661e28.1920x1080.jpg?t=1765387725')
,(15, 65, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_4627498ce6ec1516512468eecfb9f90b7fdf438b.1920x1080.jpg?t=1765387725')
,(15, 66, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_3da42391c6317205177248dea0a48ced89998a8d.1920x1080.jpg?t=1765387725')
,(15, 67, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_04c349fc07c4f6244f4426ea0b49e31c8581a97d.1920x1080.jpg?t=1765387725')
,(15, 68, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_fd8843577fb31aba4b4b827b5dad6c5ac3ab890b.1920x1080.jpg?t=1765387725')
,(15, 69, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_8afff4bbd275fe7ddd56e3b5dc77f6658acf207e.1920x1080.jpg?t=1765387725')
,(15, 70, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_bb2ee3b9b48a60857873192cfff10546e01d4a86.1920x1080.jpg?t=1765387725')
,(15, 71, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_cd721eb1856f0dd3b820e4e998c3b5fe7e7c9b4e.1920x1080.jpg?t=1765387725')
,(15, 72, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_6efecf505052b51071024f32dc4db364cbb0ab6e.1920x1080.jpg?t=1765387725')
,(15, 73, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_43e9c59d968e7f99f1eef065af85b3e542100366.1920x1080.jpg?t=1765387725')
,(15, 74, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_f64515607fd627aa9436be3b15fdcb9e1c89bb19.1920x1080.jpg?t=1765387725')
,(15, 75, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_95a1f04eb687eae71478c0c5ba644da57e10f215.1920x1080.jpg?t=1765387725')
,(15, 76, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/271590/ss_873c72ecd65c4a9e17f0b3535bc8579a4616394e.1920x1080.jpg?t=1765387725')
,(16, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1174180/ss_66b553f4c209476d3e4ce25fa4714002cc914c4f.1920x1080.jpg?t=1759502961')
,(16, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1174180/ss_bac60bacbf5da8945103648c08d27d5e202444ca.1920x1080.jpg?t=1759502961')
,(16, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1174180/ss_668dafe477743f8b50b818d5bbfcec669e9ba93e.1920x1080.jpg?t=1759502961')
,(16, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1174180/ss_4ce07ae360b166f0f650e9a895a3b4b7bf15e34f.1920x1080.jpg?t=1759502961')
,(16, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1174180/ss_d1a8f5a69155c3186c65d1da90491fcfd43663d9.1920x1080.jpg?t=1759502961')
,(17, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_c73bc54415178c07fef85f54ee26621728c77504.1920x1080.jpg?t=1773079016')
,(17, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_73d93bea842b93914d966622104dcb8c0f42972b.1920x1080.jpg?t=1773079016')
,(17, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_cf936d31061b58e98e0c646aee00e6030c410cda.1920x1080.jpg?t=1773079016')
,(17, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_b6a6ee6e046426d08ceea7a4506a1b5f44181543.1920x1080.jpg?t=1773079016')
,(17, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_6b8faba0f6831a406ce015648958da9612d14dbb.1920x1080.jpg?t=1773079016')
,(17, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_8fc5eba770b4a1639b31666908bdd2bbc1aa2ae4.1920x1080.jpg?t=1773079016')
,(17, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_31c13d137706fb4d9a4210513274a3ed9c3c7c96.1920x1080.jpg?t=1773079016')
,(17, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_0efa1a469a37beeb4fd0cb8e16dc99bd36357dc4.1920x1080.jpg?t=1773079016')
,(17, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_387896248b42a15239a9256844b3e4bff72fbc2a.1920x1080.jpg?t=1773079016')
,(17, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_44d30da9c3e4622b46f2978e89bda0515856eaf4.1920x1080.jpg?t=1773079016')
,(17, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_f8c7fcdeccbfe77e3fad33330a464fed30f781f0.1920x1080.jpg?t=1773079016')
,(17, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_332cd26db210d4b10df744485ecf0a9b3f2e9024.1920x1080.jpg?t=1773079016')
,(17, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_b9f6f2d2ac2b7b2fe63d776e8e13c24b481a7b19.1920x1080.jpg?t=1773079016')
,(17, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_2c576a8e563e3338826268f172c9032c84366d16.1920x1080.jpg?t=1773079016')
,(17, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_d0b50351676da10c5403ec904cf7582636e65346.1920x1080.jpg?t=1773079016')
,(17, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_74d11c230ebb44ff9a69b4533a7333551d5bfc6c.1920x1080.jpg?t=1773079016')
,(17, 17, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_1c3ff278ac430948dc31efeb1f7d2bb0466a1493.1920x1080.jpg?t=1773079016')
,(17, 18, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_49168eeefdfb6e6030a5aed3fd7c1a83da870a9f.1920x1080.jpg?t=1773079016')
,(17, 19, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1086940/ss_3cc4e8cfcfb8a91d19d96f631f076d252ba2c0c4.1920x1080.jpg?t=1773079016')
,(18, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_8ac5bfdc998b20e4a54ee27b68ef175f7cd9f1a9.1920x1080.jpg?t=1763684832')
,(18, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_d9c769a9346e5b1d7e1f9109d0c317c81213c021.1920x1080.jpg?t=1763684832')
,(18, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_45369645d9c1c1b1fd9483b48c8a15f21b8693c5.1920x1080.jpg?t=1763684832')
,(18, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_cddd10b31502d648f964c5df550499d041212759.1920x1080.jpg?t=1763684832')
,(18, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_b355860697bafd2a16e77b97be27ffaf5c9b6609.1920x1080.jpg?t=1763684832')
,(18, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_e115f40d130f010908ba4208ac769ad695d91406.1920x1080.jpg?t=1763684832')
,(18, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_2b77ee8ba5497f29409d1110dd3010161be3da91.1920x1080.jpg?t=1763684832')
,(18, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1237320/ss_9817ace7705cf9096bde3fae0141055d170fbf66.1920x1080.jpg?t=1763684832')
,(19, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_5710298af2318afd9aa72449ef29ac4a2ef64d8e.1920x1080.jpg?t=1768303991')
,(19, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_0901e64e9d4b8ebaea8348c194e7a3644d2d832d.1920x1080.jpg?t=1768303991')
,(19, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_112b1e176c1bd271d8a565eacb6feaf90f240bb2.1920x1080.jpg?t=1768303991')
,(19, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_d1b73b18cbcd5e9e412c7a1dead3c5cd7303d2ad.1920x1080.jpg?t=1768303991')
,(19, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.1920x1080.jpg?t=1768303991')
,(19, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_64eb760f9a2b67f6731a71cce3a8fb684b9af267.1920x1080.jpg?t=1768303991')
,(19, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_eda99e7f705a113d04ab2a7a36068f3e7b343d17.1920x1080.jpg?t=1768303991')
,(19, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_d5b80eb63c12a6484f26796f3e34410651bba068.1920x1080.jpg?t=1768303991')
,(19, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_b74d60ee215337d765e4d20c8ca6710ae2362cc2.1920x1080.jpg?t=1768303991')
,(19, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_dc55eeb409d6e187456a8e159018e8da098fa468.1920x1080.jpg?t=1768303991')
,(19, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_849ec8dcc6f8df1c0b2c509584c9fc9e51f88cfa.1920x1080.jpg?t=1768303991')
,(19, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_90a33d7764a2d23306091bfcb52265c3506b4fdb.1920x1080.jpg?t=1768303991')
,(19, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_07812c174bb6b96c29895ddc27404143df7aba6d.1920x1080.jpg?t=1768303991')
,(19, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.1920x1080.jpg?t=1768303991')
,(19, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_dc33eb233555c13fce939ccaac667bc54e3c4a27.1920x1080.jpg?t=1768303991')
,(19, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.1920x1080.jpg?t=1768303991')
,(19, 17, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_608af6cfe0eab3f37265550b391732a3e88d1a4f.1920x1080.jpg?t=1768303991')
,(19, 18, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/ss_8ac1dc847388e59b1be1c5ea5ca592d5861756cc.1920x1080.jpg?t=1768303991')
,(20, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1222690/ss_4c90bdbb1c2567edec0778f2e8956d1a8ff1b4c3.1920x1080.jpg?t=1726253375')
,(20, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1222690/ss_a106df995b9051e24ebe5abdec168ea3495bfda4.1920x1080.jpg?t=1726253375')
,(20, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1222690/ss_e8e2d622313d983fc9eb3fd824a2e0401c247780.1920x1080.jpg?t=1726253375')
,(20, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1222690/ss_df4fb7825aef29e53e4b3e5dbb6c8dc6cd6e16d9.1920x1080.jpg?t=1726253375')
,(20, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1222690/ss_428d0d34e11bd8fad4f4f4fb0fd3245d632e6bb7.1920x1080.jpg?t=1726253375')
,(21, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_a262c53b8629de7c6547933dc0b49d31f4e1b1f1.1920x1080.jpg?t=1773328926')
,(21, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_6b4986a37c7b5c185a796085c002febcdd5357b5.1920x1080.jpg?t=1773328926')
,(21, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_0dfb20f6f09c196bfc317bd517dc430ed6e6a2a4.1920x1080.jpg?t=1773328926')
,(21, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_25902a9ae6977d6d10ebff20b87e8739e51c5b8b.1920x1080.jpg?t=1773328926')
,(21, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_681cc5358ec55a997aee9f757ffe8b418dc79a32.1920x1080.jpg?t=1773328926')
,(21, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_ce69dc57e6e442c73d874f1b701f2e4af405fb19.1920x1080.jpg?t=1773328926')
,(21, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_6d26868b45c20bf4dd5f75f31264aca08ce17217.1920x1080.jpg?t=1773328926')
,(21, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/582010/ss_669f9008f708c19fe3c41d647516f7a73bf26d24.1920x1080.jpg?t=1773328926')
,(22, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/601150/ss_4410bada2565843dae693b03ac3a50256ff5dd66.1920x1080.jpg?t=1768869803')
,(22, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/601150/ss_4ce180ed8979a51c72de51f985e9e9ba13500508.1920x1080.jpg?t=1768869803')
,(22, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/601150/ss_e2be70565f94a7f6c392cccddce08c67f2f87612.1920x1080.jpg?t=1768869803')
,(22, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/601150/ss_d1e0b403f593f17ad195c5382a7788d71c6f406a.1920x1080.jpg?t=1768869803')
,(22, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/601150/ss_f669d4627db07e61b87728d94d72bc1eabfd0349.1920x1080.jpg?t=1768869803')
,(23, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_f3d31c7cffc2a6ab42fb76aaac2bc9d5258bc142.1920x1080.jpg?t=1752167366')
,(23, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_6c1ef918ffe94050e72dcb2cfad3a95ee3d69f08.1920x1080.jpg?t=1752167366')
,(23, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_eb8f5def662f28726c875e641cd5faff75e6b16d.1920x1080.jpg?t=1752167366')
,(23, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_96496b17bd35a97ceb926231e963762d3b86c3c8.1920x1080.jpg?t=1752167366')
,(23, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_855738ea72e6f90ee0e0b0cedba55848423389e1.1920x1080.jpg?t=1752167366')
,(23, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_0f175ec10150f890fe3beb3c8dde3abc2b4c1d62.1920x1080.jpg?t=1752167366')
,(23, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_33527a88323cbb39a7c09d7d74955015343efd3f.1920x1080.jpg?t=1752167366')
,(23, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_3cb608240d4897f04f0b040eef924470c72856fb.1920x1080.jpg?t=1752167366')
,(23, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_b68a973175bebbdf7a189efa43c927899dc95240.1920x1080.jpg?t=1752167366')
,(23, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_5320cc6b6c7fd39b41defe0570c3182df7065fd5.1920x1080.jpg?t=1752167366')
,(23, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_9f938a3a35084f527b9b7b547b8dabd0ddd57981.1920x1080.jpg?t=1752167366')
,(23, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_2fa9762aa7fdc139ae78787b4abb3f9a8e99d071.1920x1080.jpg?t=1752167366')
,(23, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_3c44274b84e6a0c1ba41a3f19c88736d2eb0cb1a.1920x1080.jpg?t=1752167366')
,(23, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/2195250/ss_f5d78591802a7a73690cdff9dfc7750e0b4c5101.1920x1080.jpg?t=1752167366')
,(24, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_cf56e25a0290556ba83229eb0ab370d10be0407c.1920x1080.jpg?t=1746471508')
,(24, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_00f0090174380eeaf8753bd3d1028b6772c3aebf.1920x1080.jpg?t=1746471508')
,(24, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_b65236b365315ebb6da6114ce42cd74b59cab3c8.1920x1080.jpg?t=1746471508')
,(24, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_0a13a7ccd38e7c3e6a5f1720050732833b53b6a8.1920x1080.jpg?t=1746471508')
,(24, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_3654a5988db68f9b47740f9f6a9299682c365599.1920x1080.jpg?t=1746471508')
,(24, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_0bc32360d32b21abdf889422385cd753862dd73e.1920x1080.jpg?t=1746471508')
,(24, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_1da0673f82eccc3c9d222237dec40e36bf10eef3.1920x1080.jpg?t=1746471508')
,(24, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_78e4f63e05d50e59b9966ba8da9a53dbf84fd8f4.1920x1080.jpg?t=1746471508')
,(24, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_c8390c1e88ba5e660a58e8e435ebc77dcda5c91d.1920x1080.jpg?t=1746471508')
,(24, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_3c16188972c826942f47991d91b0f6dc17e01fc9.1920x1080.jpg?t=1746471508')
,(24, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_49297af1ddef7779e644c2deb1df611a5f5cd344.1920x1080.jpg?t=1746471508')
,(24, 12, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_733100a0e305025cfea4797c14cb55a9e2673521.1920x1080.jpg?t=1746471508')
,(24, 13, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_4f2da231c28c5cb6a1ed4f62aaad6f51ca4a5c05.1920x1080.jpg?t=1746471508')
,(24, 14, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_af9712cbc5121307926cb3e7dfc7228d45940557.1920x1080.jpg?t=1746471508')
,(24, 15, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_d26239d188301bb6f2475c6d323ae007195b7542.1920x1080.jpg?t=1746471508')
,(24, 16, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1551360/ss_16be1ecc46e7c0a3aa68e646af904c66ea8e1c81.1920x1080.jpg?t=1746471508')
,(25, 1, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_c0fed447426b69981cf1721756acf75369801b31.1920x1080.jpg?t=1758127023')
,(25, 2, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_8a9f0953e8a014bd3df2789c2835cb787cd3764d.1920x1080.jpg?t=1758127023')
,(25, 3, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_68300459a8c3daacb2ec687adcdbf4442fcc4f47.1920x1080.jpg?t=1758127023')
,(25, 4, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_bcb499a0dd001f4101823f99ec5094d2872ba6ee.1920x1080.jpg?t=1758127023')
,(25, 5, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_8e07e477fa7ff2f88c8984bc89b9652a655da0e9.1920x1080.jpg?t=1758127023')
,(25, 6, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_34e6660705cfe47d2b2f95189c37f7cb77f75ca6.1920x1080.jpg?t=1758127023')
,(25, 7, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_217b70678a2eea71a974fba1a4cd8baa660581bb.1920x1080.jpg?t=1758127023')
,(25, 8, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_5e52844b891b54608eb51a850d6b53313eeed0f7.1920x1080.jpg?t=1758127023')
,(25, 9, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_abb2427810a4e91cc600f37c3630b912d4e0191b.1920x1080.jpg?t=1758127023')
,(25, 10, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_2a9e3f9ad4d29d900b890d56361be5b1634225a0.1920x1080.jpg?t=1758127023')
,(25, 11, 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/ss_e0622b5a57521b76182d7e7e1ae47ee440edcf90.1920x1080.jpg?t=1758127023')
;
