# Analysis feed

***This is a private method. If you want to use it contact us at [info@koodous.com](mailto:info@koodous.com)***

If you want to download all APKs analysis reports from our repository as soon we add them you can use this method.

You can obtain a .zip file containing a JSON full of reports from the lastest 5 minutes to 60. With an argument, you can select the preferred range. 

## Simple request example

`https://api.koodous.com/feed/analyses(?package=)`

This request redirects you to the latest .zip

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

Each package is available a week right after its creation. 

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

The usage is simple: modify the script and replace `TOKEN = "" ` with your API token and then:

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


## Output example
The previous scripts/commands returns a .zip file with the next structure:
```bash
$ curl -g -O -J -L -H "Authorization: Token YOUTOKEN" https://api.koodous.com/feed/analyses
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 3616k  100 3616k    0     0  2374k      0  0:00:01  0:00:01 --:--:-- 2374k
curl: Saved to filename 'analysis_20160610T1025.zip'

$ unzip analysis_20160610T1025.zip 
Archive:  analysis_20160610T1025.zip
 extracting: 8ec8bf98cfc5269ce8ad56c4465d680a7f68b14e39a58fdad2f2be26af3e44f8.json  
 extracting: b3e8856b74ec70c40bd44706ff8dc8e9119d8c2e57cd051dbce7f90de304399f.json  
 extracting: fd60be21459b73eb6db9d16bc15e5e632e5f6e5f874cb472617b38a62ddb0fcf.json  
 extracting: 64b47a53214d8bee3c7abcbfe1dc4324e271ef570a9f8524bf3aa22ae35ff435.json  
 extracting: 5c66e5705448fadaf2a1fe3e3df326bcf43bdeedbdcdc78e49ec3d46737c8e18.json  
 extracting: a45548b940cfb92c0932fc272f638917880e82a4de1e883176fe08f6ebeb678d.json  
 extracting: 5a098e7ab33e503ed495c0df3e279e3468271817dea1f0576ea9b5410cca4186.json  
 extracting: 41d931b8c7baf50a6ddf85cb89137640a567c2168e4aecc6c32d24a6fd3fc7bc.json  
 extracting: bdd5014ecd21be5a8049b873954ec65ce10e8ba0513a28d8ac6a55d1a37d28f3.json
 [... MORE ...]

```

The unzip command will generate as many ```json``` files as analysis were made in that period of time. The analysis' JSON format follows the same structure as the one you can obtain from the "Analysis report" tab on each sample. 