# Introduction

Sometimes we need to match applications with a certain hash. For that purpose we have created this module.

First of all, you need to import the module with the next directive at the header of the ruleset.

```
import "file"
```
# MD5
For matching with the application (or applications if there are collisions! ;)) with certain MD5 hash:

```
file.md5(string)
```

```
rule my_apk: koodous
{
	condition:
		file.md5("d367fd26b52353c2cce72af2435bd0d5")
}
```

# SHA1
For matching with the application with this SHA1 hash:

```
file.sha1(string)
```

```
rule my_apk: koodous
{
	condition:
		file.sha1("2031eab6020aab492d31d7b4af3e1758ea1a3e00")
}
```

# SHA256
To match with the application with a certain SHA256 hash. This is the recommended hash if you want to find or create a whitelist. In the moment of writing these docs, sha256 is still "alive". :)

```
file.sha256(string)
```

```
rule my_apk: koodous
{
	condition:
		file.sha256("3350990c4d298cdb4dc94ba886a27147e501bbf8fd504d824be53cad5cb02142")
}
```
