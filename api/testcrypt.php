<?php

// Set the password
$password = 'testdsdasdsadas';
$salt = 'rahasia';

// Get the hash, letting the salt be automatically generated; not recommended
$hash = crypt($password, $salt);

//echo strlen($hash);
echo $hash;
