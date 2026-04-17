-- CREATE DATABASE gamechop; -- Docker handles this when you run it
USE gamechop;

-- USERS
CREATE TABLE users (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(50)  NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
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
CREATE TABLE achievements (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(150) NOT NULL,
    description VARCHAR(255)
);

-- GENRES
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
    name         VARCHAR(100) NOT NULL,
    logo         VARCHAR(255),
    banner       VARCHAR(255),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- STORES
CREATE TABLE stores (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    address        VARCHAR(255) NOT NULL,
    city           VARCHAR(100) NOT NULL,
    state          VARCHAR(50)  NOT NULL,
    open_hour      INT          NOT NULL,
    close_hour     INT          NOT NULL,
    google_map_url VARCHAR(255)
    -- nullable: you might add a store before having the maps link ready
);

-- REQUIREMENTS
-- Stores hardware requirement specs as their own entity.
/* A single requirements row can be reused across games via game_requirements 
(e.g. many games share the same min specs) */
CREATE TABLE requirements (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    os      VARCHAR(100),
    cpu     VARCHAR(100),
    mem     VARCHAR(50),
    gpu     VARCHAR(100),
    storage VARCHAR(50)
    -- all nullable since not every spec field may be known
);

-- ORDERS
CREATE TABLE orders (
    order_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT          NOT NULL,
    game_id    INT          NOT NULL,
    store_id   INT,
    ordered_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    copies     INT          NOT NULL DEFAULT 1,
    is_digital    BOOLEAN      NOT NULL DEFAULT FALSE,
    order_num  VARCHAR(50),
    -- order_num is a human readable order reference for
    -- receipts and support tickets, separate from order_id
    FOREIGN KEY (user_id)  REFERENCES users(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (game_id)  REFERENCES games(id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (store_id) REFERENCES stores(id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- GAME_PREVIEWS
CREATE TABLE game_previews (
    game_id    INT          NOT NULL,
    preview_id INT          NOT NULL,
    url        VARCHAR(512) NOT NULL,
    PRIMARY KEY (game_id, preview_id),
    FOREIGN KEY (game_id) REFERENCES games(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- GAME_ACHIEVEMENTS
CREATE TABLE game_achievements (
    achievement_id INT NOT NULL,
    game_id        INT NOT NULL,
    PRIMARY KEY (achievement_id, game_id),
    FOREIGN KEY (achievement_id) REFERENCES achievements(id)
        ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id)
        ON DELETE CASCADE
);

-- GAME_REQUIREMENTS
-- Junction between games and requirements
CREATE TABLE game_requirements (
    req_id      INT     NOT NULL,
    game_id     INT     NOT NULL,
    recommended BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (req_id, game_id),
    FOREIGN KEY (req_id)  REFERENCES requirements(id)
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
    PRIMARY KEY (user_id, game_id, achievement_id),
    FOREIGN KEY (user_id)        REFERENCES users(id)        ON DELETE CASCADE,
    FOREIGN KEY (game_id)        REFERENCES games(id)        ON DELETE CASCADE,
    FOREIGN KEY (achievement_id) REFERENCES achievements(id) ON DELETE CASCADE
);

-- USER_GAMES
CREATE TABLE user_games (
    user_id    INT     NOT NULL,
    game_id    INT     NOT NULL,
    purchased  BOOLEAN NOT NULL DEFAULT FALSE,
    wishlisted BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

-- GAME_GENRES
CREATE TABLE game_genres (
    game_id  INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (game_id, genre_id),
    FOREIGN KEY (game_id)  REFERENCES games(id)  ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- PUBLISHER_GAMES
CREATE TABLE publisher_games (
    game_id      INT NOT NULL,
    publisher_id INT NOT NULL,
    PRIMARY KEY (game_id, publisher_id),
    FOREIGN KEY (game_id)      REFERENCES games(id)      ON DELETE CASCADE,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id) ON DELETE CASCADE
);

-- DEVELOPER_GAMES
CREATE TABLE developer_games (
    game_id      INT NOT NULL,
    developer_id INT NOT NULL,
    PRIMARY KEY (game_id, developer_id),
    FOREIGN KEY (game_id)      REFERENCES games(id)      ON DELETE CASCADE,
    FOREIGN KEY (developer_id) REFERENCES developers(id) ON DELETE CASCADE
);

-- STORE_GAMES
CREATE TABLE store_games (
    store_id INT NOT NULL,
    game_id  INT NOT NULL,
    copies   INT NOT NULL DEFAULT 0,
    PRIMARY KEY (store_id, game_id),
    FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id)  REFERENCES games(id)  ON DELETE CASCADE
);