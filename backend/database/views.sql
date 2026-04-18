USE gamechop;

-- VIEW 1: store_game_catalog
CREATE OR REPLACE VIEW store_game_catalog AS
SELECT
    s.id            AS store_id,
    s.address,
    s.city,
    s.state,
    s.open_hour,
    s.close_hour,
    s.google_map_url,  
    g.id            AS game_id,
    g.title         AS game_title,
    g.price,
    g.release_date,
    g.thumbnail,
    sg.copies
FROM stores s
JOIN store_games sg ON s.id     = sg.store_id
JOIN games g        ON sg.game_id = g.id;


-- VIEW 2: user_purchase_history
CREATE OR REPLACE VIEW user_purchase_history AS
SELECT
    u.id          AS user_id,
    u.username,
    o.order_id,
    o.order_num,      
    o.ordered_at,
    o.copies,
    o.is_digital,       
    g.id          AS game_id,
    g.title       AS game_title,
    g.price,          
    g.thumbnail,
    s.id          AS store_id,
    s.city        AS store_city,
    s.state       AS store_state,
    s.address     AS store_address,
FROM users u
JOIN orders o      ON u.id      = o.user_id
JOIN games g       ON o.game_id = g.id
LEFT JOIN stores s ON o.store_id = s.id;

-- new ones since 4/14

-- VIEW 3: game_details
/* Everything about a single game in one place. Publisher, developer, genres all aggregated
 into comma-separated strings using GROUP_CONCAT so the backend gets one row per game instead
 of multiple rows from joins.
 Achievements and previews are fetched separately in the API since they are arrays. */
CREATE OR REPLACE VIEW game_details AS
SELECT
    g.id                                        AS game_id,
    g.title,
    g.summary,
    g.thumbnail,
    g.release_date,
    g.price,
    -- Aggregate all genres into one comma separated string
    -- e.g. "Action, RPG, Open World"
    GROUP_CONCAT(DISTINCT ge.name ORDER BY ge.name SEPARATOR ',')      AS genres,
    -- Aggregate all publishers into one string
    GROUP_CONCAT(DISTINCT p.name ORDER BY p.name SEPARATOR ',')        AS publishers,
    -- Aggregate all developers into one string
    GROUP_CONCAT(DISTINCT d.name ORDER BY d.name SEPARATOR ',')        AS developers
FROM games g
LEFT JOIN game_genres gg        ON g.id = gg.game_id
LEFT JOIN genres ge             ON gg.genre_id = ge.id
LEFT JOIN publisher_games pg    ON g.id = pg.game_id
LEFT JOIN publishers p          ON pg.publisher_id = p.id
LEFT JOIN developer_games dg    ON g.id = dg.game_id
LEFT JOIN developers d          ON dg.developer_id = d.id
GROUP BY
    g.id, g.title, g.summary, g.thumbnail, g.release_date, g.price;

-- VIEW 4: game_listing
/* Lighter version of game_details for catalog/listing pages. Same aggregation
 pattern but no achievements or hardware. Used for the general game listing route */
CREATE OR REPLACE VIEW game_listing AS
SELECT
    g.id                                                                AS game_id,
    g.title,
    g.summary,
    g.thumbnail,
    g.release_date,
    g.price,
    GROUP_CONCAT(DISTINCT ge.name ORDER BY ge.name SEPARATOR ',')     AS genres,
    GROUP_CONCAT(DISTINCT p.name ORDER BY p.name SEPARATOR ',')       AS publishers,
    GROUP_CONCAT(DISTINCT d.name ORDER BY d.name SEPARATOR ',')       AS developers
FROM games g
LEFT JOIN game_genres gg        ON g.id = gg.game_id
LEFT JOIN genres ge             ON gg.genre_id = ge.id
LEFT JOIN publisher_games pg    ON g.id = pg.game_id
LEFT JOIN publishers p          ON pg.publisher_id = p.id
LEFT JOIN developer_games dg    ON g.id = dg.game_id
LEFT JOIN developers d          ON dg.developer_id = d.id
GROUP BY
    g.id, g.title, g.summary, g.thumbnail, g.release_date, g.price;

-- VIEW 5: user_library
/* All games a user owns or has wishlisted, with their achievement progress per game
aggregated as counts so the frontend can show "12/25 achievements" style progress */
CREATE OR REPLACE VIEW user_library AS
SELECT
    u.id                                                AS user_id,
    u.username,
    g.id                                                AS game_id,
    g.title,
    g.thumbnail,
    g.price,
    ug.purchased,
    ug.wishlisted,
    -- Total achievements this game has
    COUNT(DISTINCT ga.achievement_id)                   AS total_achievements,
    -- How many the user has earned
    COUNT(DISTINCT CASE WHEN ua.achieved = TRUE
          THEN ua.achievement_id END)                   AS earned_achievements,
    GROUP_CONCAT(DISTINCT ge.name SEPARATOR ',')       AS genres
FROM users u
JOIN user_games ug          ON u.id      = ug.user_id
JOIN games g                ON ug.game_id = g.id
LEFT JOIN game_achievements ga  ON g.id  = ga.game_id
LEFT JOIN user_achievements ua  ON u.id  = ua.user_id
                                AND g.id = ua.game_id
LEFT JOIN game_genres gg    ON g.id      = gg.game_id
LEFT JOIN genres ge         ON gg.genre_id = ge.id
GROUP BY
    u.id, u.username, g.id, g.title,
    g.thumbnail, g.price, ug.purchased, ug.wishlisted;