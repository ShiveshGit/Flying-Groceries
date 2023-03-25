window.onload=()=>{
    let more=document.getElementsByClassName("more")[0];
    let moreLink=document.getElementsByClassName("more")[1];
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
    const req =async(data,csrf,url)=>{
       
        const options ={
            method:'POST',
            headers:{
                'Content-Type':'application/json',
                'X-CSRFToken' : csrf
            },
            body:JSON.stringify(data)
        };
        let p =await fetch(url,options);
        let response = await p.json();
        return response;
    }
    const mainFunc=async()=>{
        let priceFilter = document.getElementById("priceFilter")
        let discountFilter = document.getElementById("discountFilter")
        let clickedPrice = 0;
        let clickedDiscount = 0;
        let url = "/shop/home"
        priceFilter.onclick=(e)=>{
            clickedPrice=clickedPrice^1;
        }
        discountFilter.onclick=(e)=>{
            clickedDiscount=clickedDiscount^1;
        }
        const data = {clickedPrice,clickedDiscount}
        const csrf = document.querySelector('[name = csrfmiddlewaretoken]').value
        let res = await req(data,csrf,url);
        console.log(res)
    }
    mainFunc()
}