-- 公演のidを確認
select * from stages;

-- 検索実行
select 
	none_user_name as お名前, 
    none_user_kana_name as フリガナ, 
    none_user_mail as メールアドレス, 
    none_user_tell as ご連絡先, 
    st_date as 予約日時, 
    ticket_name as チケット,
    ticket_price as チケット料金, 
    tra_amount as 予約枚数, 
    (ticket_price * tra_amount) as お支払
from transactions t
	join none_users nu on t.sys_user_id = nu.sys_none_user_id
    left outer join dates d on d.sys_date_id = t.sys_date_id
    left outer join tickets tk on tk.sys_ticket_id = t.sys_ticket_id
where t.sys_stage_id = 'io4qwamgtlj26lnpcy0i';