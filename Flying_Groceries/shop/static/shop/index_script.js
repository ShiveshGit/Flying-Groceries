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
    
}