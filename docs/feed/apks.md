# APKs feed

***This is a private method. In order to use this method you must authenticate with token that has feed privileges.
For more information you can contact us at [info@koodous.com](mailto:info@koodous.com)***

If you want to download all APKs from our repository as soon we add them you can use this method.

You can obtain a package *.zip* containing a list of URL samples.

## How the feed works

The packages are created every five minutes with the received apks in that period of time. A package is also created
with all the apks received in the period of one hour. You can choose between them.

The last twelve packages created every five minutes are equivalent to the last package created every hour.

The packages are only available for a week after its creation. For example, a package that was created on 20/05/2021
will be available until 27/05/2021.

## Get the apks feed

> This is methods needs authentication with feed privileges.

`GET https://api.koodous.com/feed/apks`

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

## Script to download the apks feed

```python
import requests

url = 'https://api.koodous.com/feed/apks'
package = '20210521T1215'
params = {'package': package}
headers = {'Authorization': 'Token <YOUR_TOKEN>'}
# Do the request and get the package.
r = requests.get(url, params=params, headers=headers)
# Check that the package is available and store it.
if r.status_code == 200:
    filename = 'apk_' + package + '.zip'
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
curl -g -O -J -L -H "Authorization: Token YOUR_TOKEN" https://api.koodous.com/feed/apks
```

## Output example

The previous scripts/commands returns a .zip with a file named ```samples``` inside:

```bash
$ unzip apk_20210521T5.zip 
Archive:  apk_20210521T5.zip
 extracting: samples                 

$ head samples
sha256_apk1;https://storage.koodous.com/download_id_apk1
sha256_apk2;https://storage.koodous.com/download_id_apk2
sha256_apk3;https://storage.koodous.com/download_id_apk3
[... MORE ...]
```

The ``samples`` file contains the sha256 of the sample, and a direct download link per line.
Using this link you can download the sample directly.
