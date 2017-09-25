create table efforts
(
    id serial not null primary key,
    name text not null,
    type varchar(100),
    year varchar(5),
    development varchar(2),
    usability varchar(2),
    metodologies varchar(100),
    tools varchar(200),
    frameworks varchar(200),
    state varchar(20)
);

copy efforts(name, type, year, development,
             usability, metodologies,
             tools, frameworks, state)
from '/home/carlos/efforts.csv' using delimiters '|' encoding 'utf8';
