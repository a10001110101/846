[System.Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$username = "email@emailaddress.nope"
$password = ConvertTo-SecureString "not-a-password-here" -AsPlainText -Force
$mycredentials = New-Object System.Management.Automation.PSCredential ($username, $password)
$toaddress = "email2@emailaddress.nope"
$carbon = "email3@emailaddress.nope", "email4@emailaddress.nope"
$fromaddress = 'email@emailaddress.nope'
$Attach = "E:\Scripts\XLSXFormat\846Complete.xlsx"
$smtpserver = 'smtp.office365.com'
$smtpport = '587'

$mailparam = @{
    To = $toaddress
    Cc = $carbon
    From = $fromaddress
    Subject = '3PL Inventory Report - v2.0.2'
    Body = "Please see attached for today's 3PL inventory report.`r`n`n2.0.2 - corrected multiplication bug with 3PL inventory quantities. (ERP/846/Issues/Issue1.txt)"
    Attachments = $Attach
    SmtpServer = $smtpserver
    Credential = $mycredentials
    Port = $smtpport
}

Send-MailMessage @mailparam -UseSsl