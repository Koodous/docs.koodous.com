# Analyses feed

***This is a private method. In order to use this method you must authenticate with token that has feed privileges.
For more information you can contact us at [info@koodous.com](mailto:info@koodous.com)***

If you want to download all analysis of the detected samples from our repository as soon we add them you can use this
method.

You can obtain a .zip file containing a JSON full of reports from the latest 5 minutes to 60. With an argument, you can
select the preferred range. 

## How the feed works

The packages are created every five minutes with the generated analysis reports in that period of time.
A package is also created with all the analysis reports of the detected samples in the period of one hour. You can
choose between them.

The last twelve packages created every five minutes are equivalent to the last package created every hour.

The packages are only available for a week after its creation. For example, a package that was created on 20/05/2021
will be available until 27/05/2021.

## Get the detected samples feed

> This is methods needs authentication with feed privileges.

`GET https://api.koodous.com/feed/detected`

By default, without the ``package`` parameter the package served on request is from the last 5 minutes.

### Query string parameters

| Attribute |  Type  | Required |                                  Description                                  |
|:---------:|:------:|:--------:|:-----------------------------------------------------------------------------:|
| package   | string | no       | Specify the package.<br>Read the package format section for more information. |

### Package parameter format

The package must follow the format **%Y%m%dT%H%M** for packages created every 5 minutes or **%Y%m%dT%H** for packages 
created every hour.

| Directive | Meaning                                               | Example         |
|-----------|-------------------------------------------------------|-----------------|
| %Y        | Year with century as a decimal number.                | 2013, 2019 etc. |
| %m        | Month as a zero-padded decimal number.                | 01, 02, ..., 12 |
| %d        | Day of the month as a zero-padded decimal.            | 01, 02, ..., 31 |
| %H        | Hour (24-hour clock) as a zero-padded decimal number. | 00, 01, ..., 23 |
| %M        | Minute as a zero-padded decimal number.               | 00, 01, ..., 59 |

Examples of package format: ``20210521T5``, ``20210521T1015``

The packages are generated starting at 00:00, so the packages created every five minutes always ends with 0 or 5.
A package like ``20210521T1013`` is not valid.

In Python, you can generate the package string easily with the library datetime:

```python
import datetime

datetime.datetime(
    year=2021,
    month=5,
    day=21,
    hour=12,
    minute=15
).strftime('%Y%m%dT%H%M')  # Or '%Y%m%dT%H' if you want the entire package of the last hour.
```

```
'20210521T1215'
```

## Script to download the analyses feed

```python
import requests

url = 'https://api.koodous.com/feed/detected'
package = '20210521T1215'
params = {'package': package}
headers = {'Authorization': 'Token <YOUR_TOKEN>'}
# Do the request and get the package.
r = requests.get(url, params=params, headers=headers)
# Check that the package is available and store it.
if r.status_code == 200:
    filename = 'detected_' + package + '.zip'
    with open(filename, 'wb') as f:
        f.write(r.content)
elif r.status_code == 404:
    raise Exception('The package is not available.')
elif r.status_code == 401:
    raise Exception('The token is invalid or doesn\'t have privileges.')
else:
    raise Exception(f'Other error occurred. Response code: {r.status_code}')
```

You can also obtain the original filename:

```python
filename = r.headers['Content-Disposition'].split('; ')[1].split('=')[1][1:-1]
```

## Curl command to download the feed

Downloading the package from the last 5 minutes.

```bash
curl -g -O -J -L -H "Authorization: Token YOUR_TOKEN" https://api.koodous.com/feed/detected
``` 

## Output example

The previous scripts/commands returns a .zip file with the next structure:

```bash
$ unzip detected_20210521T1215.zip 
Archive:  detected_20170411T1020.zip
 extracting: 8ec8bf98cfc5269ce8ad56c4465d680a7f68b14e39a58fdad2f2be26af3e44f8.json  
 extracting: b3e8856b74ec70c40bd44706ff8dc8e9119d8c2e57cd051dbce7f90de304399f.json  
 extracting: fd60be21459b73eb6db9d16bc15e5e632e5f6e5f874cb472617b38a62ddb0fcf.json  
 extracting: 64b47a53214d8bee3c7abcbfe1dc4324e271ef570a9f8524bf3aa22ae35ff435.json  
 [... MORE ...]
```

The unzip command will generate as many ```json``` files as analysis were made in that period of time.

The analysis' JSON format follows the same structure as the one you can obtain from the "Analysis report" tab on each 
sample. 
