CREATE TABLE IF NOT EXISTS genre(
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS artist(
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL,
	alias varchar
);

CREATE TABLE IF NOT EXISTS genre_artist(
    id SERIAL PRIMARY KEY,
	genre_id integer NOT NULL REFERENCES genre(id),
	artist_id integer NOT NULL REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS album(
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL,
	years integer 
);

CREATE TABLE IF NOT EXISTS album_artist(
    id SERIAL PRIMARY KEY,
	album_id integer NOT NULL REFERENCES album(id),
	artist_id integer NOT NULL REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS track(
	id SERIAL PRIMARY KEY,
	fk_album_id integer REFERENCES album(id)
	name varchar NOT NULL,
	track_duration integer NOT NULL 
		
);

CREATE TABLE IF NOT EXISTS compilation(
	id SERIAL PRIMARY KEY,
	name varchar NOT NULL,
	yarse integer 
);

CREATE TABLE IF NOT EXISTS compilation_track(
    id SERIAL PRIMARY KEY,
    compilation_id integer NOT NULL REFERENCES compilation(id),
	track_id integer NOT NULL REFERENCES track(id)
);
