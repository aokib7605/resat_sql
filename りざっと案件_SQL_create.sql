-- drop schema resat;
create schema resat;
use resat;


create table stage_login_list (
	sys_stage_id varchar(20),
    sys_user_id varchar(20),
    stage_authority int,
    cast_table_id varchar(20),
    staff_table_id varchar(20),
    primary key (sys_stage_id, sys_user_id)
    );

create table stage_authorities (
	authority_id int primary key,
    authority_name varchar(64)
    );

create table cast_abcde12345fghij67890 (
	cast_table_id varchar(20),
    sys_user_id varchar(20),
    cast_chara_name varchar(64),
    cast_sort_num int,
    primary key (cast_table_id)
    );

create table staff_abcde12345fghij67890 (
	staff_table_id varchar(20),
    sys_user_id varchar(20),
    staff_dep_name varchar(64),
    staff_sort_num int,
    primary key (staff_table_id)
    );

create table dates_abcde12345fghij67890 (
	sys_date_id varchar(20),
    st_date date,
    st_seat int,
    st_info varchar(128),
    primary key (sys_date_id)
    );

create table tickets (
	sys_ticket_id varchar(20),
    sys_stage_id varchar(20),
    ticket_name varchar(64),
    ticket_price int,
    primary key (sys_ticket_id)
    );
-- drop table tickets;

create table forms (
	sys_form_id varchar(20),
    sys_stage_id varchar(20),
	form_name varchar(64),
    date_st date,
    date_ed date,
    primary key (sys_form_id)
    );

create table formset (
	sys_stage_id varchar(20),
	sys_form_id varchar(20),
    sys_ticket_id varchar(20)
    );

create table stages (
	sys_stage_id varchar(20),
    sys_group_id varchar(20),
    stage_id varchar(20),
    stage_pass varchar(20),
    stage_name varchar(64),
    stage_attract_customers int,
    stage_url_title varchar(64),
    stage_place_name varchar(64),
    stage_open_minutes varchar(64),
    stage_runtime varchar(20),
    stage_story varchar(400),
    stage_cre_date date,
    stage_opener int,
    stage_flyer_1 varchar(64),
    stage_flyer_2 varchar(64),
    primary key (sys_stage_id, stage_id)
    );

create table groupes (
	sys_group_id varchar(20),
    group_id varchar(20),
    group_name varchar(64),
    group_kana_name varchar(64),
    group_pass varchar(20),
    group_mail varchar(128),
    group_cre_date date,
    group_last_login date,
    primary key (sys_group_id, group_id)
    );
-- drop table groupes;

create table group_login_list (
	sys_group_id varchar(20),
    sys_user_id varchar(20),
    group_authority int,
    user_spe_name varchar(64),
    user_spe_name_ev int
    );

create table group_authorities (
	authority_id int,
    authority_name varchar(64),
    primary key(authority_id)
    );

create table users (
	sys_user_id varchar(20),
    sys_user_mode varchar(64),
    sys_user_ev int,
    user_id varchar(20),
    user_mail varchar(64),
    user_tell varchar(20),
    user_name varchar(64),
    user_kana_name varchar(20),
    user_stage_name varchar(64),
    user_stage_kana_name varchar(64),
    user_pass varchar(20),
    user_def_stage varchar(20),
    user_cre_date date,
    user_last_login date,
    user_birthday date,
    user_hide_age int,
    primary key(sys_user_id, user_id, user_mail)
    );

create table transactions (
	sys_tra_id varchar(20),
    sys_user_id varchar(20),
    sys_stage_id varchar(20),
    sys_date_id varchar(20),
    sys_ticket_id varchar(20),
    tra_amount int,
    tra_manager_id varchar(20),
    tra_memo varchar(256),
    tra_cre_date date,
    tra_comment varchar(400),
    tra_discount int,
    primary key(sys_tra_id)
    );