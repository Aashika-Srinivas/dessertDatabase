<?php

include_once('functions.php');
$dessert_query = getData_Dessert();
$recipe_query = getData_Recipe ();


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
           <p class="text-muted">Welcome to the Dessert Database. Find your favourite dessert's recipes, search through the database with just your available ingredients - and we'll show you which dessert you can make! To maintain this as your own database, you can also add your recipes! Go ahead, try it! </p>
         </div>
         <div class="col-sm-4 offset-md-1 py-4">
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
         <strong>Welcome</strong>
       </a>
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
       </button>
     </div>
   </div>
 </header>

 <main>

   <section class="py-5 text-center container">
     <div class="row py-lg-5">
       <div class="col-lg-6 col-md-8 mx-auto">
         <h1 class="fw-light">Dessert Database</h1>
         <p class="lead text-muted">One stop place for Dessert Ideas</p>
         <p>
           <!-- Linking php pages with buttons -->
           <a href="recipe.php" class="btn btn-primary my-2">Checkout Recipes</a>
           <a href="ingredient.php" class="btn btn-primary my-2">Search by Ingredient</a>
           <a href="add.php" class="btn btn-primary my-2">Add your Dessert</a>
         </p>
       </div>
     </div>
   </section>

   <div class="album py-5 bg-light">
     <div class="container">

       <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

<?php  while ($data = mysqli_fetch_array($dessert_query)){ ?>
               <div class="col">
                 <div class="card shadow-sm">
                   <img class="bd-placeholder-img card-img-top" width="100" height="200" src="<?php echo $data['imageDessert']; ?>"/>

                   <div class="card-body">
                     <p class="card-text"> <?php echo $data['nameDessert']; ?></p>
                     <div class="d-flex justify-content-between align-items-center">
                     </div>
                   </div>
                 </div>
               </div>

         <?php  } ?>
       </div>
     </div>
   </div>

 </main>

 <footer class="text-muted py-5">
   <div class="container">
     <p class="float-end mb-1">
       <a href="#">Back to top</a>
     </p>
     <p class="mb-1">Dessert Database for Relational Database Course &copy; Aashika Srinivas</p>
     <p class="mb-0">MAIT Matriculation Number : 11148272</p>
   </div>
 </footer>


     <script src="assets/dist/js/bootstrap.bundle.min.js"></script>


   </body>
 </html>
