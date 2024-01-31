$(document).ready(function(){
    $.ajax({ url: "http://localhost:9191/mobilestore/",
        context: document.body,
        success: function(){
            alert("Load index success");
        }
    });
});