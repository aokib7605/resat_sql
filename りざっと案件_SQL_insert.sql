INSERT INTO group_authorities (authority_id, authority_name) VALUES
(1, '管理者'),
(2, '票券管理者'),
(3, '一般'),
(4, '閲覧');

INSERT INTO stage_authorities (authority_id, authority_name) VALUES
(1, '管理者'),
(2, '票券管理者'),
(3, '一般'),
(4, '閲覧');

insert into users values (
	'abcde12345fghij67890',
    'doubleUser',
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
    1,
    'abcde12345fghij67890'
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
    'flyer2.jpg',
    '大阪府寝屋川市石津元町11-10'
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
);

insert into stage_login_list values
('abcde12345fghij67890', 'abcde12345fghij67890', '1');