# maptest

create table maptest(
    mid number(4) primary key,
    latitude varchar2(20) not null,
    longitude varchar2(20) not null,
    placeName varchar2(50) not null,
    placecount varchar2(50) not null,
    category varchar2(30) not null
);

create SEQUENCE maptest_seq nocache;
