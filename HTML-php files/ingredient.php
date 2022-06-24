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

   <div class="navbar navbar-dark bg-dark shadow-sm">
     <div class="container">
       <a href="#" class="navbar-brand d-flex align-items-center">
         <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
         <strong>Ingredients</strong>
       </a>
     </div>
   </div>

 <main>
<!--Style of placement for the two sections -->
   <style>
   .topright {
      position: absolute;
      top: 110px;
      right: 50px;
      }
    .topleft {
       position: absolute;
       top: 110px;
       left: 50px;
       }
    </style>

<!-- Dry ingredient search -->
   <section class="topleft">
     <h3 class="fw-light"><strong>Choose your available Dry Ingredient</strong></h3>
     <p class="lead text-muted">Select from the drop down</p>
     <p>
       <form method="post">
        <div class="mb-3">
          <label for="model" class="recipe-label"><b>Dry Ingredients</b></label>
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
            <select name="sel_dry" id="sel_dry" value="sel_dry">
              <option value="none">---Select---</option>
                <?php
                  $Dessertlink = "! Please select a dessert to view the recipe! ";
                  while ($row = mysqli_fetch_array($dryIng_query)){
                    echo "<option value='". $row['nameDry_Ingredient'] ."'>" . $row['nameDry_Ingredient'] . "</option>";
                      }
                  $DryIng = $_POST['sel_dry'];
                ?>
            </select>
            <div class="boxed">
              <input type="submit" name="operator" value="Select" />
            </div>
            <div class="boxed">
              <label name="link" id = "link" value="link" />
            </div>
            <?php
            $sql_SearchDquery = getData_searchD($DryIng);
            ?>
          </div>
        </form>
       </p>
     </section>
<!-- Table displaying dry ingredient dessert -->
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
        .midleft {
           position: absolute;
           top: 300px;
           left: 50px;
           }
    </style>
    <table align="left" class ="midleft">
      <caption style="text-align:center"><b>Desserts you can make</b></caption>
     <thead>
       <tr>
         <th>Dessert Name</th>
         <th>Cups</th>
         <th>Metrics</th>
         <th>Imperial</th>
       </tr>
     </thead>
     <tbody>
        <?php
          while ($searchD = $sql_SearchDquery->fetch_assoc()){
              echo "<tr><td>{$searchD['nameDessert']}</td><td>{$searchD['quantity_Cup']}</td><td>{$searchD['quantity_Metric']}</td><td>{$searchD['quantity_Imperial']}</td></tr>\n";
            }
        ?>
      </tbody>
    </table>


<!-- Wet ingredient search -->
 <section class="topright" >
   <h3 class="fw-light" ><strong>Choose your available Wet Ingredient</strong></h3>
   <p class="lead text-muted">Select from the drop down</p>
   <p>
     <form method="post">
       <div class="mb-3">
         <label for="model" class="recipe-label"><b>Wet Ingredients</b></label>
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
           <select name="sel_wet" id="sel_wet" value="sel_wet">
             <option value="none">---Select---</option>
               <?php
                 $sel_wet = "! Please select a wet ingredient to view the desserts! ";
                 $Dessertlink = "! Please select a dessert to view the recipe! ";
                 while ($rowW = mysqli_fetch_array($wetIng_query)){
                   echo "<option value='". $rowW['nameWet_Ingredient'] ."'>" . $rowW['nameWet_Ingredient'] . "</option>";
                     }
                 $WetIng = $_POST['sel_wet'];
               ?>
           </select>
           <div class="boxed">
             <input type="submit" name="operator" value="Select" />
           </div>
           <div class="boxed">
             <label name="link" id = "link" value="link" />
           </div>
           <?php
           $sql_SearchWquery = getData_searchW($WetIng);
           ?>
         </div>
       </form>
      </p>
    </section>

<!-- Table displaying wet ingredient dessert -->
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
      .midright {
         position: absolute;
         top: 300px;
         right: 160px;
         }
  </style>
  <table align="right" class="midright">
    <caption style="text-align:center"><b>Desserts you can make</b></caption>
   <thead>
     <tr>
       <th>Dessert Name</th>
       <th>Cups</th>
       <th>Metrics</th>
       <th>Imperial</th>
     </tr>
   </thead>
   <tbody>
      <?php
        while ($searchW = $sql_SearchWquery->fetch_assoc()){
            echo "<tr><td>{$searchW['nameDessert']}</td><td>{$searchW['quantity_Cup']}</td><td>{$searchW['quantity_Metric']}</td><td>{$searchW['quantity_Imperial']}</td></tr>\n";
          }
      ?>
    </tbody>
  </table>


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
