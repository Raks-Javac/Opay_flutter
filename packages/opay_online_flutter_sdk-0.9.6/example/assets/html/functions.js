function getUserAgent(){
        alert(navigator.userAgent)
    }
function ok(){
    window.clickResultOKBtn.postMessage(
        "{\"eventName\":\"ok\",\"orderStatus\":\"2\",\"orderNo\":\"3\",\"payNo\":\"3\",\"merchantId\":\"3\",\"referenceCode\":\"3\"}"
    );
}
function cancel(){
    window.clickResultCancelBtn.postMessage(
        "{\"eventName\":\"cancel\",\"orderStatus\":\"2\",\"orderNo\":\"3\",\"payNo\":\"3\",\"merchantId\":\"3\",\"referenceCode\":\"3\"}"
    );
}

function referenceCodeReturn(){
    window.clickReferenceCodeReturnBtn.postMessage(
        "{\"eventName\":\"referenceCodeReturn\",\"orderStatus\":\"2\",\"orderNo\":\"3\",\"payNo\":\"3\",\"merchantId\":\"3\",\"referenceCode\":\"3\"}"
    );
}