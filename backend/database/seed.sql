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
('Nintendo',            'https://cdn.gamechop.com/publishers/nintendo/logo.png',        'https://cdn.gamechop.com/publishers/nintendo/banner.png'),
('Sony Interactive',    'https://cdn.gamechop.com/publishers/sony/logo.png',            'https://cdn.gamechop.com/publishers/sony/banner.png'),
('Microsoft Studios',   'https://cdn.gamechop.com/publishers/microsoft/logo.png',      'https://cdn.gamechop.com/publishers/microsoft/banner.png'),
('Electronic Arts',     'https://cdn.gamechop.com/publishers/ea/logo.png',              'https://cdn.gamechop.com/publishers/ea/banner.png'),
('Activision Blizzard', 'https://cdn.gamechop.com/publishers/activision/logo.png',     'https://cdn.gamechop.com/publishers/activision/banner.png'),
('Bandai Namco',        'https://cdn.gamechop.com/publishers/bandai/logo.png',          'https://cdn.gamechop.com/publishers/bandai/banner.png'),
('Ubisoft',             'https://cdn.gamechop.com/publishers/ubisoft/logo.png',         'https://cdn.gamechop.com/publishers/ubisoft/banner.png'),
('Square Enix',         'https://cdn.gamechop.com/publishers/squareenix/logo.png',     'https://cdn.gamechop.com/publishers/squareenix/banner.png'),
('Capcom',              'https://cdn.gamechop.com/publishers/capcom/logo.png',          'https://cdn.gamechop.com/publishers/capcom/banner.png'),
('Bethesda',            'https://cdn.gamechop.com/publishers/bethesda/logo.png',        'https://cdn.gamechop.com/publishers/bethesda/banner.png'),
('2K Games',            'https://cdn.gamechop.com/publishers/2k/logo.png',              'https://cdn.gamechop.com/publishers/2k/banner.png'),
('Rockstar Games',      'https://cdn.gamechop.com/publishers/rockstar/logo.png',        'https://cdn.gamechop.com/publishers/rockstar/banner.png'),
('Sega',                'https://cdn.gamechop.com/publishers/sega/logo.png',            'https://cdn.gamechop.com/publishers/sega/banner.png'),
('CD Projekt Red',      'https://cdn.gamechop.com/publishers/cdpr/logo.png',            'https://cdn.gamechop.com/publishers/cdpr/banner.png');

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

-- GAMES (25 total)
INSERT INTO games (title, summary, thumbnail, release_date, price) VALUES
-- 1
('Elden Ring',
 'A vast open world RPG set in the Lands Between, crafted by FromSoftware and George R.R. Martin.',
 'https://cdn.gamechop.com/games/elden-ring/thumbnail.png',          '2022-02-25', 59.99),
-- 2
('The Last of Us Part I',
 'A post-apocalyptic survival story following Joel and Ellie across a ruined America.',
 'https://cdn.gamechop.com/games/the-last-of-us/thumbnail.png',      '2013-06-14', 39.99),
-- 3
('Marvel Spider-Man 2',
 'Swing through New York as both Peter Parker and Miles Morales.',
 'https://cdn.gamechop.com/games/spider-man-2/thumbnail.png',        '2023-10-20', 69.99),
-- 4
('Apex Legends',
 'A free-to-play hero battle royale set in the Titanfall universe.',
 'https://cdn.gamechop.com/games/apex-legends/thumbnail.png',        '2019-02-04',  0.00),
-- 5
('Call of Duty MW3',
 'Modern military FPS with an intense campaign and expansive multiplayer.',
 'https://cdn.gamechop.com/games/cod-mw3/thumbnail.png',             '2023-11-10', 69.99),
-- 6
('The Legend of Zelda: Tears of the Kingdom',
 'Explore Hyrule from the skies to the depths in this open world sequel.',
 'https://cdn.gamechop.com/games/totk/thumbnail.png',                '2023-05-12', 69.99),
-- 7
('Hogwarts Legacy',
 'An open world RPG set in the 1800s wizarding world.',
 'https://cdn.gamechop.com/games/hogwarts-legacy/thumbnail.png',     '2023-02-10', 59.99),
-- 8
('God of War Ragnarok',
 'Kratos and Atreus journey through the Nine Realms to prevent Ragnarok.',
 'https://cdn.gamechop.com/games/gow-ragnarok/thumbnail.png',        '2022-11-09', 69.99),
-- 9
('Cyberpunk 2077',
 'An open world action RPG set in the dystopian Night City.',
 'https://cdn.gamechop.com/games/cyberpunk-2077/thumbnail.png',      '2020-12-10', 39.99),
-- 10
('Final Fantasy XVI',
 'A dark action RPG following Clive Rosfield in the world of Valisthea.',
 'https://cdn.gamechop.com/games/ff16/thumbnail.png',                '2023-06-22', 59.99),
-- 11
('Resident Evil 4 Remake',
 'A ground-up remake of the survival horror classic.',
 'https://cdn.gamechop.com/games/re4/thumbnail.png',                 '2023-03-24', 59.99),
-- 12
('Starfield',
 'Bethesdas space exploration RPG set across a thousand planets.',
 'https://cdn.gamechop.com/games/starfield/thumbnail.png',           '2023-09-06', 69.99),
-- 13
('Assassins Creed Mirage',
 'Return to the roots of the franchise in ninth century Baghdad.',
 'https://cdn.gamechop.com/games/ac-mirage/thumbnail.png',           '2023-10-05', 49.99),
-- 14
('Street Fighter 6',
 'A new era of street fighting with a massive roster and World Tour mode.',
 'https://cdn.gamechop.com/games/sf6/thumbnail.png',                 '2023-06-02', 59.99),
-- 15
('Grand Theft Auto V',
 'Three criminals pull off heists across the sprawling city of Los Santos.',
 'https://cdn.gamechop.com/games/gtav/thumbnail.png',                '2013-09-17', 29.99),
-- 16
('Red Dead Redemption 2',
 'An epic tale of life in Americas unforgiving heartland.',
 'https://cdn.gamechop.com/games/rdr2/thumbnail.png',                '2018-10-26', 39.99),
-- 17
('Baldurs Gate 3',
 'A story-rich RPG with deep choices set in the Dungeons and Dragons universe.',
 'https://cdn.gamechop.com/games/bg3/thumbnail.png',                 '2023-08-03', 59.99),
-- 18
('Sonic Frontiers',
 'Sonic explores vast open zones in his most ambitious adventure yet.',
 'https://cdn.gamechop.com/games/sonic-frontiers/thumbnail.png',     '2022-11-08', 49.99),
-- 19
('The Witcher 3: Wild Hunt',
 'A story-driven open world RPG set in a visually stunning fantasy universe.',
 'https://cdn.gamechop.com/games/witcher-3/thumbnail.png',           '2015-05-19', 29.99),
-- 20
('Dragon Age: Inquisition',
 'Lead the Inquisition and save the world from a mysterious tear in the sky.',
 'https://cdn.gamechop.com/games/da-inquisition/thumbnail.png',      '2014-11-18', 19.99),
-- 21
('Monster Hunter World',
 'Hunt massive monsters across lush ecosystems in this action RPG.',
 'https://cdn.gamechop.com/games/mhw/thumbnail.png',                 '2018-01-26', 29.99),
-- 22
('Devil May Cry 5',
 'Three demon hunters battle the demonic invasion of the human world.',
 'https://cdn.gamechop.com/games/dmc5/thumbnail.png',                '2019-03-08', 29.99),
-- 23
('FIFA 24',
 'The worlds most popular football simulation returns with HyperMotionV.',
 'https://cdn.gamechop.com/games/fifa24/thumbnail.png',              '2023-09-29', 69.99),
-- 24
('Forza Horizon 5',
 'Race across a gorgeous open world recreation of Mexico.',
 'https://cdn.gamechop.com/games/fh5/thumbnail.png',                 '2021-11-09', 59.99),
-- 25
('Hades',
 'Defy the god of the dead as you hack and slash out of the Underworld.',
 'https://cdn.gamechop.com/games/hades/thumbnail.png',               '2020-09-17', 24.99);

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