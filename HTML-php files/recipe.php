<?php
include_once('functions.php');
$dessert_query = getData_Dessert();
$recipe_query = getData_Recipe ();
$dryIng_query = getData_DryIngredient();
$wetIng_query = getData_WetIngredient();
$dryIngQ_query = getData_DryIngQ();
$wetIngQ_query = getData_WetIngQ();

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
   <div class="collapse bg-dark" id="navbarHeader">
     <div class="container">
       <div class="row">
         <div class="col-sm-8 col-md-7 py-4">
           <h4 class="text-white">About</h4>
           <p class="text-muted">Find the ingredients needed for making your dessert! And a quick look at the recipe!</p>
         </div>
         <div class="col-sm-4 offset-md-1 py-4">
           <?php
             define ('homepage', 'http://localhost/DessertDB/');
             function home_url(){
                return homepage;
             }
             ?>
           <h5 class="mb-100"><a href="<?php echo home_url(); ?>">Back to homepage</a></h5>
           <ul class="list-unstyled">
           </ul>
         </div>
       </div>
     </div>
   </div>
   <div class="navbar navbar-dark bg-dark shadow-sm">
     <div class="container">
       <a href="#" class="navbar-brand d-flex align-items-center">
         <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
         <strong>All You Need</strong>
       </a>
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
       </button>
     </div>
   </div>
 </header>

 <!-- Choosing dessert and getting recipe link (for footer) -->
 <main>
   <section class="py-5 text-center container">
     <h2 class="fw-light"><strong>Choose your dessert of choice</strong></h2>
     <p class="lead text-muted">Select from the drop down</p>
     <p>
       <form method="post">
        <div class="mb-3">
          <label for="model" class="recipe-label"><b>Dessert</b></label>
          <style>
            select {
                width: 150px;
                margin: 10px;
            }
            select:focus {
                min-width: 150px;
                width: auto;
            }
          </style>
            <select name="sel_dessert" id="sel_dessert" value="sel_dessert">
              <option value="none">---Select---</option>
                <?php
                  $Dessertlink = "! Please select a dessert to view the recipe! ";
                  while ($row = mysqli_fetch_array($dessert_query)){
                    echo "<option value='". $row['nameDessert'] ."'>" . $row['nameDessert'] . "</option>";
                    $DessertVal = $_POST['sel_dessert'];
                    while ($recipe_row = mysqli_fetch_array($recipe_query)){
                      if ($recipe_row['nameDessert'] == $DessertVal){
                        $Dessertlink = $recipe_row['linkRecipe'];
                      }
                    }
                  }
                ?>
            </select>
            <div class="boxed">
              <input type="submit" name="operator" value="Select" />
            </div>
            <div class="boxed">
              <label name="link" id = "link" value="link" />
            </div>
        </div>
<!-- Table for dry ingredients -->
        <style>
          table{
            border-style: ridge;
            padding: 20px;
            }
            th,td {
              padding: 10px;
              border: 1px solid black;
              border-collapse: collapse;
            }
        </style>
        <table align="left">
          <caption style="text-align:center"><b>Dry Ingredients needed</b></caption>
         <thead>
           <tr>
             <th>Dry Ingredient</th>
             <th>Cups</th>
             <th>Metrics</th>
             <th>Imperial</th>
           </tr>
         </thead>
         <tbody>
            <?php
              while ($dryIngQ_search = mysqli_fetch_array($dryIngQ_query)){
                if ($dryIngQ_search['nameDessert'] == $DessertVal){
                  echo "<tr><td>{$dryIngQ_search['nameDry_Ingredient']}</td><td>{$dryIngQ_search['quantity_Cup']}</td><td>{$dryIngQ_search['quantity_Metric']}</td><td>{$dryIngQ_search['quantity_Imperial']}</td></tr>\n";
                }
              }
            ?>
          </tbody>
        </table>
<!-- Table for wet ingredients -->
        <style>
          table{
            border-style: ridge;
            padding: 20px;
            }
            th,td {
              padding: 10px;
              border: 1px solid black;
              border-collapse: collapse;
            }
        </style>
        <table align="right">
          <caption style="text-align:center"><b>Wet Ingredients needed</b></caption>
         <thead>
           <tr>
             <th>Wet Ingredient</th>
             <th>Cups</th>
             <th>Metrics</th>
             <th>Imperial</th>
           </tr>
         </thead>
         <tbody>
            <?php
              while ($wetIngQ_search = mysqli_fetch_array($wetIngQ_query)){
                if ($wetIngQ_search['nameDessert'] == $DessertVal){
                  echo "<tr><td>{$wetIngQ_search['nameWet_Ingredient']}</td><td>{$wetIngQ_search['quantity_Cup']}</td><td>{$wetIngQ_search['quantity_Metric']}</td><td>{$wetIngQ_search['quantity_Imperial']}</td></tr>\n";
                }
              }
            ?>
          </tbody>
        </table>
      </form>
     </p>
   </section>
 </main>

<main>
  <style>
    footer {
      position: fixed;
      padding: 10px 10px 0px 10px;
      bottom: 0;
      width: 100%;
      /* Height of the footer*/
      height: 20px;
    }
  </style>

<footer class="text-muted py-5">
  <p class="mb-100"><b>Find your recipe here</b> <a href="<?php echo $Dessertlink ?>"><?php echo $Dessertlink ?></a></p>
  
</footer>
 </main>
     <script src="assets/dist/js/bootstrap.bundle.min.js"></script>
   </body>
 </html>
