# Phirautee
A proof of concept crypto virus to spread user awareness about attacks and implications of ransomwares. Phirautee is written purely using PowerShell and does not require any third-party libraries. This tool steals the information, holds an organisation’s data to hostage for payments or permanently encrypts/deletes the organisation data. 

Phirautee is a Living off the Land (LotL) ransomware which means it utilises legit powershell commands and operations to work against the operating system. 

![image](https://user-images.githubusercontent.com/3501170/79039950-3c465600-7c28-11ea-9390-df6594573abb.png)

# Screenshots

- Ransom pop-up window: <br>

![image](https://user-images.githubusercontent.com/3501170/89846875-bf22f180-dbc5-11ea-9ed0-7c557022a42c.png)

- Desktop background upon successful infection:<br>

![image](https://user-images.githubusercontent.com/3501170/89847011-2345b580-dbc6-11ea-9738-bf3651de6f11.png)

# DEF CON Presentation

https://speakerdeck.com/viralmaniar/phirautee-defcon28-writing-ransomware-using-living-off-the-land-lotl-tactics <br>

![image](https://user-images.githubusercontent.com/3501170/89847278-eded9780-dbc6-11ea-8a6b-0761de644917.png)

# Legal Disclaimer
This project must not be used for illegal purposes or for hacking into system where you do not have permission, it is strictly for educational purposes and for people to experiment with.
<B><I>
 - Performing any hack attempts or tests without written permission from the owner of the computer system is illegal.
 - If you recently suffered a breach or targeted by a ransomware and found techniques or tools illustrated in this presentation similar, this neither incriminates my involvement in any way, nor implies any connection between myself and the attackers.
- The tools and techniques remain universal and penetration testers and security consultants often uses them during engagements. 
- Phirautee project must not be used for illegal purposes. It is strictly for educational and research purposes and for people to experiment with.
</I></B>

# DEF CON 28 Safe Mode

Over the past few years, ransomware has gone wild and organisations around the world are getting targeted leading to the damage and disruption. As we all know that the threat landscape is changing rapidly and we hear the fuss about ransomware infection at the offices or read about it in the news. Have you ever wondered how threat actors are writing ransomwares? What level of sophistication and understanding is required to target an organisation? In this demo, we will utilise the native Windows commands to build ransomware and target a host via phishing. Introducing Phirautee, a proof of concept crypto virus to spread user awareness about attacks and implications of ransomwares. Phirautee is written purely using PowerShell and does not require any third-party libraries. This tool steals the information, holds an organisation's data to hostage for payments or permanently encrypts/deletes the organisation data. The tool uses public-key cryptography to encrypt the data on the disk. Before encrypting, it exfiltrates the files from the network to the attacker. Once the files are encrypted and exfiltrated, the original files are permanently deleted from the host and then tool demands a ransom. The ransom is asked using the cryptocurrency for payments, so transactions are more difficult for law enforcement to trace. During the demonstration of Phirautee, you will see a complete attack chain i.e. from receiving ransomware attack via a phishing email and how the files get encrypted on the compromised systems. A detailed walkthrough of the source code would be provided to understand how hackers utilise simple methods to create something dangerous. I will end the demo with several defence mechanisms by performing forensics analysis on Phirautee using publicly available tools.

# Phirautee Introduction

- Phirautee is a proof of concept ransomware tool written purely using PowerShell. 

- It uses Living off the Land (LotL) commands to work against the operating system to encrypt files on the machine.

- This tool can be used during internal infrastructure penetration testing or during the red team exercise to validate Blue Team/SOC response to ransom attacks. 

- It uses public key cryptography to encrypt user content and exfiltrates large files via Google Drive.

- Upon successful attack the ransomware asks for a payment of 0.10 BTC (~1k USD). 

- Detection: 
  - File extension of the encrypted files are changed to “.phirautee”
  - Desktop wallpaper of the compromised host is changed with Phirautee background
  - Desktop will have Phirautee.txt file 

# Phirautee Attack Setup

- Phishing server and domain to target an organisation.

- Email server to send malicious documents as an attachment to the targeted user.

- Macro embedded file as an attachment to user which pulls the ransomware from the remote server to targeted machine and runs it in a memory.

- Modify couple of parameters in the ransomware file to utilise it for your use case.

- For data exfiltration:
  - Throwaway Gmail account
  - Gmail API access to a throwaway Google Drive
  - Setup web application on the Google 

# Steps for setting up Data Exfilteration using Google Drive

Google offers a REST API that can be accessed via PowerShell to perform operations on the files such as upload, download and delete. The REST API allows you to leverage Google Drive storage from within your app.

![image](https://user-images.githubusercontent.com/3501170/89538185-986b6080-d83d-11ea-870d-fbc0df6b6f24.png)

Please follow below steps to perform exfilteration via phirautee ransomware.

Step 1: Visit https://console.cloud.google.com/cloud-resource-manager

Step 2: Click on "CREATE PROJECT"

![image](https://user-images.githubusercontent.com/3501170/89416241-4b6d8880-d770-11ea-91a2-cd3c621b1286.png)

Step 3: Once the project is created enable the Google Drive API by click on the "ENABLE APIS AND SERVICES".

![image](https://user-images.githubusercontent.com/3501170/89416365-81ab0800-d770-11ea-83aa-89ce6aff2de1.png)

Step 4: Locate the Google Drive related APIs in the AOI Library:

![image](https://user-images.githubusercontent.com/3501170/89417187-b075ae00-d771-11ea-9fb0-b501ec39364c.png)

Step 5: Once located enable the API. This would allow access to various operations via Google Drive.

![image](https://user-images.githubusercontent.com/3501170/89716879-15403b00-d9f4-11ea-8d9a-76f1db90746c.png)

Step 6: After enabling the API access click on the "create credentials" button.

![image](https://user-images.githubusercontent.com/3501170/89716900-4caee780-d9f4-11ea-9f09-6d1e6cbe0083.png)

Step 6: Now create OAuth Client ID Credentials

![image](https://user-images.githubusercontent.com/3501170/89716918-7e27b300-d9f4-11ea-816d-71b2b9d8a97d.png)

Step 7: Select Web Application as product type and configure the authorized redirect URI to https://developers.google.com/oauthplayground
![image](https://user-images.githubusercontent.com/3501170/89716949-b7602300-d9f4-11ea-9958-d3341917d1d4.png)

Step 8: Save your client ID and Secret. If you dont this can always be accessed from credentials in APIs & Services. Now browse to https://developers.google.com/oauthplayground

Step 9: Click on the gear icon and tick on the "Use your own OAuth credentials"
![image](https://user-images.githubusercontent.com/3501170/89716974-1c1b7d80-d9f5-11ea-84ad-85d5d567ebb1.png)

Step 10: Authorize the https://www.googleapis.com/auth/drive API and then Click “Exchange authorization code for tokens”. This should give you 200 OK in the response. Make sure you save your refresh access token. We will need this in the Phirautee to upload large files to the throwaway Google account. <br>

![image](https://user-images.githubusercontent.com/3501170/89717034-d7441680-d9f5-11ea-84e7-dfbb87bceda6.png)

![image](https://user-images.githubusercontent.com/3501170/89717044-f478e500-d9f5-11ea-804a-87d00471e686.png)

# Use of Symmetric Keys & Anonymous SMTP Service

- Phirautee uses two unique symmetric keys
  - One for the private key of the certificate that’s being generated on the user machine.
  - The other one for uploading exfiltrated data on Google Drive

- The private keys are sent to Pokemail as a zip encrypted files.

- Phirautee uses Pokemail services to distribute the attack infrastructure by creating a random location based email address.

![image](https://user-images.githubusercontent.com/3501170/89846710-53d91f80-dbc5-11ea-88db-1d6b3f0b879f.png)

![image](https://user-images.githubusercontent.com/3501170/89846743-723f1b00-dbc5-11ea-974f-971e6b0df693.png)

- Uses 2048 bits RSA key to encrypt files on the infected machine.

- Private key of the certificate gets sent to attacker using a pre-shared secret aka symmetric keys.

# IoCs for Phirautee

```
File paths:
C:\temp\cert.cer
c:\temp\sys.txt
c:\temp\backup.zip
c:\temp\sys1.txt
c:\temp\steal.zip
C:\users\$env:USERNAME\PhirauteeBackground-3.jpg

MD5s:
77EA9D33D144072F7B35C10691124D16
4E123FF3A7833F0C8AC6F749D337444D

Domains used for exfil:
https://smtp.pokemail.net
https://www.googleapis.com
https://accounts.google.com
https://raw.githubusercontent.com 

Registry files:
HKCU:\Control Panel\Desktop
````

# Mitigation Strategies
- Network segmentation and detection of lateral movement. Follow principle of least privilege access or restrict access to sensitive servers. Make use of MFA on all important portals.

- Disable PowerShell for standard domain users and perform application whitelisting.

- Frequent network wide backups (if possible offline).

- Apply patches and have a vulnerability management program.

- Have a dedicated incident response team and develop a plan for ransomware events.

- Invest in a good IDS/IPS/EDR/AV/CASB product.

- Validate the effectiveness of your defense tools and technologies through pre-approved offensive exercise.

- Organise phishing and user education training sessions for your employees.

- Have cyber insurance to help cover costs in case you need to pay the ransom. Furthermore, get your insurance policies reviewed to make sure there are no holes.

- Take help from local feds for the decryption keys.

# Contribution & License

MIT License

Copyright (c) 2020 Viral Maniar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Any suggestions or ideas for this tool are welcome - just tweet me on [@ManiarViral](https://twitter.com/maniarviral)
