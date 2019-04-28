<?php

//check to see if the data was posted.
if (isset($_POST['submit_horse'])) {

   //declare our variables to pass to function
   $vars = [
      "action"    => $_POST['action'], 
      "name"      => $_POST['name'], 
      "breed"     => $_POST['breed'], 
      "height"    => $_POST['height'], 
      "weight"    => $_POST['weight'], 
      "age"       => $_POST['age']
   ];
      
   //validate and add to db
   addHorseToDatabase($vars);
      
}

/*
   Function: addHorsetoDatabase

   Function to sanitize/validate post variables then adds them to the db.

   @param: $horse - horse object with the post variables
   @returns nothing
*/
function addHorseToDatabase($horse) {

   //create a list of errors
   $errors = [];

   //sanitize each string value
   $horse['action'] = trim(filter_var($horse['action'], FILTER_SANITIZE_STRING));
   $horse['name'] = trim(filter_var($horse['name'], FILTER_SANITIZE_STRING));
   $horse['breed'] = trim(filter_var($horse['breed'], FILTER_SANITIZE_STRING));


   //Validate numbers for heigh, weight, and age
   if(!is_numeric($horse['height']) || $horse['height'] < 0) 
      $errors[] = "Horse Height must be a number or a positive value";

   if(!is_numeric($horse['weight']) || $horse['weight'] < 0) 
      $errors[] = "Horse Weight must be a number or a positive value";

   if(!is_numeric($horse['age']) || $horse['age'] < 0) 
      $errors[] = "Horse Age must be a number or a positive value";
      
   //If error exists, return errors
   if (sizeof($errors) > 0){
      die(print_r($errors));
   }
      

   /*
      Answer example to Q6
   */
   //open a PDO connection
   $pdo = new PDO("mysql:host=localhost;dbname=horses_db", 'root', '');

   //prepare a SQL statement using PDO and prepared statements
   $stmt = $pdo->prepare("INSERT INTO horse (action, name, breed, height, weight, age) VALUES (?,?,?,?,?,?)");

   //execute out prepared statement with out variables
   $stmt->execute([
      $horse['action'], 
      $horse['name'],
      $horse['breed'], 
      $horse['height'],
      $horse['weight'], 
      $horse['age']
   ]);

   //close connection for our PDO connection
   $stmt = null;
   $pdo = null;     
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Question 5</title>
</head>




<body>

   <form method="POST" action="Q5-6.php">
      <input type="text" name="action" value="" placeholder="action">
      <input type="text" name="name" value="" placeholder="name">
      <input type="text" name="breed" value="" placeholder="breed">
      <input type="text" name="height" value="" placeholder="height">
      <input type="text" name="weight" value="" placeholder="weight">
      <input type="text" name="age" value="" placeholder="age">

      <input type="submit" name="submit_horse" value="Submit Horse">
   </form>

</body>
</html>