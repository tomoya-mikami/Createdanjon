var array = [];
var text="ここに名前を打ち込んでね";
for (var i = 0; i < 25; i++) {
    array.push(101);
}

/*パネルをドラッグアンドドロップするとき、そのデータが持つテキストを決める*/ 
function doDragStart1(event) {
    event.dataTransfer.setData('text/plain', '0')
}
function doDragStart2(event) {
    event.dataTransfer.setData('text/plain', '1')
}
function doDragStart98(event) {
    event.dataTransfer.setData('text/plain', '98')
}
function doDragStart99(event) {
    event.dataTransfer.setData('text/plain', '99')
}
function doDragOver(event) {
    event.preventDefault();
}
/*実際に置かれたときにjavascriptの配列にパネルのデータをセットする*/ 
function doDrop(event) {
    var setnum=true;
    event.preventDefault();
    var data = event.dataTransfer.getData("text/plain");
    num = Number(data);
    ind=Number(event.target.dataset.num);
    console.log("panelnumber: "+num);
    console.log("index: "+ind);
    var imgadd;
    if (num == 0) {
        imgadd = 'img/stage1.png';
    } else if (num == 1) {
        imgadd = 'img/stage2.png';
    } else if (num == 98) {
        array.forEach(function(element) {
            if(element==98){setnum=false;}
        });
        if(setnum){
            imgadd = 'img/stage98.png';
        }
    } else if (num == 99) {
        array.forEach(function(element) {
            if(element==99){setnum=false;}
        });
        if(setnum){
            imgadd = 'img/stage99.png';
        }
    }
    if(setnum){
        array[ind]=num;
    }
    event.target.style.backgroundImage = 'url('+imgadd+')';
    create_post();
    /*console.log(array);*/
}
/*javascriptの配列のデータを強引にpostする*/
function create_post(){

    var $sent = $("#sent");
    $sent.text("");
    var $form=$('<form/>',{action: "save.rb", method: 'post'});
    array.forEach(function(x){
        $form.append($('<input/>',{type : 'hidden', name: 'panel', value: x}));
    });
    $form.append($('<input/>',{type : "text", name : "name"}));
    $form.append($('<input/>',{type: 'submit', value: "送信"}));
    $sent.append($form);
}