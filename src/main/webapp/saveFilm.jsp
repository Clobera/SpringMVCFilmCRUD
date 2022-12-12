<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML>

<html>
<head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>saveFilm</title>
<head>
<body>
	<form action="saveFilm.do" method="POST">
		
		<label for="Id">Film"</label>
		<input type ="text" name = "id"/>
		
		
		<label for="title"> Title: </label> 
		<input type="text" name="title">

		<br> 
		<label for="languageId"> Language ID: </label> 
		
		<input type="text" name="languageId" value="2"> 
			
		<br> 
		<label for ="description">Description</label>
		<input type="text" name="description">
		
		<br>
		<label for ="releaseYear">Release Year</label>
		<input type="text" name="releaseYear">
		<br>
		<label for ="rentalDuration">Rental Duration</label>
		<input type="text" name="rentalDuration">
		<br>
		<label for="length">Length</label>	
		<input type="text" name="length">
		<br>
		<label for="replacementCost">Replacement Cost</label>
		<input type="text" name="replacementCost">
		<br>
		<label for="rating">Rating</label>
		<select name="rating">
		<option value ="G">G</option>
		<option value ="PG">PG</option>
		<option value ="PG13">PG13</option>
		<option value ="R">R</option>
		<option value="NC17">NC17</option>
		
	
		</select>
		<label for="specialFeatures">Special Features</label>
		<input type="text" name=specialFeatures>
		
			<input type="submit" value="saveFilm">
	</form>





</body>


</html>
