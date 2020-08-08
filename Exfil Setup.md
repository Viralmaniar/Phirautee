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

Step 10: Authorize the https://www.googleapis.com/auth/drive API and then Click “Exchange authorization code for tokens”. This should give you 200 OK in the response. Make sure you save your refresh access token. We will need this in the Phirautee to upload large files to the throwaway Google account
![image](https://user-images.githubusercontent.com/3501170/89717034-d7441680-d9f5-11ea-84e7-dfbb87bceda6.png)

![image](https://user-images.githubusercontent.com/3501170/89717044-f478e500-d9f5-11ea-804a-87d00471e686.png)


