# cac-cli.sh
Simple CLI client for CloudAtCost

# Preparation

## Dependencies
Please install following commands in advance.
* `curl` (Compatibility of `curl 7.43.0` was checked).
* `jq` (Compatibility of `jq-1.4` was checked).
* `column`

## Install
1. Fillin your API key and Login address in `cac-cli.conf`

```
$ git clone https://github.com/greymd/cac-cli-sh.git
$ cd cac-cli-sh
$ vi cac-cli.conf
```

```sh:cac-cli.conf
# Fillin your own API key and Login Address
CAC_API_KEY='ABCDEFG123456789'
CAC_LOGIN_ADDR='example@example.com'
```

2. Edit your `.bashrc` or `.zshrc` to import `cac-cli.conf`

```
$ echo ". ~/reps/cac-cli-sh/cac-cli.sh" >> ~/.zshrc
$ source ~/.zshrc
```

# Usage
## CAC APIs
### `$ cac-listservers`
```
$ cac-listservers
{
  "status": "ok",
  "time": 1469357503,
  "api": "v1",
  "action": "listservers",
  "data": [
    {
      "sid": "123456789",
      ...
    },
    ...
  ]
}
```

### `$ cac-listtemplates`

```
$ cac-listtemplates
```

### `$ cac-listtasks`

```
$ cac-listtasks
```

### `$ cac-resources`

```
$ cac-resources
```

### `$ cac-powerop`

```
$ cac-powerop <ACTION> <SID>
```

### `$ cac-renameserver`

```
$ cac-renameserver <NAME> <SID>
```

### `$ cac-rdns`

```
$ cac-rdns <HOSTNAME> <SID>
```

### `$ cac-console`

```
$ cac-console <SID>
```

### `$ cac-runmode`

```
$ cac-runmode <MODE> <SID>
```

### `$ cac-build`

```
$ cac-build <CPU> <RAM> <STORAGE> <OS>
```

### `$ cac-delete`

```
$ cac-delete <SID>
```

## CAC original aliases
### `$ cac-ls`

```
$ cac-ls
```

### `$ cac-bld`

```
$ cac-bld <NUMBER>
```


# License

The scripts is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
