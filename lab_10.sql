-- Таблиця stations
CREATE TABLE stations (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Таблиця lines
CREATE TABLE lines (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(7) DEFAULT '#000000', 
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- Таблиця line_stations
CREATE TABLE line_stations (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    line_id INT UNSIGNED NOT NULL,
    station_id INT UNSIGNED NOT NULL,
    position INT UNSIGNED NOT NULL, 
    FOREIGN KEY (line_id) REFERENCES lines(id) ON DELETE CASCADE,
    FOREIGN KEY (station_id) REFERENCES stations(id) ON DELETE CASCADE,
    UNIQUE (line_id, position) 
);
-- Таблиця transfers
CREATE TABLE transfers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    station_from INT UNSIGNED NOT NULL,
    station_to INT UNSIGNED NOT NULL,
    transfer_time INT UNSIGNED NOT NULL, 
    FOREIGN KEY (station_from) REFERENCES stations(id) ON DELETE CASCADE,
    FOREIGN KEY (station_to) REFERENCES stations(id) ON DELETE CASCADE,
    UNIQUE (station_from, station_to)
);