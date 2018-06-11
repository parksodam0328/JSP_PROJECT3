var indexNum = 0;
displayImage();

function displayImage() {
    var i;
    var images = document.getElementsByClassName("imageSlides");
    indexNum++;
    if (indexNum > images.length) {indexNum = 1}    
    for (i = 0; i < images.length; i++) {
    	images[i].style.display = "none";  
     }
    images[indexNum-1].style.display = "block";  
    setTimeout(displayImage, 3000); // Change image every 2 seconds
}

