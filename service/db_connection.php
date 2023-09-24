<?php
function OpenCon()
{
  $dbhost = "localhost";
  $dbname = "homework";
  $dbuser = "root";
  $dbpass = "admin";
  $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die("Connect failed: %s\n" . $conn->error);
  return $conn;
}
function CloseCon($conn)
{
  $conn->close();
}
