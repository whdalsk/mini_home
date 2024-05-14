
const pagename = $(location).attr('pathname').split("/").pop().split(".")[0];
let cnt = 0;

const writecmt = (num) => {
    let a = $(`#comt${num}`);
    const list = $(`#cmtlist${num}`);
    const plus = `<p>익명인 : ${a.val()} </p>`;

    let formData = new FormData();
    formData.append("reply", a);
    formData.append("cmtlist", num);
    formData.append("pagename", pagename);



    a.val('');
    list.append(plus);
}

cnt = 3; // 임시
function newDiarywrite() {
    let title = $("#diarytitle").val();
    let content = $("#diarycontent").val();

   

    html_text = `
        <div id="diary">
            <div id="content">
                <span>${title}</span>
            <div id="essay" style="text-align: center;">
                ${content} 
            </div>
            <hr style="border-bottom:1px dashed #A6A6A6; border-top:none;">
            <div id="setting">
                <text style="font-size:22px; color:#A6A6A6">공개설정 : 전체공개</text>
            </div>
            <hr style="color:#EAEAEA">
            <div id="comment${cnt}" class="comment">
                <div id="write">
                    <text>댓글 입력 : </text>
                    <input id="comt${cnt}" type="text" name="cmt">
                    <button onclick="writecmt(${cnt})">등록</button>
                </div>
                <div id="cmtlist${cnt}">

                </div>
            </div>
        </div>
    </div>`;

    //newDiary.innerHTML=title;
    $('.container').append(html_text);
    // let formData = new FormData();
    // formData.append("title", title);
    // formData.append("content", content);
    // formData.append("pagename", pagename);
    // fetch('/reply_save', { method: "POST", body: formData, }).then((res) => res.json()).then((data) => {

    // });
    cnt++;
}

function show_diary() {
    fetch('/guestbook').then((res) => res.json()).then((data) => {
        $('.container').empty()
        cnt = 0;
        let rows = data['result']
        rows.forEach((a) => {
            let name = a['name'];
            let comment = a['comment'];

            html_text = `
                        <div id="diary">
                            <div id="content">
                                <span>${title}</span>
                            <div id="essay" style="text-align: center;">
                                ${content} 
                            </div>
                            <hr style="border-bottom:1px dashed #A6A6A6; border-top:none;">
                            <div id="setting">
                                <text style="font-size:22px; color:#A6A6A6">공개설정 : 전체공개</text>
                            </div>
                            <hr style="color:#EAEAEA">
                            <div id="comment${cnt}" class="comment">
                                <div id="write">
                                    <text>댓글 입력 : </text>
                                    <input id="comt${cnt}" type="text" name="cmt">
                                    <button onclick="writecmt(${cnt})">등록</button>
                                </div>
                                <div id="cmtlist${cnt}">
                                    <p>부정빈 : ㅠㅠ..퍼가염..♡</p>
                                    <p>변영화 : ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
                                    <p>김예리 : ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
                                </div>
                            </div>
                        </div>
                    </div>`;
            $('#container').append(html_text);
            cnt++;
        });
    });

    fetch('/show_diary').then((res) => res.json()).then((data) => { // 다이아리 댓글
        let rows = data['result']
        rows.forEach((a) => {

            let reply = a['reply']
            let num = a['cmtlist'];

            let cmtlist = "#cmtlist" + num;

            html_text = `<p>익명인 : ${reply} </p>`
            $(cmtlist).append(html_text);

        });
    });
}