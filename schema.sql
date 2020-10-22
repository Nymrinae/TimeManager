DROP TABLE IF EXISTS workingtimes;
DROP TABLE IF EXISTS clocks;
DROP TABLE IF EXISTS users;

-- CREATE TABLE users(
--    id int PRIMARY KEY,
--    username text NOT NULL,
--    email text NOT NULL,
-- );

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE workingtimes(
    workingtime_id SERIAL PRIMARY KEY,
    start DATE(45) NOT NULL,
    end DATETIME(45) NOT NULL,
    user VARCHAR(100) NOT NULL
);

CREATE TABLE clocks(
    clock_id SERIAL PRIMARY KEY,
    time DATETIME(45) NOT NULL,
    status BOOLEAN NOT NULL,
    user VARCHAR(100) NOT NULL
);
DATETIME
