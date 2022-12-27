

create database nse_data;

create table bhavcopy(
    id serial PRIMARY  key,
    symbol TEXT NOT NULL ,
    series TEXT NOT NULL ,
    date1 DATE NOT NULL ,
    prev_close decimal  ,
    open_price decimal NOT NULL ,
    high_price decimal ,
    low_price decimal ,
    last_price text,
    close_price decimal NOT NULL,
    avg_price decimal
);

create table equitySegment(
    id serial PRIMARY KEY ,
    symbol TEXT NOT NULL ,
    name_of_company TEXT NOT NULL ,
    series TEXT NOT NULL ,
    date_of_listing DATE not NULL ,
    paid_up_value DECIMAL not NULL ,
    market_lots INT NOT NULL ,
    isin_number TEXT not NULL ,
    face_value INT not NULL 
);

COPY equitySegment(symbol,name_of_company, series, date_of_listing, paid_up_value, market_lots, isin_number, face_value) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

ALTER TABLE bhavcopy
ADD Column gain decimal;

UPdate bhavcopy
SET gain = (close_price-open_price)/open_price;

select * from bhavcopy order by gain desc limit 25;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

COPY bhavcopy(symbol, series, date1, prev_close, open_price, high_price, low_price, last_price, close_price, avg_price) 
FROM '/path.csv' DELIMITER ',' CSV HEADER;

 select * from bhavcopy order by gain desc limit 25;

create table oldestopen (
    id serial PRIMARY key,
    symbol TEXT NOT NULL ,
    open_price DECIMAL NOT NULL
);
 INSERT INTO oldestopen (symbol,open_price) 
 select symbol,open_price from bhavcopy where date1='01-Dec-2022';

create table latestclose (
    id serial PRIMARY key,
    symbol TEXT NOT NULL ,
    close_price DECIMAL  NOT NULL
);

 INSERT INTO latestclose (symbol,close_price) 
 select symbol,close_price from bhavcopy where date1='26-Dec-2022';

create table finaldata (
    id serial PRIMARY key,
    symbol TEXT NOT NULL ,
    open_price DECIMAL NOT NULL ,
    close_price DECIMAL  NOT NULL
);
INSERT into finaldata(symbol,open_price,close_price)
select latestclose.symbol,open_price,close_price from 
latestclose inner join oldestopen on oldestopen.symbol=latestclose.symbol;

ALTER TABLE finaldata
ADD Column gain decimal;

UPdate finaldata
SET gain = (close_price-open_price)/open_price;

\copy (select * from finaldata ORDER BY GAIN desc limit 25) 
to '/tmp/q3.csv' csv header;



