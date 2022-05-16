<?php
header('Content-Type: application/json');
$array = array();

$array['Name'] = 'Alex';
$array['Age'] = 37;
$array['Admin'] = TRUE;

$array['Contact'] = array
(
  'Site' => "alexwebdevelop.com",
  'Phone' => 123456789,
  'Address' => NULL
);

$array['Tags'] = array('php', 'web', 'dev');

$json = json_encode($array);

echo $json;
?>