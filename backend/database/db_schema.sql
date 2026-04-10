CREATE DATABASE gamechop;
USE gamechop;

-- USERS
-- Central account table
CREATE TABLE users (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(50)  NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
    -- TIMESTAMP is timezone-aware and sufficient for created_at.
);

-- GAMES
CREATE TABLE games (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(150) NOT NULL,
    summary      VARCHAR(255),
    thumbnail    VARCHAR(255),
    release_date DATE,
    price        FLOAT        NOT NULL
);

-- ACHIEVEMENTS
-- Defines what achievements exist globally
CREATE TABLE achievements (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL
);

-- GENRES
-- Simple lookup table for genre labels.
-- Connected to games via game_genres
CREATE TABLE genres (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- PUBLISHERS
CREATE TABLE publishers (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    name   VARCHAR(100) NOT NULL,
    logo   VARCHAR(255),
    banner VARCHAR(255)
);

-- DEVELOPERS
CREATE TABLE developers (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    publisher_id INT,
    name      VARCHAR(100) NOT NULL,
    logo         VARCHAR(255),
    banner       VARCHAR(255),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
        ON UPDATE CASCADE ON DELETE SET NULL
    
    /* if a publisher is deleted, developer record survives but loses its publisher link*/
);

-- STORES
CREATE TABLE stores (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    address    VARCHAR(255) NOT NULL,
    city       VARCHAR(100) NOT NULL,
    state      VARCHAR(50)  NOT NULL,
    open_hour  INT          NOT NULL,
    close_hour INT          NOT NULL
);

-- ORDERS
CREATE TABLE orders (
    order_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT NOT NULL,
    game_id    INT NOT NULL,
    store_id   INT,
    price_paid FLOAT NOT NULL,
    ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    copies     INT       NOT NULL DEFAULT 1,
    is_digital    BOOLEAN   NOT NULL DEFAULT FALSE,
    FOREIGN KEY (user_id)  REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
        
    -- CASCADE: delete user = delete their orders
    FOREIGN KEY (game_id)  REFERENCES games(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
        
    -- RESTRICT: prevents deleting a game that has orders & Protects purchase history integrity
    
    FOREIGN KEY (store_id) REFERENCES stores(id)
        ON UPDATE CASCADE ON DELETE SET NULL
        
    -- SET NULL: if a store closes, order record survives with a null store reference
);

-- GAME_PREVIEWS
-- Trailers/screenshots per game
CREATE TABLE game_previews (
    game_id    INT          NOT NULL,
    preview_id INT          NOT NULL,
    url        VARCHAR(255) NOT NULL,
    PRIMARY KEY (game_id, preview_id),
    FOREIGN KEY (game_id) REFERENCES games(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- GAME_ACHIEVEMENTS
-- Junction: which achievements belong to which game
CREATE TABLE game_achievements (
    achievement_id INT NOT NULL,
    game_id        INT NOT NULL,
    PRIMARY KEY (achievement_id, game_id),
    FOREIGN KEY (achievement_id) REFERENCES achievements(id)
        ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
        ON DELETE CASCADE
);

-- USER_ACHIEVEMENTS
CREATE TABLE user_achievements (
    user_id        INT     NOT NULL,
    game_id        INT     NOT NULL,
    achievement_id INT     NOT NULL,
    achieved       BOOLEAN NOT NULL DEFAULT FALSE,
    -- achieved as FALSE lets you pre populate rows and flip to TRUE when the user earns it.
    
    PRIMARY KEY (user_id, game_id, achievement_id),
    FOREIGN KEY (user_id)        REFERENCES users(id)        ON DELETE CASCADE,
    FOREIGN KEY (game_id)        REFERENCES games(id)        ON DELETE CASCADE,
    FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE
);

-- USER_GAMES
-- Owns/Wishlist relationship from ERD
CREATE TABLE user_games (
    user_id    INT     NOT NULL,
    game_id    INT     NOT NULL,
    purchased  BOOLEAN NOT NULL DEFAULT FALSE,
    wishlisted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES users(id)  ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)  ON DELETE CASCADE
);

-- GAME_GENRES
-- Junction: many to many between games and genres
CREATE TABLE game_genres (
    game_id  INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id)  REFERENCES games(id)  ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- PUBLISHER_GAMES
-- Junction: many to many between games and publishers
CREATE TABLE publisher_games (
    game_id      INT NOT NULL,
    publisher_id INT NOT NULL,
    PRIMARY KEY (game_id, publisher_id),
    FOREIGN KEY (game_id)      REFERENCES games(id)      ON DELETE CASCADE,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id) ON DELETE CASCADE
);

-- DEVELOPER_GAMES
-- Junction: many to many between games and developers
CREATE TABLE developer_games (
    game_id      INT NOT NULL,
    developer_id INT NOT NULL,
    PRIMARY KEY (game_id, developer_id),
    FOREIGN KEY (game_id)      REFERENCES games(id)      ON DELETE CASCADE,
    FOREIGN KEY (developer_id) REFERENCES developers(id) ON DELETE CASCADE
);

-- STORE_GAMES
-- Junction: what games each store carries and how many physical copies they have
CREATE TABLE store_games (
    store_id INT NOT NULL,
    game_id  INT NOT NULL,
    copies   INT NOT NULL DEFAULT 0,
    PRIMARY KEY (store_id, game_id),
    FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id)  REFERENCES games(id)  ON DELETE CASCADE
);