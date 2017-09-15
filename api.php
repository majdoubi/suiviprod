<?php
if (isset($_POST['submit']))
   {
//Données de login a la base 
$servername = "localhost";
$username = "root";
$password = "root";
$dbName = "SuiviProd";
$conn = new mysqli($servername, $username, $password, $dbName);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// les données récuprere de l'api au clique du submit 
$date1 = $_POST['datepicker1'];
$date2 = $_POST['datepicker2'];
$datefix = $_POST['datefixe'];
$time1 = strtotime($date1);
$newformat1 = date('Y-m-d',$time1);
$time2 = strtotime($date2);
$newformat2 = date('Y-m-d',$time2);

//Exec des requtes selon les periode 
if ($datefix=="Personalize"){
$query = "SELECT nom_de_piece,nb_de_pieces FROM TabSuiviProd WHERE date_enregistrement BETWEEN '$newformat1' AND '$newformat2'";
$result = $conn->query($query);
}
elseif ($datefix=="Today"){
$queryToday = "SELECT nom_de_piece,nb_de_pieces FROM TabSuiviProd WHERE DATE(date_enregistrement)=CURDATE()";
$result = $conn->query($queryToday);

}
elseif ($datefix=="This week"){
$day = date('w');
$week_start = date('Y-m-d', strtotime('-'.$day.' days'));
$week_end = date('Y-m-d', strtotime('+'.(6-$day).' days'));

$queryThisweek = "SELECT nom_de_piece,nb_de_pieces FROM TabSuiviProd WHERE date_enregistrement BETWEEN '$week_start' AND '$week_end' ";
$result = $conn->query($queryThisweek);

}


elseif ($datefix=="This month"){
$queryThismonth = "SELECT nom_de_piece,nb_de_pieces,date_enregistrement FROM TabSuiviProd WHERE YEAR(date_enregistrement) = YEAR(CURRENT_DATE()) AND 
MONTH(date_enregistrement) = MONTH(CURRENT_DATE())";
$result = $conn->query($queryThismonth);

}

else{
$queryThisyear = "SELECT nom_de_piece,nb_de_pieces FROM TabSuiviProd";
$result = $conn->query($queryThisyear);
}







$jsonArray = array();

if ($result->num_rows > 0) {

  while($row = $result->fetch_assoc()) {
    $jsonArrayItem = array();
    $jsonArrayItem['label'] = $row['nom_de_piece'];
    $jsonArrayItem['value'] = $row['nb_de_pieces'];
    array_push($jsonArray, $jsonArrayItem);
  }
}

$conn->close();
$rowjson= json_encode($jsonArray);
	//nom du fichier a cree 
	$graphe='nom_de_pieceandnom_de_pieces.json'; 

	//ouvrire le fichier 
	$fichier=fopen($graphe,'w+');

	//ecriture du fichier
	fwrite($fichier,$rowjson);

	///fermer le
	fclose($fichier);
}
//header('Content-type: application/json'); 
echo json_encode($jsonArray);
$host = $_SERVER['HTTP_HOST'];
$uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
$extra = 'vu.html';
header("Location: http://$host$uri/$extra");
exit;

?>
