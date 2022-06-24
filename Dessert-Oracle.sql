/**
--Creating Dessert
--Aashika
--Relational DB
--Version 1.0
*/

-- activates the output for DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- DDL - DATA DEFINITION LANGUAGE
-- CREATE, DROP, ALTER

-- DROPPING TABLE
DROP TABLE Dessert CASCADE CONSTRAINTS;
DROP TABLE Recipe CASCADE CONSTRAINTS;
DROP TABLE Dry_Ingredient CASCADE CONSTRAINTS;
DROP TABLE Wet_Ingredient CASCADE CONSTRAINTS;
DROP TABLE Dry_Quantity CASCADE CONSTRAINTS;
DROP TABLE Wet_Quantity CASCADE CONSTRAINTS;
DROP TABLE Device_Used CASCADE CONSTRAINTS;
DROP TABLE Dessert_Devices CASCADE CONSTRAINTS;

-- DROPPING SEQUENCE
DROP SEQUENCE seq_Dessert;
DROP SEQUENCE seq_Recipe;
DROP SEQUENCE seq_Dry_Ingredient;
DROP SEQUENCE seq_Wet_Ingredient;
DROP SEQUENCE seq_Dry_Quantity;
DROP SEQUENCE seq_Wet_Quantity;
DROP SEQUENCE seq_Device_Used;
DROP SEQUENCE seq_Dessert_Devices;

CREATE TABLE Dessert(
  idDessert INT NOT NULL,
  nameDessert VARCHAR(45) NOT NULL PRIMARY KEY,
  prepTime VARCHAR(45) NOT NULL,
  cookTime VARCHAR(45) NOT NULL,
  totalTime VARCHAR(45) NULL,
  bakeTemp VARCHAR(45) NULL,
  totalCalories DECIMAL NULL,
  servings INT NULL,
  imageDessert BLOB
);
CREATE TABLE Recipe(
  idRecipe INT PRIMARY KEY,
  nameDessert VARCHAR(45) NOT NULL,
  linkRecipe VARCHAR(200) NOT NULL UNIQUE,
  rating_Recipe VARCHAR(20) NULL,
  CONSTRAINT fk_Dessert FOREIGN KEY (nameDessert) REFERENCES Dessert(nameDessert)
);
CREATE TABLE Dry_Ingredient(
  idDry_Ingredient INT NOT NULL,
  nameDry_Ingredient VARCHAR(200) NOT NULL PRIMARY KEY
);
CREATE TABLE Wet_Ingredient(
  idWet_Ingredient INT NOT NULL,
  nameWet_Ingredient VARCHAR(200) NOT NULL PRIMARY KEY
);
CREATE TABLE Dry_Quantity(
  idDry_quantity INT NOT NULL PRIMARY KEY,
  nameDessert VARCHAR(45) NOT NULL,
  nameDry_Ingredient VARCHAR(200) NOT NULL,
  quantity_Cup VARCHAR(20) NOT NULL,
  quantity_Metric VARCHAR(20) NOT NULL,
  quantity_Imperial VARCHAR(20) NOT NULL,
  CONSTRAINT fk_Dessert_Dry FOREIGN KEY (nameDessert) REFERENCES Dessert(nameDessert),
  CONSTRAINT fk_DryIng FOREIGN KEY (nameDry_Ingredient) REFERENCES Dry_Ingredient(nameDry_Ingredient)
);
CREATE TABLE Wet_Quantity(
  idWet_quantity INT NOT NULL PRIMARY KEY,
  nameDessert VARCHAR(45) NOT NULL,
  nameWet_Ingredient VARCHAR(200) NOT NULL,
  quantity_Cup VARCHAR(20) NOT NULL,
  quantity_Metric VARCHAR(20) NOT NULL,
  quantity_Imperial VARCHAR(20) NOT NULL,
  CONSTRAINT fk_Dessert_Wet FOREIGN KEY (nameDessert) REFERENCES Dessert(nameDessert),
  CONSTRAINT fk_WetIng FOREIGN KEY (nameWet_Ingredient) REFERENCES Wet_Ingredient(nameWet_Ingredient)
);
CREATE TABLE Device_Used(
  idDevice INT NOT NULL,
  nameDevice VARCHAR(45) NOT NULL PRIMARY KEY
);
CREATE TABLE Dessert_Devices(
  idDessert_Device INT NOT NULL PRIMARY KEY,
  nameDessert VARCHAR(45) NOT NULL,
  nameDevice VARCHAR(45) NOT NULL,
  CONSTRAINT fk_Dessert_Device FOREIGN KEY (nameDessert) REFERENCES Dessert(nameDessert),
  CONSTRAINT fk_Device FOREIGN KEY (nameDevice) REFERENCES Device_Used(nameDevice)
);

-- CREATE SEQUENCES
CREATE SEQUENCE seq_Dessert;
CREATE SEQUENCE seq_Recipe;
CREATE SEQUENCE seq_Dry_Ingredient;
CREATE SEQUENCE seq_Wet_Ingredient;
CREATE SEQUENCE seq_Dry_Quantity;
CREATE SEQUENCE seq_Wet_Quantity;
CREATE SEQUENCE seq_Device_Used;
CREATE SEQUENCE seq_Dessert_Devices;

--TRIGGERS - After every INSERT/UPDATE/DELETE - Should be compiled before any DML operations.
-- Transition Variables: OLD, NEW

--TRIGGER FOR NEW DESSERT
CREATE OR REPLACE TRIGGER t_Dessert
AFTER INSERT OR UPDATE OR DELETE ON Dessert
FOR EACH ROW
BEGIN
    CASE
        WHEN INSERTING THEN
            DBMS_OUTPUT.PUT_LINE('New Dessert ' || :NEW.nameDessert || ' INSERTED. Update other columns if necessary');
        WHEN UPDATING THEN
            DBMS_OUTPUT.PUT_LINE('Existing Dessert ' || :OLD.nameDessert || ' UPDATED to ' || :NEW.nameDessert || ' Update other columns if necessary');
        WHEN DELETING THEN
            DBMS_OUTPUT.PUT_LINE('Old Dessert ' || :OLD.nameDessert || ' DELETED. Update other columns if necessary');
    END CASE;
END;
/
SHOW ERRORS;

--TRIGGER FOR NEW DEVICE
CREATE OR REPLACE TRIGGER t_Device
AFTER INSERT OR UPDATE OR DELETE ON Device_Used
FOR EACH ROW
BEGIN
    CASE
        WHEN INSERTING THEN
            DBMS_OUTPUT.PUT_LINE('New Device ' || :NEW.nameDevice || ' INSERTED. Update other columns if necessary');
        WHEN UPDATING THEN
            DBMS_OUTPUT.PUT_LINE('Existing Device ' || :OLD.nameDevice || ' UPDATED to ' || :NEW.nameDevice || ' Update other columns if necessary');
        WHEN DELETING THEN
            DBMS_OUTPUT.PUT_LINE('Old Device ' || :OLD.nameDevice || ' DELETED. Update other columns if necessary');
    END CASE;
END;
/
SHOW ERRORS;


--DML - DATA MANIPULATION LANGUAGE
-- INSERT INTO, UPDATE, DELETE

--Dessert Table
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings, imageDessert)
VALUES (seq_Dessert.NEXTVAL, 'Birthday Cake', '30 mins', '1 hr 30 mins', '2hrs', '180C', 1000.8 ,16, utl_raw.cast_to_raw('birthday-cake.png'));
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings, imageDessert)
VALUES (seq_Dessert.NEXTVAL, 'Neapolitan Bundt Cake', '15 mins', '1 hr 45 mins', '2hrs', '180C', 1000.8 ,12, utl_raw.cast_to_raw('bundt-cake.png'));
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings, imageDessert)
VALUES (seq_Dessert.NEXTVAL, 'Swiss Roll Cake', '15 mins', '1 hr', '1 hr 15 mins', '180C', 1000.8 ,12,utl_raw.cast_to_raw('swiss-roll-cake.png'));
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings, imageDessert)
VALUES (seq_Dessert.NEXTVAL, 'Brownies', '15 mins', '20 mins', '35 mins', '180C', 229 ,20, utl_raw.cast_to_raw('brownie.png'));
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings, imageDessert)
VALUES (seq_Dessert.NEXTVAL, 'Millionaires Shortbread', '20 mins', '40 mins', '4 hrs', '180C', 1050,16, utl_raw.cast_to_raw('shortbread.png'));

--Recipe Table
INSERT INTO Recipe (idRecipe,nameDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 'Birthday Cake', 'https://www.delish.com/cooking/recipe-ideas/a23120595/funfetti-cake-birthday-cake-recipe/', '4.9/5');
INSERT INTO Recipe (idRecipe,nameDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 'Neapolitan Bundt Cake', 'https://www.delish.com/cooking/recipe-ideas/a22998713/neapolitan-bundt-cake-recipe/', '4.0/5');
INSERT INTO Recipe (idRecipe,nameDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 'Swiss Roll Cake', 'https://www.delish.com/cooking/recipes/a49982/swiss-roll-cake-recipe/', '4.5/5');
INSERT INTO Recipe (idRecipe,nameDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 'Brownies', 'https://www.allrecipes.com/recipe/9599/quick-and-easy-brownies/', '4.7/5');
INSERT INTO Recipe (idRecipe,nameDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 'Millionaires Shortbread', 'https://www.janespatisserie.com/2020/04/22/millionaires-shortbread-2/', '4.9/5');

--Dry Ingredient table
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'sugar');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'all-purpose flour');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'baking powder');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'cake mix');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'chocolate chips');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'sprinkles');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'cornstarch');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'cocoa powder');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'salt');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'walnuts');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'milk chocolate');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'white chocolate');

--Wet Ingredient table
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'butter');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'eggs');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'vanilla extract');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'heavy cream');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'sour cream');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'chocolate syrup');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'strawberry syrup');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'marshmellow creme');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'milk');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'golden syrup');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'condensed milk');

--Dry Ingredient quantity
--Birthday Cake
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Birthday Cake', 'sugar', '8 1/4 cups', '1658g', '58.58oz');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Birthday Cake', 'all-purpose flour', '3 cups', '408g', '24oz');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Birthday Cake', 'baking powder', '2 tsp', '2 tsp', '2 tsp');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Birthday Cake', 'sprinkles', '1/2 cup','64g', '4oz');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Birthday Cake', 'cornstarch', '1/4 cup','34g', '2oz');
--Neopolitan Bundt Cake
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'cake mix', '1 box', '1 box', '1 box');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'chocolate chips', '1 1/2 cups', '192g', '6.75oz');
--Swiss roll
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Swiss Roll Cake', 'cake mix', '1 box', '1 box', '1 box');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Swiss Roll Cake', 'chocolate chips', '1 1/2 cups', '192g', '6.75oz');
INSERT INTO Dry_Quantity (idDry_quantity, nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Swiss Roll Cake', 'sugar', '1 cup', '128g', '4.5oz');
--Brownies
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Brownies', 'sugar', '2 cups', '402g', '14.2oz');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Brownies', 'all-purpose flour', '1 1/2 cups', '204g', '7.2oz');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Brownies', 'baking powder', '1/2 tsp', '1/2 tsp', '1/2 tsp');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Brownies', 'cocoa powder', '1/2 cup', '68g', '2.4oz');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Brownies', 'salt', '1/2 tsp', '1/2 tsp', '1/2 tsp');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Brownies', 'walnuts', '1/2 cup', '64g', '2.25oz');
--Shortbread
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Millionaires Shortbread', 'sugar', '3/4 cup', '142.3g', '5oz');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Millionaires Shortbread', 'all-purpose flour', '2 cups', '275g', '9.7oz');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Millionaires Shortbread', 'milk chocolate', '1 1/2 cups', '200g', '7.5oz');
INSERT INTO Dry_Quantity (idDry_quantity,nameDessert,nameDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 'Millionaires Shortbread', 'white chocolate', '3/4 cup', '100g', '3.6oz');

--Wet Ingredient quantity
--Birthday Cake
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Birthday Cake', 'butter', '3 cups', '681ml', '24oz');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Birthday Cake', 'eggs', '4 large', '4 large', '4 large' );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Birthday Cake', 'vanilla extract', '1 tbsp + 1 tsp', '1 tbsp + 1 tsp', '1 tbsp + 1 tsp');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Birthday Cake', 'heavy cream', '1/4 cups', '59.25ml', '2fl oz'  );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Birthday Cake', 'sour cream', '1/4 cups', '59.25ml', '2fl oz' );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Birthday Cake', 'milk', '1 1/4 cups', '296.25ml', '10fl oz' );
--Neopolitan Bundt Cake
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'butter', '1/3 cups', '76ml', '3fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'eggs', '3 egg whites', '3 egg whites', '3 egg whitese' );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'vanilla extract', '1 tsp', '1 tsp', '1 tsp');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'heavy cream', '3/4 cups', '200ml', '6fl oz'  );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'chocolate syrup', '1/4 cups', '59.25ml', '2fl oz' );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'strawberry syrup', '2 tbsp', '2 tbsp', '2 tbsp' );
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Neapolitan Bundt Cake', 'milk', '1 cup', '237ml', '8fl oz' );
--Swiss roll
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Swiss Roll Cake', 'butter', '1/2 cup', '118.5ml', '4fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Swiss Roll Cake', 'vanilla extract', '1 tsp', '1 tsp', '1 tsp');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Swiss Roll Cake', 'heavy cream', '3/4 cup', '200ml', '6fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Swiss Roll Cake', 'marshmellow creme', '1 cup', '237ml', '7.5fl oz'  );
--brownies
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Brownies', 'butter', '1 cup', '237ml', '8fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Brownies', 'eggs', '4 eggs', '4 eggs', '4 eggs');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Brownies', 'vanilla extract', '1 tsp', '1 tsp', '1 tsp');
--shortbread
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Millionaires Shortbread', 'butter', '1 3/4 cup', '400ml', '14fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Millionaires Shortbread', 'golden syrup', '4 tbsp', '4 tbsp', '4 tbsp');
INSERT INTO Wet_Quantity (idWet_quantity, nameDessert,nameWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 'Millionaires Shortbread', 'condensed milk', '1 3/4 cup', '400ml', '14fl oz');

--Devices
INSERT INTO Device_Used (idDevice,nameDevice)
VALUES (seq_Device_Used.NEXTVAL, 'oven');
INSERT INTO Device_Used (idDevice,nameDevice)
VALUES (seq_Device_Used.NEXTVAL, 'hand mixer');
INSERT INTO Device_Used (idDevice,nameDevice)
VALUES (seq_Device_Used.NEXTVAL, 'cake pans');

--Dessert Device
--Birthday Cake
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Birthday Cake', 'oven');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Birthday Cake', 'hand mixer');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Birthday Cake', 'cake pans');
--Neopolitan Bundt cake
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Neapolitan Bundt Cake', 'oven');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Neapolitan Bundt Cake', 'hand mixer');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Neapolitan Bundt Cake', 'cake pans');
--Swiss roll
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Swiss Roll Cake', 'oven');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Swiss Roll Cake', 'hand mixer');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Swiss Roll Cake', 'cake pans');
--Brownies
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Brownies', 'oven');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Brownies', 'cake pans');
--shortbread
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Millionaires Shortbread', 'oven');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Millionaires Shortbread', 'hand mixer');
INSERT INTO Dessert_Devices (idDessert_Device, nameDessert,nameDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,'Millionaires Shortbread', 'cake pans');

COMMIT; -- ends transaction
-- query examples from the use cases:

--IMPORTING DATA FROM EXTERNAL DATABASE

--IMPORTING into Dessert Table
INSERT /*+ ignore_row_on_dupkey_index ( Dessert ( nameDessert ) ) */
INTO  Dessert (idDessert, nameDessert,prepTime, cookTime, totalTime, bakeTemp, totalCalories, servings, imageDessert)
SELECT  seq_Dessert.NEXTVAL,  Name_D, PREPTIME, COOKTIME, TOTALTIME, baketemp, total_cal, servings, utl_raw.cast_to_raw(imageD)
FROM import_recipe;

--Importing into Recipe tables
INSERT /*+ ignore_row_on_dupkey_index ( Recipe ( linkRecipe ) ) */
INTO  Recipe (idRecipe, nameDessert, linkRecipe, rating_Recipe)
SELECT  seq_Recipe.NEXTVAL,
  (SELECT nameDessert
  FROM Dessert
  WHERE Dessert.nameDessert=import_recipe.Name_D),
  link, rating
FROM import_recipe;

--IMPORTING into Dry_Ingredient Table
INSERT /*+ ignore_row_on_dupkey_index ( Dry_Ingredient ( nameDry_Ingredient ) ) */
INTO  Dry_Ingredient (idDry_Ingredient, nameDry_Ingredient)
SELECT  seq_Dry_Ingredient.NEXTVAL,Dry_Ing
FROM import_recipe
WHERE Dry_Ing IS NOT NULL;

--IMPORTING into Wet_Ingredient Table
INSERT /*+ ignore_row_on_dupkey_index ( Wet_Ingredient ( nameWet_Ingredient ) ) */
INTO  Wet_Ingredient (idWet_Ingredient, nameWet_Ingredient)
SELECT  seq_Wet_Ingredient.NEXTVAL, Wet_Ing
FROM import_recipe
WHERE Wet_Ing IS NOT NULL;

--IMPORTING into Dry_Quantity Table
INSERT INTO  Dry_Quantity (idDry_quantity, nameDessert, nameDry_Ingredient, quantity_Cup, quantity_Metric, quantity_Imperial)
SELECT  seq_Dry_Quantity.NEXTVAL,
  (SELECT nameDessert
  FROM Dessert
  WHERE Dessert.nameDessert=import_recipe.Name_D),
  (SELECT nameDry_Ingredient
  FROM Dry_Ingredient
  WHERE Dry_Ingredient.nameDry_Ingredient=import_recipe.Dry_Ing),
  DQ_Cup, DQ, DQ_Imp
FROM import_recipe
WHERE Dry_Ing IS NOT NULL;

--IMPORTING into Wet_Quantity Table
INSERT INTO  Wet_Quantity (idWet_quantity, nameDessert, nameWet_Ingredient, quantity_Cup, quantity_Metric, quantity_Imperial)
SELECT  seq_Wet_Quantity.NEXTVAL,
  (SELECT nameDessert
  FROM Dessert
  WHERE Dessert.nameDessert=import_recipe.Name_D),
  (SELECT nameWet_Ingredient
  FROM Wet_Ingredient
  WHERE Wet_Ingredient.nameWet_Ingredient=import_recipe.Wet_Ing),
  WQ_Cup, WQ, WQ_Imp
FROM import_recipe
WHERE Wet_Ing IS NOT NULL;

--IMPORTING into Dessert_Devices Table
INSERT INTO  Dessert_Devices (idDessert_Device, nameDessert, nameDevice)
SELECT  seq_Dessert_Devices.NEXTVAL,
  (SELECT nameDessert
  FROM Dessert
  WHERE Dessert.nameDessert=import_recipe.Name_D),
  (SELECT nameDevice
  FROM Device_Used
  WHERE Device_Used.nameDevice=import_recipe.device_used)
FROM import_recipe
WHERE device_used IS NOT NULL;

--DQL - DATA QUERY LANGUAGE
-- SELECT <columns>
-- FROM <tables>
-- WHERE <connection or conditions>
-- ORDER BY ...
-- GROUP BY ...
-- HAVING ...
SELECT * FROM Dry_Quantity;
SELECT * FROM Wet_Quantity;

--Order the table by recipe rating (Ascending)
SELECT rating_Recipe, linkRecipe, Recipe.nameDessert
FROM Recipe, Dessert
WHERE Recipe.nameDessert = Dessert.nameDessert
ORDER BY rating_Recipe;

--Group table by dry ing used in desserts
SELECT Dessert.nameDessert, Dry_Ingredient.nameDry_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
FROM Dessert, Dry_Ingredient, Dry_Quantity
WHERE Dessert.nameDessert = Dry_Quantity.nameDessert AND Dry_Ingredient.nameDry_Ingredient = Dry_Quantity.nameDry_Ingredient
GROUP BY Dessert.nameDessert, Dry_Ingredient.nameDry_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
ORDER BY Dessert.nameDessert;

--Group table by wet ing used in desserts
SELECT Dessert.nameDessert, Wet_Ingredient.nameWet_Ingredient, quantity_Metric,quantity_Imperial, quantity_Cup
FROM Dessert, Wet_Ingredient, Wet_Quantity
WHERE Dessert.nameDessert = Wet_Quantity.nameDessert AND Wet_Ingredient.nameWet_Ingredient = Wet_Quantity.nameWet_Ingredient
GROUP BY Dessert.nameDessert, Wet_Ingredient.nameWet_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
ORDER BY Dessert.nameDessert;

--Outputs desserts with sugar in it
SELECT Dessert.nameDessert, Dry_Ingredient.nameDry_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
FROM Dessert, Dry_Ingredient, Dry_Quantity
WHERE Dessert.nameDessert = Dry_Quantity.nameDessert
AND Dry_Ingredient.nameDry_Ingredient = Dry_Quantity.nameDry_Ingredient
AND (
    Dry_Ingredient.nameDry_Ingredient LIKE 'sugar'
);

--Outputs desserts with eggs in it
SELECT Dessert.nameDessert, Wet_Ingredient.nameWet_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
FROM Dessert, Wet_Ingredient, Wet_Quantity
WHERE Dessert.nameDessert = Wet_Quantity.nameDessert
AND Wet_Ingredient.nameWet_Ingredient = Wet_Quantity.nameWet_Ingredient
AND (
    Wet_Ingredient.nameWet_Ingredient LIKE 'eggs'
);
 --Only brownie details - but since len(dry ing ) != len(wet ing) , prints so many times
SELECT Dessert.nameDessert, Dry_Ingredient.nameDry_Ingredient, Dry_Quantity.quantity_Metric, Wet_Ingredient.nameWet_Ingredient,  Wet_Quantity.quantity_Metric, linkRecipe
FROM Dessert, Wet_Ingredient, Wet_Quantity, Dry_Quantity, Dry_Ingredient, Recipe
WHERE Dessert.nameDessert = Wet_Quantity.nameDessert
AND Dessert.nameDessert = Dry_Quantity.nameDessert
AND Wet_Ingredient.nameWet_Ingredient = Wet_Quantity.nameWet_Ingredient
AND Dry_Ingredient.nameDry_Ingredient = Dry_Quantity.nameDry_Ingredient
AND Recipe.nameDessert = Dessert.nameDessert
AND (
    Dessert.nameDessert LIKE 'Brownies'
);

--PROCEDURES (DML)
CREATE OR REPLACE PROCEDURE p_DeviceList(id NUMBER, devicename VARCHAR2)
IS
  result VARCHAR2(11);
BEGIN
  INSERT INTO Device_Used VALUES (seq_Device_Used.NEXTVAL, devicename);
END;
/
SHOW ERRORS;
EXECUTE p_DeviceList (1, 'piping bag')

--FUNCTIONS (DQL)
CREATE OR REPLACE FUNCTION f_RecipeLink(nameDessert VARCHAR2)
RETURN VARCHAR2
IS
  link VARCHAR2(200);
BEGIN
  SELECT linkRecipe INTO link FROM Recipe WHERE Recipe.nameDessert=f_RecipeLink.nameDessert;
  RETURN link;

END;
/
SHOW ERRORS;
SELECT f_RecipeLink('Pineapple upside down cake') FROM DUAL;
SELECT f_RecipeLink('Neapolitan Bundt Cake') FROM DUAL;
SELECT f_RecipeLink('Sparkling vanilla Christmas cookies') FROM DUAL;
SELECT f_RecipeLink('Christmas pudding cheesecake') FROM DUAL;

--TRIAL
--CREATE OR REPLACE FUNCTION f_recipe(nameDessert VARCHAR2)
--RETURN linkRating TABLE;
--(
--  recipeLink VARCHAR2(200) NOT NULL,
--  rating VARCHAR(20) NOT NULL
--)
--IS
--BEGIN
--  SELECT linkRecipe INTO recipeLink FROM Recipe WHERE Recipe.nameDessert=f_recipe.nameDessert;
--  SELECT rating_Recipe INTO rating FROM Recipe WHERE Recipe.nameDessert=f_recipe.nameDessert;
--  RETURN linkRating;

--END;
--/
--SHOW ERRORS;
--SELECT link, rating FROM f_recipe('Pineapple upside down cake');
