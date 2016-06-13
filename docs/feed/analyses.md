# Analyses feed

***This is a private method If you want to use it contact us at [info@koodous.com](mailto:info@koodous.com)***

If you want to download all apks analysis reports from our repository as soon we add them you can use this method.

You can either get a latest 5 or 60 minutes zip file full of json reports. With an argument you can select the range you prefer.

## Example simple request

`https://api.koodous.com/feed/analyses(?package=)`

The request redirects you to the latest .zip

## Curl basic example

A basic analysis feed request.

```bash
curl -g -O -J -L -H "Authorization: Token YOURTOKEN" https://api.koodous.com/feed/analyses
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
#   0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
# 100 14283  100 14283    0     0   7251      0  0:00:01  0:00:01 --:--:--  108k
# curl: Saved to filename 'apk_20160613T1040.zip'
```

## Curl example with params

You can download a specific package using `?package` param:

The package should have the next format: YYYYMMDDTHHMM. Example: 20160510T1025 (The latest number can be only 5 or 0).

The availability of each package is a week right after its creation.

```bash
curl -g -O -J -L -H "Authorization: Token YOURTOKEN" https://api.koodous.com/feed/analyses?package=20160610T1025
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
#   0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
# 100 27305  100 27305    0     0  13071      0  0:00:02  0:00:02 --:--:-- 66924
# curl: Saved to filename 'analysis_20160610T1025.zip'
```

## Python Script

You can use our feed.py script. Check it out [here](https://github.com/Koodous/Scripts/blob/master/feed.py)

The usage is simple: modify the script and replace `TOKEN = "" ` with your api token and then:

```bash
python feed.py --analysis 5
# Downloaded analysis in analysis/analysis_20160613T1055.zip
# Waiting for the next package
# Waiting 5 minutes

python feed.py --analysis 60
# Downloaded analysis in analysis/analysis_20160613T1055.zip
# Waiting for the next package
# Waiting 60 minutes
```