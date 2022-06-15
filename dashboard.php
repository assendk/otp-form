

<?php

session_start();

if (isset($_SESSION['IS_LOGIN'])) {
    echo "Hello" . "  ". "<b>" . ucwords($_SESSION['EMAIL']). "</b>";
}else{
    header("Location:login.php");
    die();
}

?>
<br><br>
<p><a href="logout.php">Logout</a></p>

