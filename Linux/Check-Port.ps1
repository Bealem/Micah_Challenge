function Check-Port {
$connection = New-Object System.Net.Sockets.TcpClient($args[0], $args[1])
if ($connection.Connected) {
    Write-Host "Port $args Success"
}
else {
    Write-Host "Port $args Failed"
}
}

