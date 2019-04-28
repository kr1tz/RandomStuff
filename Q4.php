<?php


//Need to keep track of which user so we can set the background
if(!isset($_COOKIE['user_cookie'])) {
   //Give client a random cookie
   setcookie('user_cookie', rand(1,10000), time() + (86400 * 30), "/");
}


//POST request for uploading a image to the server
if(isset($_FILES['image'])) {

      $errors= [];

      $file_name = $_FILES['image']['name'];
      $file_size = $_FILES['image']['size'];
      $file_tmp = $_FILES['image']['tmp_name'];
      $file_type = $_FILES['image']['type'];
      $exploded = explode('.',$_FILES['image']['name']);
      $file_ext=strtolower(end($exploded));
      
      //acceptable extensions
      $extensions= ["jpeg","jpg","png"];
      
      if(!in_array($file_ext,$extensions)){
         $errors[]="extension not allowed, please choose a JPEG or PNG file.";
      }

      //moves uploaded file to server
      if(empty($errors)) {
         move_uploaded_file($file_tmp, "public/images/{$_COOKIE['user_cookie']}.jpg");
         echo "Success";
      }else{
         print_r($errors);
      }


}



if (file_exists("public/images/{$_COOKIE['user_cookie']}.jpg")) {
   ?> <img src="public/images/<?=$_COOKIE['user_cookie']?>.jpg" width="1920" height="1080"> <?php
}




?>



<form action="Q4.php" method="POST" enctype="multipart/form-data">
   <input type="file" name="image">
   <input type="submit" value="upload" name="submit">
</form>


