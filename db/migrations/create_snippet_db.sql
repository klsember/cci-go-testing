CREATE TABLE snippets (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created timestamptz NOT NULL,
    expires timestamptz NOT NULL
);

INSERT INTO snippets (title, content, created, expires) VALUES (
    'An old silent pond',
    E'An old silent pond...\nA frog jumps into the pond,\nsplash! Silence again.\n\n– Matsuo Bashō',
    timezone('utc', now()),
    (timezone('utc', now()) + INTERVAL '1 YEAR')
);

INSERT INTO snippets (title, content, created, expires) VALUES (
    'Over the wintry forest',
    E'Over the wintry\nforest, winds howl in rage\nwith no leaves to blow.\n\n– Natsume Soseki',
    timezone('utc', now()),
    (timezone('utc', now())+ INTERVAL '365 DAY')
);

INSERT INTO snippets (title, content, created, expires) VALUES (
    'First autumn morning',
    E'First autumn morning\nthe mirror I stare into\nshows my father''s face.\n\n– Murakami Kijo',
    timezone('utc', now()),
    (timezone('utc', now())+ INTERVAL '7 DAY')
);


SELECT setval('snippets_id_seq', (SELECT MAX(id) FROM snippets));