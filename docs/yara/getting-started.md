# Getting started

The Yara tool aimed to help detection of any kind of malware, but in this case, Android Malware Applications. With Yara rules you can create a "description" of malware families to detect new samples.

Our implementation of Yara is based in the original one, but with some extra modules in order to increase the usability of the ruleset with the knowledge extracted with the dynamic and the static analysis of each sample.

## Basic steps

To start to write Yara rules, you can use the official documentation [http://yara.readthedocs.org/en/v3.3.0/](http://yara.readthedocs.org/en/v3.3.0/) where the author explains [how to write yara rules](http://yara.readthedocs.org/en/v3.3.0/writingrules.html).

## Yara works over...

We want to inform you how we are scanning the files with Yara in order to improve the detection of new malware samples.

First, we extract the information about dynamic and static analysis and used them together with the APK file to try to match.
Then, we decompress the APK and run Yara over these files. 

If you have any suggestion about the analysis or the Yara scan, you can write us to [analysis@koodous.com](mailto:analysis@koodous.com)