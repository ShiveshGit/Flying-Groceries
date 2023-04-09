window.onload=()=>{
    function getCookie(name)
    {
        let cookieValue = null;
        if(document.cookie && document.cookie !== "")
        {
            const cookies  = document.cookie.split(";");
            for(let i=0;i<cookies.length;i++)
            {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + "="))
                {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    let more=document.getElementsByClassName("more")[0];
    let moreLink=document.getElementsByClassName("more")[1];
    console.log(moreLink);
    var x=0;
    more.onclick=()=>{
        x++;
        console.log(x);
        let dropdown=document.getElementsByClassName("dropdown")[0];
        dropdown.classList.toggle("makeVisible");
        if(x%2!=0)
        {
            moreLink.innerHTML="More &#8963;";
            console.log("In If")
        }
        else
        {
            moreLink.innerHTML="More &#8964;";
            console.log("In else")
        }
    }
    cartButton = document.getElementsByClassName("CartButton");
    addedButton = document.getElementsByClassName("AddedButton");
    for(let i in cartButton)
    {
        console.log(cartButton[i]);
        cartButton[i].onclick=()=>{
            cartButton[i].style.display="none";
            addedButton[i].style.display="block";
            addedButton[i].disabled=true;
            console.log(cartButton[i].classList)
            let prodId = cartButton[i].id;
            let catId = cartButton[i].classList[1];
            let subCatId = cartButton[i].classList[2];
            if(subCatId === undefined)
            {
                subCatId=catId;
            }
            console.log(subCatId);
            // console.log(catId,subCatId)
            fetch('/shop/cart',{
                method:'POST',
                headers:{
                    "X-Requested-With": "XMLHttpRequest",
                    "X-CSRFToken": getCookie("csrftoken"),
                    'Content-Type':'application/json'
                },
                body:JSON.stringify({
                    purpose:1,
                    productId:prodId,
                    categoryId:catId,
                    subCategoryId:subCatId

                })
            })
            .then((response)=>{
                    return response.json();
            })
            .catch((error)=>{
                    console.log("Got error")
            })
        }
    }
}