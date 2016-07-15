$u = "stephen@foxdeploy.com"

$trellokey ='0abd62664b472dd2895a372dbce0fbeb'

$r = Show-OAuthWindow "https://trello.com/1/authorize?expiration=never&scope=read,write,account&response_type=token&name=Server%20Token&key=$trellokey"

$t = '1edd9a7b0d4ea3deb697d1e53abdf5420d0f1a225184d4860f23c0fc3cfb16cc'
$postParams = @{method='password';'factors[user]'=$u;'factors[password]'=$p}

$r = Invoke-RestMethod -Uri https://trello.com/1/authentication -Method POST -Body $postParams -SessionVariable cookie

$result = Invoke-WebRequest -uri https://trello.com/ -WebSession $cookie

$me = invoke-restmethod "https://api.trello.com/1/members/Me/boards?key=$trellokey&token=$t"

 "https://api.trello.com/1/members/Me?fields=username,fullName,url&boards=all&board_fields=name&organizations=all&organization_fields=displayName&key=$trellokey&token=$code"
