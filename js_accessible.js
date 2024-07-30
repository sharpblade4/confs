var scrollY = 0;
window.addEventListener("keydown", function(e){
    var code = e.keyCode;
    if(code === 87) { // W
       scrollY += 20;
       window.scrollTo(0, scrollY);
    }
    if(code === 68) { // D
       scrollY -= 20;
       window.scrollTo(0, scrollY);
    }
})
