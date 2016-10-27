# APKs feed

***This is a private method. If you want to use it contact us at [info@koodous.com](mailto:info@koodous.com)***

If you want to download all APKs from our repository as soon we add them you can use this method.

You can obtain a .zip file containing a list of URL samples from the lastest 5 minutes to 60. With an argument, you can choose the range you prefer. 


## Example simple request

`https://api.koodous.com/feed/apks(?package=)`

This request redirects you to the latest .zip

## Curl basic example

A basic APK list request.

```bash
curl -g -O -J -L -H "Authorization: Token YOURTOKEN" https://api.koodous.com/feed/apks
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
#   0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
# 100 14283  100 14283    0     0   7251      0  0:00:01  0:00:01 --:--:--  108k
# curl: Saved to filename 'apk_20160613T1040.zip'
```

## Curl example with params

You can download a specific package using `?package` param:

The package should have the next format: YYYYMMDDTHHMM. Example: 20160510T1025 (The latest number can be only 5 or 0).

Each package is available a week right after its creation. 

```bash
curl -g -O -J -L -H "Authorization: Token YOURTOKEN" https://api.koodous.com/feed/apks?package=20160610T1025
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
#   0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
# 100 27305  100 27305    0     0  13071      0  0:00:02  0:00:02 --:--:-- 66924
# curl: Saved to filename 'apk_20160610T1025.zip'
```

## Complete script with samples download
Save the code below to feed-apk.sh and run it with `sh feed-apk.sh YOURTOKEN`
```bash
curl -s -g -O -J -L -H "Authorization: Token $1" https://api.koodous.com/feed/apks
unzip -o apk*.zip
rm apk*.zip
mkdir downloads
while read p; do
	IFS=';' read -r -a array <<< "$p"
	echo "Downloading ${array[0]}"
	curl -s ${array[1]} > downloads/${array[0]}.apk
done < samples
rm samples
```

## Python Script

You can use our feed.py script. Check it out [here](https://github.com/Koodous/Scripts/blob/master/feed.py)

The usage is simple: modify the script and replace `TOKEN = "" ` with your API token and then:

```bash
python feed.py --apks 5
# Downloaded file apks/apk_20160613T1055.zip with samples download link
# Waiting for the next package
# Waiting 5 minutes

python feed.py --apks 60
# Downloaded file apks/apk_20160613T1055.zip with samples download link
# Waiting for the next package
# Waiting 60 minutes
```

## Output example

The previous scripts/commands returns a .zip with a file named ```samples``` inside:
```bash
$ curl -g -O -J -L -H "Authorization: Token YOURTOKEN" https://api.koodous.com/feed/apks
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
100  346k  100  346k    0     0   217k      0  0:00:01  0:00:01 --:--:-- 1581k
curl: Saved to filename 'apk_20160613T1055.zip'

$ unzip apk_20160613T1055.zip 
Archive:  apk_20160613T1055.zip
 extracting: samples                 

$ head samples
4ec241ca61f1fcdd1ebc594ea3fe58c2ee3ba16a6d9e4c6a607ad41a2fcb4cc3;https://storage.koodous.com/download_id
0b1fddf4e8a3b61545c08318230b0ae6f0e4dc4bbb0ca0f0505308e4e1b861b9;https://storage.koodous.com/download_id
62a8ffe8f6583f9003d7187f927fce638030f7836f56c471758beed19bba51e3;https://storage.koodous.com/download_id
346b99d75fafd71b7d9f9e1461b6c2e060539e5435ded2e59d55b94483963313;https://storage.koodous.com/download_id
3aebe69047c15be5101738f90cdd5eff7e3fd644a41110c4a8a489a34e87d273;https://storage.koodous.com/download_id
3359d33fdc2d064ad1d383b0aab35ca7d52372c026b941b0603200a024b11674;https://storage.koodous.com/download_id
6c0846c0081a214cda84456b4c163a994f9eb38d5983727817c2954b1e24b18f;https://storage.koodous.com/download_id
33e06081e1fae22b46c3a2d40f58361e43d44b18c05f0c1b46f212323f4489e1;https://storage.koodous.com/download_id
de9c173a5884f4bff30d080f3f2dc86a34b228377e443cc18e09e4f1e2f1aefc;https://storage.koodous.com/download_id
85a4b2b6768a476b46b880dcd0ed39b9e9d0fa02fd30e0d8783f81b318f7370b;https://storage.koodous.com/download_id
```

The ```samples``` file contains the sha256 of the sample and a direct download link per line. Using this link you can download the sample directly.
