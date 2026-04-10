USE gamechop;

-- VIEW 1: store_game_catalog
-- Virtual table showing every game a store carries along with stock and game details
CREATE OR REPLACE VIEW store_game_catalog AS
SELECT
    s.id          AS store_id,
    s.address,
    s.city,
    s.state,
    s.open_hour,
    s.close_hour,
    g.id          AS game_id,
    g.title       AS game_title,
    g.price,
    g.release_date,
    g.thumbnail,
    sg.copies     -- per-store stock count from store_games
FROM stores s

-- store_games is the junction that links stores to games
-- Regular JOIN means only games actually stocked appear
JOIN store_games sg ON s.id  = sg.store_id
JOIN games g        ON sg.game_id = g.id;


-- VIEW 2: user_purchase_history
-- table showing every order a user has placed with full game and store context
CREATE OR REPLACE VIEW user_purchase_history AS
SELECT
    u.id          AS user_id,
    u.username,
    o.order_id,
    o.ordered_at,
    o.copies,
    o.is_digital,       -- true = digital, false = physical
    g.id          AS game_id,
    g.title       AS game_title,
    o.price_paid  AS price_paid,
    s.id          AS store_id,
    s.city        AS store_city,
    s.state       AS store_state
FROM users u
JOIN orders o      ON u.id       = o.user_id
JOIN games g       ON o.game_id  = g.id

/*LEFT JOIN keeps digital orders in results even though their store_id is NULL. A regular JOIN
 would silently drop all digital purchases */
LEFT JOIN stores s ON o.store_id = s.id;