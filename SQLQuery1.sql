DROP TABLE categorias;
DROP TABLE fraquezas;
DROP TABLE pokemons;

CREATE TABLE pokemons(
id INT IDENTITY,
nome VARCHAR(100) NOT NULL,
id_categoria INT,
id_fraqueza_1 INT,
id_fraqueza_2 INT,
PRIMARY KEY(id)
);

CREATE TABLE categorias(
id INT IDENTITY (1,1) PRIMARY KEY,
id_pokemon INT,
nome_da_categoria VARCHAR(100) NOT NULL,
FOREIGN KEY (id_pokemon) REFERENCES pokemons(id)
);


CREATE TABLE fraquezas(
id INT IDENTITY (1,1) PRIMARY KEY,
id_pokemon INT,
nome_fraqueza1 VARCHAR(100) NOT NULL,
nome_fraqueza2 VARCHAR(100) NOT NULL
FOREIGN KEY (id_pokemon) REFERENCES pokemons(id)
);

INSERT INTO pokemons(nome) VALUES
('gengar'),
('lucario'),
('rayquaza'),
('metagross'),
('dragonite'),
('arceus'),
('houndoom'),
('entei'),
('raikou'),
('Suicune');

INSERT INTO categorias(id_pokemon, nome_da_categoria) VALUES
((SELECT id FROM pokemons WHERE nome LIKE 'Gengar'),'Shadow'),
((SELECT id FROM pokemons WHERE nome LIKE 'Dragonite'),'Dragon'),
((SELECT id FROM pokemons WHERE nome LIKE 'Houndoom'),'Dark'),
((SELECT id FROM pokemons WHERE nome LIKE 'Lucario '),'Aura'),
((SELECT id FROM pokemons WHERE nome LIKE 'Metagross'),'Iron Leg'),
((SELECT id FROM pokemons WHERE nome LIKE 'Rayquaza'),'Sky High'),
((SELECT id FROM pokemons WHERE nome LIKE 'Suicune'),'Aurora'),
((SELECT id FROM pokemons WHERE nome LIKE 'Raikou'),'Thunder'),
((SELECT id FROM pokemons WHERE nome LIKE 'Entei'),'Volcano'),
((SELECT id FROM pokemons WHERE nome LIKE 'Arceus'),'Alpha');

INSERT INTO fraquezas(id_pokemon,nome_fraqueza1,nome_fraqueza2)  VALUES
((SELECT id FROM pokemons WHERE nome = 'Gengar'),'Dark','Ghost'),
((SELECT id FROM pokemons WHERE nome = 'Dragonite'),'Ice','Dragon'),
((SELECT id FROM pokemons WHERE nome = 'Houndoom'),'Water','Ground'),
((SELECT id FROM pokemons WHERE nome = 'Lucario '),'Fighting','Fire'),
((SELECT id FROM pokemons WHERE nome = 'Metagross'),'Fire','Ghost'),
((SELECT id FROM pokemons WHERE nome = 'Rayquaza'),'Ice','Dragon'),
((SELECT id FROM pokemons WHERE nome = 'Suicune'),'Electric','Grass'),
((SELECT id FROM pokemons WHERE nome = 'Raikou'),'Ground','NULL'),
((SELECT id FROM pokemons WHERE nome = 'Entei'),'Ground','Rock'),
((SELECT id FROM pokemons WHERE nome = 'Arceus'),'Fightinf','NULL');

SELECT pokemons.nome,categorias.nome_da_categoria , fraquezas.nome_fraqueza1, fraquezas.nome_fraqueza2 FROM pokemons
JOIN categorias ON (pokemons.id = categorias.id_pokemon)
JOIN fraquezas ON (pokemons.id = fraquezas.id_pokemon);
