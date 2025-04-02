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

insert into users values (
	'abcde12345fghij67890',
    'double',
    0,
    'test_user',
    'test@test.com',
    '090-0000-0000',
    'テストユーザー',
    'テストユーザー',
    '芸名',
    'ゲイメイ',
    'ssh',
    'abcde12345fghij67890',
    '20250315',
    '20250315',
    '19900101',
    1
    );