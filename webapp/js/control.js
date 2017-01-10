/*勇者の初期位置の設定*/ 
function init(s, id) {
    var start_y = Math.floor(s / 5);
    var start_x = Math.floor(s % 5);
    console.log(start_x);
    console.log(start_y);
    id.style.top = 100 * start_y;
    id.style.left = 100 * start_x;
}
/*勇者が移動する関数*/
function up(p, size, id) {
    if (p - size > -1) {
        if(mapevent(j_map[p-size])){
            p = p - size;
            position_update(p,id);
        }
    }
    console.log("up");
    console.log("now_position " + p);
    return p;
}
function down(p, size, id) {
    if (p + size < size * size) {
        if(mapevent(j_map[p+size])){
            p = p + size;
            position_update(p,id);
        }
    }
    console.log("down");
    console.log("now_position " + p);
    return p;
}
function right(p, size, id) {
    if ((p % 5) != 4) {
        if(mapevent(j_map[p+1])){
            p = p + 1;
            position_update(p,id);
        }
    }
    console.log("right");
    console.log("now_position " + p);
    return p;
}
function left(p, size, id) {
    if ((p % 5) != 0) {
        if(mapevent(j_map[p-1])){
            p = p - 1;
            position_update(p,id);
        }
    }
    console.log("left");
    console.log("now_position " + p);
    return p;
}
/*クリックしたときの関数*/
document.onkeydown = function (e) {
    var key_code = e.keyCode;
    if (key_code == 37) {
        now_position = left(now_position, size, ca);
    }
    if (key_code == 38) {
        now_position = up(now_position, size, ca);
    }
    if (key_code == 39) {
        now_position = right(now_position, size, ca);
    }
    if (key_code == 40) {
        now_position = down(now_position, size, ca);
    }
    /*console.log(key_code);*/
}
/*パネルごとのイベント*/
function mapevent(num) {
    if (num == 1) {
        return false;
    }
    return true;
}
/*立ち位置を更新する関数*/
function position_update(p, id) {
    var now_y = Math.floor(p / 5);
    var now_x = Math.floor(p % 5);
    id.style.top = 100 * now_y;
    id.style.left = 100 * now_x;
}