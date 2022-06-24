<?php
/**
* Functions to use in your projects
*/

function getConnection(){
    $myhost ='localhost';
    $myuser ='root';
    $mypwd ='';
    $mydb ='test';
    $connection = mysqli_connect($myhost,$myuser,$mypwd,$mydb)
        or die('Sorry, something went wrong with the connection');
    mysqli_set_charset($connection, "utf8");
    return $connection;
}

function getData_Dessert(){
  $con = getConnection();
	$sql_D = "SELECT nameDessert, imageDessert FROM Dessert";
	$dessert_query = mysqli_query($con, $sql_D) or die("Dessert DB Query ERROR!!!");
	return $dessert_query;
}

function getData_Recipe(){
  $con = getConnection();
	$sql_R = "SELECT nameDessert, linkRecipe, rating_Recipe FROM Recipe";
	$recipe_query = mysqli_query($con, $sql_R) or die("Recipe DB Query ERROR!!!");
	return $recipe_query;
}

function getData_DryIngredient(){
  $con = getConnection();
	$sql_DI = "SELECT nameDry_Ingredient FROM Dry_Ingredient";
	$dryIng_query = mysqli_query($con, $sql_DI) or die("Dry_Ingredient DB Query ERROR!!!");
	return $dryIng_query;
}

function getData_WetIngredient(){
  $con = getConnection();
	$sql_WI = "SELECT nameWet_Ingredient FROM Wet_Ingredient";
	$wetIng_query = mysqli_query($con, $sql_WI) or die("Wet_Ingredient DB Query ERROR!!!");
	return $wetIng_query;
}
function getData_DryIngQ(){
  $con = getConnection();
	$sql_DQ = "SELECT nameDessert, nameDry_Ingredient, quantity_Cup, quantity_Metric, quantity_Imperial FROM Dry_Quantity";
	$dryIngQ_query = mysqli_query($con, $sql_DQ) or die("Dry_Quantity DB Query ERROR!!!");
	return $dryIngQ_query;
}

function getData_WetIngQ(){
  $con = getConnection();
	$sql_WQ = "SELECT nameDessert, nameWet_Ingredient, quantity_Cup, quantity_Metric, quantity_Imperial FROM Wet_Quantity";
	$wetIngQ_query = mysqli_query($con,$sql_WQ) or die("Wet_Quantity DB Query ERROR!!!");
	return $wetIngQ_query;
}

function getData_searchD($DryIng){
  $con = getConnection();
	$sql_SearchD = "SELECT Dessert.nameDessert, Dry_Ingredient.nameDry_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
                  FROM Dessert, Dry_Ingredient, Dry_Quantity
                  WHERE Dessert.nameDessert = Dry_Quantity.nameDessert
                  AND Dry_Ingredient.nameDry_Ingredient = Dry_Quantity.nameDry_Ingredient
                  AND (
                      Dry_Ingredient.nameDry_Ingredient LIKE '$DryIng'
                  )";
	$sql_SearchDquery = mysqli_query($con,$sql_SearchD) or die("Error while finding desserts specific to Dry Ingredient!!!");
	return $sql_SearchDquery;
}

function getData_searchW($WetIng){
  $con = getConnection();
	$sql_SearchW = "SELECT Dessert.nameDessert, Wet_Ingredient.nameWet_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
                  FROM Dessert, Wet_Ingredient, Wet_Quantity
                  WHERE Dessert.nameDessert = Wet_Quantity.nameDessert
                  AND Wet_Ingredient.nameWet_Ingredient = Wet_Quantity.nameWet_Ingredient
                  AND (
                      Wet_Ingredient.nameWet_Ingredient LIKE '$WetIng'
                  )";
	$sql_SearchWquery = mysqli_query($con,$sql_SearchW) or die("Error while finding desserts specific to Dry Ingredient!!!");
	return $sql_SearchWquery;
}

function setData_Dessert($DessertName,$PrepTime,$CookTime,$BakeTemp,$Image){
  $con = getConnection();
	$sql_insDess = "INSERT IGNORE INTO  Dessert (nameDessert,prepTime, cookTime, bakeTemp,  imageDessert)
                  SELECT  '$DessertName','$PrepTime','$CookTime','$BakeTemp','$Image'";

  if ($con->query($sql_insDess) === TRUE) {
  echo "New record added into Dessert Table successfully\n";
} else {
  echo "Error while adding new dessert!!\n";
}
}

function setData_Recipe($DessertName,$RLink){
  $con = getConnection();
	$sql_insRec = "INSERT IGNORE INTO  Recipe (nameDessert, linkRecipe)
                  SELECT  '$DessertName', '$RLink'";
  if ($con->query($sql_insRec) === TRUE) {
  echo "New record added into Recipe Table successfully\n";
} else {
  echo "Error while adding new Recipe link!!\n";
}
}

function setData_DryIng($DryIngr){
  $con = getConnection();
	$sql_insDryIng = "INSERT IGNORE INTO  Dry_Ingredient (nameDry_Ingredient)
                  SELECT  '$DryIngr'";
  if ($con->query($sql_insDryIng) === TRUE) {
  echo "New record added into Dry Ingredient Table successfully\n";
} else {
  echo "Error while adding new record in Dry Ingredient Table!!\n";
}
}

function setData_WetIng($WetIngr){
  $con = getConnection();
	$sql_insWetIng = "INSERT IGNORE INTO  Wet_Ingredient (nameWet_Ingredient)
                  SELECT  '$WetIngr'";
  if ($con->query($sql_insWetIng) === TRUE) {
  echo "New record added into Wet Ingredient Table successfully\n";
} else {
  echo "Error while adding new record in Wet Ingredient Table!!\n";
}
}

function setData_DryQ($DessertName,$DryIngr,$DQC,$DQM,$DQI){
  $con = getConnection();
	$sql_insDryQ = "INSERT IGNORE INTO  Dry_Quantity (nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric,quantity_Imperial)
                  SELECT
                    (SELECT nameDessert
                    FROM Dessert
                    WHERE Dessert.nameDessert='$DessertName'),
                    (SELECT nameDry_Ingredient
                    FROM Dry_Ingredient
                    WHERE Dry_Ingredient.nameDry_Ingredient='$DryIngr'),
                    '$DQC','$DQM','$DQI'";
  if ($con->query($sql_insDryQ) === TRUE) {
  echo "New record added into Dry Quantity Table successfully\n";
} else {
  echo "Error while adding new record in Dry Quantity Table!!\n";
}
}

function setData_WetQ($DessertName,$WetIngr,$WQC,$WQM,$WQI){
  $con = getConnection();
	$sql_insWetQ = "INSERT IGNORE INTO  Wet_Quantity (nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric,quantity_Imperial)
                  SELECT
                  (SELECT nameDessert
                  FROM Dessert
                  WHERE Dessert.nameDessert='$DessertName'),
                  (SELECT nameWet_Ingredient
                  FROM Wet_Ingredient
                  WHERE Wet_Ingredient.nameWet_Ingredient='$WetIngr'),
                  '$WQC','$WQM','$WQI'";
  if ($con->query($sql_insWetQ) === TRUE) {
  echo "New record added into Wet Quantity Table successfully\n";
} else {
  echo "Error while adding new record in Wet Quantity Table!!\n";
}
}
