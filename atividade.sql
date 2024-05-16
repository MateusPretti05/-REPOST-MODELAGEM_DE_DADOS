-- Esquema de banco de dados PostgreSQL

CREATE TABLE users (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    researcher BYTEA,
    country VARCHAR(255),
    state VARCHAR(255),
    city VARCHAR(255),
    neighborhood VARCHAR(255),
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE user_forms (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    id_users VARCHAR(255) NOT NULL,
    age INTEGER,
    gender VARCHAR(255) NOT NULL,
    education VARCHAR(255),
    home_type VARCHAR(255) NOT NULL,
    home_members INTEGER,
    family_income VARCHAR(255),
    choice VARCHAR(255) NOT NULL,
    CONSTRAINT user_forms_pkey PRIMARY KEY (id),
    CONSTRAINT user_forms_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id)
);

CREATE TABLE contact_user_forms (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    id_users VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    social_name VARCHAR(255),
    phone VARCHAR(255),
    CONSTRAINT contact_user_forms_pkey PRIMARY KEY (id),
    CONSTRAINT contact_user_forms_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id)
);

CREATE TABLE has_dog_forms (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    id_users VARCHAR(255) NOT NULL,
    name_dog VARCHAR(255) NOT NULL,
    gender VARCHAR(255),
    owner VARCHAR(255) NOT NULL,
    neutered BOOLEAN NOT NULL,
    how_long INTEGER,
    is_first BOOLEAN NOT NULL,
    id_other_pets VARCHAR(255),
    age_dog INTEGER NOT NULL,
    breed_dog VARCHAR(255) NOT NULL,
    where_got VARCHAR(255) NOT NULL,
    payed VARCHAR(255),
    age_got INTEGER NOT NULL,
    personality_dog TEXT NOT NULL,
    id_why_dog VARCHAR(255),
    involved_people VARCHAR(255) NOT NULL,
    veterinary_last_years INTEGER,
    CONSTRAINT has_dog_forms_pkey PRIMARY KEY (id),
    CONSTRAINT has_dog_forms_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id),
    CONSTRAINT has_dog_forms_id_other_pets_fkey FOREIGN KEY (id_other_pets) REFERENCES other_pets(id),
    CONSTRAINT has_dog_forms_id_why_dog_fkey FOREIGN KEY (id_why_dog) REFERENCES why_dog(id)
);

CREATE TABLE had_dog_forms (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    id_users VARCHAR(255) NOT NULL,
    name_dog VARCHAR(255) NOT NULL,
    how_long_with VARCHAR(255) NOT NULL,
    is_first BOOLEAN,
    other_pets BOOLEAN,
    id_other_pets VARCHAR(255),
    age_got INTEGER NOT NULL,
    neutered BOOLEAN,
    months_neutered INTEGER NOT NULL,
    breed VARCHAR(255) NOT NULL,
    where_got VARCHAR(255) NOT NULL,
    payed VARCHAR(255) NOT NULL,
    id_why_dog VARCHAR(255),
    who_chose_name VARCHAR(255),
    what_liked_most TEXT NOT NULL,
    veterinary_visits INTEGER,
    veterinary_visits_reasons TEXT,
    stop_living_with DATE NOT NULL,
    another_dog BOOLEAN,
    why_have_another_dog TEXT,
    CONSTRAINT had_dog_forms_pkey PRIMARY KEY (id),
    CONSTRAINT had_dog_forms_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id),
    CONSTRAINT had_dog_forms_id_other_pets_fkey FOREIGN KEY (id_other_pets) REFERENCES other_pets(id),
    CONSTRAINT had_dog_forms_id_why_dog_fkey FOREIGN KEY (id_why_dog) REFERENCES why_dog(id)
);

CREATE TABLE never_had_forms (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    id_users VARCHAR(255) NOT NULL,
    id_why_have_dog VARCHAR(255),
    buy BOOLEAN,
    adopt BOOLEAN,
    when_interlude DATE,
    expected_personality TEXT,
    dog_expenses BOOLEAN,
    dog_expenses_value BOOLEAN,
    dog_size VARCHAR(255),
    dog_fur VARCHAR(255),
    dog_color VARCHAR(255),
    dog_gender VARCHAR(255),
    dog_age INTEGER,
    dog_breed VARCHAR(255),
    dog_name VARCHAR(255),
    dog_why_name VARCHAR(255),
    CONSTRAINT never_had_forms_pkey PRIMARY KEY (id),
    CONSTRAINT never_had_forms_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id),
    CONSTRAINT never_had_forms_id_why_have_dog_fkey FOREIGN KEY (id_why_have_dog) REFERENCES why_have_dog(id)
);

CREATE TABLE why_dog (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    child_company BOOLEAN,
    teach_responsibility BOOLEAN,
    adult_company BOOLEAN,
    appearance BOOLEAN,
    dog_company BOOLEAN,
    friends BOOLEAN,
    protection BOOLEAN,
    help BOOLEAN,
    gift BOOLEAN,
    other TEXT,
    CONSTRAINT why_dog_pkey PRIMARY KEY (id)
);