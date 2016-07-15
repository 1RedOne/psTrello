   #region mini window, made by (Insert credits here)
    Function Show-OAuthWindow {
    param($url)
    Add-Type -AssemblyName System.Windows.Forms
 
    $form = New-Object -TypeName System.Windows.Forms.Form -Property @{Width=440;Height=640}
    $web  = New-Object -TypeName System.Windows.Forms.WebBrowser -Property @{Width=420;Height=600;Url=($url -f ($Scope -join "%20")) }
    $DocComp  = {
            $Global:uri = $web.Url.AbsoluteUri
            if ($Global:Uri -match "error=[^&]*|code=[^&]*") {$form.Close() }
    }
    $web.ScriptErrorsSuppressed = $true
    $web.Add_DocumentCompleted($DocComp)
    $form.Controls.Add($web)
    $form.Add_Shown({$form.Activate()})
    $form.ShowDialog() | Out-Null

    $code = $web.DocumentText.Split("`n")[9].Trim()
    $global:code = $code 
    
    if ($code.Length -eq 64){
        $global:code = $code 
        Write-host "we retrieved a code, check within `$code for the value"
        }else
        {
        Write-Warning "The code we got back wasn't 32 chars in length, double check and try again"
        }
    #endregion

    #login to get an access code 
}