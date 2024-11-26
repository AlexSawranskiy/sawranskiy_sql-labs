-- Таблиця categories
CREATE TABLE categories (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);
-- Таблиця articles
CREATE TABLE articles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);
-- Таблиця comments
CREATE TABLE comments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    article_id INT UNSIGNED NOT NULL,
    author_name VARCHAR(255),
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
);
-- Таблиця ratings
CREATE TABLE ratings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    article_id INT UNSIGNED NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    rating TINYINT UNSIGNED CHECK (rating BETWEEN 1 AND 5),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (article_id, ip_address),
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
);