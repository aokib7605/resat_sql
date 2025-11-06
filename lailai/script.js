$(function () {
    const ticketDataList = [
        {
            sys_ticket_id: "4e0aaj6l67ssjfbd5gtc",
            ticket_name: "予約",
            ticket_price: 2000
        },
    ];

    const dateDataList = [
        // {
        //     sys_date_id: "74lix2ruq3ivxt753wqp",
        //     st_date: "2025-11-02T12:30:00",
        //     view_date: "11月2日（日）12:30",
        // },
        // {
        //     sys_date_id: "ty1xl79hnq6qvlr25lgh",
        //     st_date: "2025-11-02T16:00:00",
        //     view_date: "11月2日（日）16:00",
        // },
    ]

    // 予約内容確定ボタン押下検知フラグ
    let isSubmitting = false;

    // 入力内容を格納するオブジェクト
    let formData = {};

    // 初期化時にチケット選択プルダウンの作成
    ticketDataList.forEach(ticketData => {
        $("#ticketSelect").append(
            '<option value="' + ticketData.sys_ticket_id + '">' + ticketData.ticket_name + '（￥' + ticketData.ticket_price.toLocaleString() + '）</option>'
        );
    });

    // 初期化時に日時選択プルダウンの作成
    dateDataList.forEach(dateData => {
        $("#dateSelect").append(
            '<option value="' + dateData.sys_date_id + '">' + dateData.view_date + '</option>'
        );
    })

    // 予約内容確定ボタン押下時
    $("#submitBtn").on("click", function () {

        // 入力データ収集
        $("#reserveForm").serializeArray().forEach(item => {
            formData[item.name] = escapeHtml(item.value);
        });

        // form要素内の情報を取得
        const form = document.getElementById("reserveForm");
        const sys_ticket_id = formData.sys_ticket_id;
        const sys_date_id = formData.sys_date_id;
        const tra_amount = parseInt(formData.tra_amount, 10);
        let ticket_name = "";
        let ticket_price = 0;
        let total_price = 0;
        let st_date = "";
        let view_date = "";

        // form内入力条件を満たしていない場合は後続処理を行わず、リターンする
        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }

        // 選択中のチケット情報を取得
        ticketDataList.forEach(ticketData => {
            if (ticketData.sys_ticket_id === sys_ticket_id) {
                ticket_price = ticketData.ticket_price;
                ticket_name = ticketData.ticket_name;
                total_price = ticket_price * tra_amount;
            }
        })

        // 選択中の日時データを取得
        dateDataList.forEach(dateData => {
            if (dateData.sys_date_id === sys_date_id) {
                st_date = dateData.st_date;
                view_date = dateData.view_date;
            }
        })

        // 全ての情報をformDataに格納
        formData.st_date = st_date;
        formData.ticket_name = ticket_name;
        formData.ticket_price = ticket_price;
        formData.tra_amount = tra_amount;
        formData.total_price = total_price;

        // 確認画面表示
        let html = `
      <p><strong>お名前：</strong>${formData.user_name}</p>
      <p><strong>フリガナ：</strong>${formData.user_kana_name}</p>
      <p><strong>日時：</strong>${view_date}</p>
      <p><strong>チケット：</strong>${ticket_name}（￥${ticket_price.toLocaleString()}）</p>
      <p><strong>枚数：</strong>${tra_amount}枚</p>
      <p><strong>お支払金額：</strong>￥${total_price.toLocaleString()}</p>
      <p><strong>コメント：</strong>${formData.tra_comment || "(なし)"}</p>
      <p><strong>メール：</strong>${formData.user_mail}</p>
      <p><strong>電話：</strong>${formData.user_tell}</p>
    `;

        $("#confirmContent").html(html);
        $("#reserveForm").hide();
        $("#confirmSection").show();
    });

    // 「戻る」ボタン
    $("#confirmBackBtn").on("click", function () {
        $("#confirmSection").hide();
        $("#reserveForm").show();
    });

    // 「確定」ボタン → 本リクエスト送信
    $("#confirmSubmitBtn").on("click", function () {
        if (isSubmitting) return;
        isSubmitting = true;
        console.log(formData);
        $("#confirmSubmitBtn").prop("disabled", true).text("送信中…");

        $.ajax({
            url: "https://grobe-reserve.com/otherServiceExeReserve",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function () {
                $("#confirmSection").hide();
                $("#completeMessage").show().html(
                    `予約登録が完了しました。<br>${formData.user_mail}宛に予約完了通知をお送りしていますので、ご確認ください。`
                );
            },
            error: function () {
                alert("予約に失敗しました。もう一度お試しください。");
                $("#confirmSubmitBtn").prop("disabled", false).text("確定");
                isSubmitting = false;
            }
        });
    });

    // grobeアカウントログイン・新規作成
    $("#loginAccountBtn").on("click", function () {
        const form = document.createElement("form");
        form.method = "POST";
        form.action = "https://grobe-reserve.com/loginGrobeAccountFromOtherService";

        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "json";
        input.value = JSON.stringify(formData);
        form.appendChild(input);

        document.body.appendChild(form);
        form.submit();
    });

    function escapeHtml(userInputText) {
        return userInputText
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039");
    }
});
