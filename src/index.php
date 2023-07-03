<?php

try {

    $date = date("c");
    echo $date . PHP_EOL;

    // $fp = fopen("/var/log/service.log", "a");
    // fwrite($fp, json_encode(['time' => date("c"), 'post' => $_POST, 'get' => $_GET], true) . "\n");
    // fclose($fp);

    if (!empty($_GET['error'])) {
        throw new \Exception("Error foobar: " . $_GET['error']);
    }

    if (!empty($_GET['phpinfo'])) {
        phpinfo();
    }

} catch (\Exception $e) {
    $fp = fopen("/var/log/foo.log", "a");
    fwrite($fp, date("c") . " - " . $e->getMessage() . "\n");
    fclose($fp);
}
