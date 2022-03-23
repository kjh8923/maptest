CREATE TABLE plan_mst (
    planNum NUMBER(38) NOT NULL PRIMARY KEY,
    planName VARCHAR2(200) NOT NULL,
    startDate VARCHAR2(100) NOT NULL,
    endDate VARCHAR2(100) NOT NULL,
    theme varchar2(30) not null
);

CREATE SEQUENCE planNum_seq 
                INCREMENT BY 1
                START WITH 1
                MINVALUE 1
                MAXVALUE 9999
                NOCYCLE
                NOCACHE
                NOORDER;
                
commit;

drop table plan_list;

create table plan_list(
    plannum NUMBER(30) not null PRIMARY key,
    planlistnum NUMBER(30) not null,
    latitude varchar2(50) not null, 
    longitude varchar2(50) not null, 
    placeName varchar2(100) not null, 
    placecount varchar2(50) not null, 
    category varchar2(100) not null, 
    address varchar2(100) not null,
    planDetail varchar2(1000),
    transportation varchar2(30),
    startTime varchar2(30),
    endTime varchar2(30)
);

create SEQUENCE planlist_seq increment by 1
                             start with 1
                             minvalue 1
                             maxvalue 9999
                             nocycle
                             nocache
                             noorder;

alter table plan_list
add CONSTRAINT fk_plannum foreign key(plannum) REFERENCES plan_mst(planNum);

commit;