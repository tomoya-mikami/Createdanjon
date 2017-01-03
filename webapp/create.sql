create table map(
    id integer primary key,
    name text
);
create table panel(
    id integer primary key,
    map_id integer,
    panel_num integer,
    panel_content integer
);