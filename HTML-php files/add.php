<?php
include_once('functions.php');

 ?>
 <!doctype html>
 <html lang="en">
   <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="description" content="">
     <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
     <meta name="generator" content="Hugo 0.79.0">
     <title>Album example · Bootstrap v5.0</title>

     <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">



     <!-- Bootstrap core CSS -->
 <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

     <style>
       .bd-placeholder-img {
         font-size: 1.125rem;
         text-anchor: middle;
         -webkit-user-select: none;
         -moz-user-select: none;
         user-select: none;
       }

       @media (min-width: 768px) {
         .bd-placeholder-img-lg {
           font-size: 3.5rem;
         }
       }
     </style>


   </head>
   <body>

 <header>
   <div class="navbar navbar-dark bg-dark shadow-sm">
     <div class="container">
       <a href="#" class="navbar-brand d-flex align-items-center">
         <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
         <strong>Build your database</strong>
       </a>
     </div>
   </div>
 </header>

 <!-- Choosing dessert and getting recipe link (for footer) -->
 <main>
   <section class="py-3 text-center container">
     <h2 class="fw-light"><strong>Add a new dessert</strong></h2>
     <p class="lead text-muted">Key in values in all the fields</p>
   </section>
     <p>
          <form method="post" style = "position:absolute; left:150px; top:190px;">
               <label for="dname">Dessert Name</label><br>
               <input type="text" id="dname" name="dname" maxlength="100"><br><br>
               <label for="ptime">Preparation Time</label><br>
               <input type="text" id="ptime" name="ptime" maxlength="45"><br><br>
               <label for="ctime">Cooking Time</label><br>
               <input type="text" id="ctime" name="ctime" maxlength="45"><br><br>
               <label for="btemp">Baking Temperature</label><br>
               <input type="text" id="btemp" name="btemp" maxlength="45"><br><br>
               <label for="rlink">Link to Recipe</label><br>
               <input type="text" id="rlink" name="rlink" maxlength="200"><br><br>
               <label for="ifile">Image</label><br>
               <input type="file" id="ifile" name="ifile" accept=".jpg, .jpeg, .png"><br><br>
               <input type="submit" value="Submit" style="height:50px;width:100px;">
               <?php
                //To make sure the text boxes have value
                  //Dessert Table
                   if (isset($_POST['dname']) && isset($_POST['ptime']) && isset($_POST['ctime']) && isset($_POST['btemp']) && isset($_POST['ifile'])){
                     $DessertName = $_POST['dname'];
                     $PrepTime = $_POST['ptime'];
                     $CookTime = $_POST['ctime'];
                     $BakeTemp = $_POST['btemp'];
                     $Image = $_POST['ifile'];
                     // Onlly if values are available and set
                     if ($DessertName && $PrepTime && $CookTime && $BakeTemp && $Image != NULL ){
                       setData_Dessert($DessertName,$PrepTime,$CookTime,$BakeTemp,$Image);
                     }
                     else{
                       echo "Dessert details not filled";
                     }
                   }
                   //Recipe TABLE
                   if (isset($_POST['dname']) && isset($_POST['rlink'])){
                     $DessertName = $_POST['dname'];
                     $RLink = $_POST['rlink'];
                     if ($DessertName && $RLink !=NULL){
                       setData_Recipe($DessertName , $RLink);
                     }
                     else{
                       echo "\r\nRecipe link not filled";
                     }
                   }
                ?>
          </form>
           <form method="post" style = "position:absolute; left:630px; top:190px;">
               <label for="dname">Dessert Name</label><br>
               <input type="text" id="dname" name="dname" maxlength="100"><br><br>
               <label for="ding">Dry Ingredient</label><br>
               <input type="text" id="ding" name="ding" maxlength="50"><br><br>
               <label for="dqc">Dry - Quantity Cups</label><br>
               <input type="text" id="dqc" name="dqc" maxlength="20"><br><br>
               <label for="dqm">Dry - Quantity Metrics</label><br>
               <input type="text" id="dqm" name="dqm" maxlength="20"><br><br>
               <label for="dqi">Dry - Quantity Imperial</label><br>
               <input type="text" id="dqi" name="dqi" maxlength="20"><br><br>
               <input type="submit" value="Submit" style="height:50px;width:100px;"><br><br>
              <?php
                 //move_uploaded_file ($Image, "C:/xampp/htdocs/DessertDB");

                //To make sure the text boxes have value
                   //Dry Ingredient TABLE
                   if (isset($_POST['ding'])){
                     $DryIngr = $_POST['ding'];
                     if ($DryIngr !=NULL){
                       setData_DryIng($DryIngr);
                     }
                     //else{
                       //echo "No Dry Ingedients";
                     //}
                   }
                   //Dry Quantity table
                    if (isset($_POST['dname']) && isset($_POST['ding']) && isset($_POST['dqc']) && isset($_POST['dqm']) && isset($_POST['dqi'])){
                      $DessertName = $_POST['dname'];
                      $DryIngr = $_POST['ding'];
                      $DQC = $_POST['dqc'];
                      $DQM = $_POST['dqm'];
                      $DQI = $_POST['dqi'];
                      // Onlly if values are available and set
                      if ($DessertName && $DryIngr && $DQC && $DQM && $DQI != NULL ){
                        setData_DryQ($DessertName,$DryIngr,$DQC,$DQM,$DQI);
                      }
                      else{
                        echo "Dry ingredients fields not filled";
                      }
                    }
                ?>
          </form>
           <form method="post" style = "position:absolute; left:1100px; top:190px;">
               <label for="dname">Dessert Name</label><br>
               <input type="text" id="dname" name="dname" maxlength="100"><br><br>
               <label for="wing">Wet Ingredient</label><br>
               <input type="text" id="wing" name="wing" maxlength="50"><br><br>
               <label for="wqc">Wet - Quantity Cups</label><br>
               <input type="text" id="wqc" name="wqc" maxlength="20"><br><br>
               <label for="wqm">Wet - Quantity Metrics</label><br>
               <input type="text" id="wqm" name="wqm" maxlength="20"><br><br>
               <label for="wqi">Wet - Quantity Imperial</label><br>
               <input type="text" id="wqi" name="wqi" maxlength="20"><br><br>
               <input type="submit" value="Submit" style="height:50px;width:100px;"><br><br>
               <?php
               //move_uploaded_file ($Image, "C:/xampp/htdocs/DessertDB");

              //To make sure the text boxes have value
                 //Wet Ingredient TABLE
                 if (isset($_POST['wing'])){
                   $WetIngr = $_POST['wing'];
                   if ($WetIngr !=NULL){
                     setData_WetIng($WetIngr);
                   }
                   //else{
                     //echo "No Wet Ingedients";
                   //}
                 }
                 //Wet Quantity table
                  if (isset($_POST['dname']) && isset($_POST['wing']) && isset($_POST['wqc']) && isset($_POST['wqm']) && isset($_POST['wqi'])){
                    $DessertName = $_POST['dname'];
                    $WetIngr = $_POST['wing'];
                    $WQC = $_POST['wqc'];
                    $WQM = $_POST['wqm'];
                    $WQI = $_POST['wqi'];
                    // Onlly if values are available and set
                    if ($DessertName && $WetIngr && $WQC && $WQM && $WQI != NULL ){
                      setData_WetQ($DessertName,$WetIngr,$WQC,$WQM,$WQI);
                    }
                    else{
                      echo "Wet ingredients fields not filled";
                    }
                  }
                //move_uploaded_file ($Image, "C:/xampp/htdocs/DessertDB");
              ?>
          </form>
     </p>
 </main>

<main>
  <style>
    footer {
      position: fixed;
      padding: 10px 10px 0px 10px;
      bottom: 0;
      width: 100%;
      /* Height of the footer*/
      height: 40px;
    }
  </style>

<footer class="text-muted py-5">
  <?php
    define ('homepage', 'http://localhost/DessertDB/');
    function home_url(){
       return homepage;
    }
    ?>
  <p class="mb-100"><a href="<?php echo home_url(); ?>">Back to homepage</a></p>
</footer>
 </main>
     <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
   </body>
 </html>
