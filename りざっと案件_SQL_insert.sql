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

INSERT INTO stages values(
    'abcde12345fghij67890',
    'group001',
    'stage001',
    'pass123',
    '春風ステージ',
    120,
    'harukaze-stage',
    '春風ホール',
    '18:00〜20:00',
    '120',
    'これは春風の物語です。',
    '2025-04-10',
    1,
    'flyer1.jpg',
    'flyer2.jpg'
);

insert into group_login_list values(
	'grp001',
	'abcde12345fghij67890',
    1,
    '芸名',
    1
);

INSERT INTO groupes VALUES (
  'grp001', 
  'nukikugi', 
  '劇団抜きにくい釘', 
  'ゲキダンヌキニクイクギ', 
  'nukikugi2016', 
  'nukikugi@gmail.com', 
  '2025-04-01', 
  '2025-05-01'
)