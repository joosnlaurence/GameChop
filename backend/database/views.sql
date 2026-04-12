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
    s.id          AS store_id,
    s.city        AS store_city,
    s.state       AS store_state
FROM users u
JOIN orders o      ON u.id      = o.user_id
JOIN games g       ON o.game_id = g.id
LEFT JOIN stores s ON o.store_id = s.id;