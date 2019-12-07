<?php
	// Detect the client IP
	$client_ip=$_SERVER['REMOTE_ADDR'];

	// If this query is coming from a private IP, we assume it's safe, and we show phpinfo()
	if (filter_var($client_ip, FILTER_VALIDATE_IP) && ! filter_var($client_ip,FILTER_FLAG_NO_PRIV_RANGE)) {
		phpinfo();
	}
?>
