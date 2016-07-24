# cac-cli-sh
Simple CLI client for [CloudAtCost](http://www.cloudatcost.com/)

# Preparation

## Dependencies
Please install following commands in advance.
* `curl` (Compatibility of `curl 7.43.0` was checked).
* `jq` (Compatibility of `jq-1.4` was checked).
* `column`

## Install
* Fillin your API key and Login address in `cac-cli.conf`

```sh
$ git clone https://github.com/greymd/cac-cli-sh.git
$ cd cac-cli-sh
$ vi cac-cli.conf
```

```sh
# cac-cli.conf
# Fillin your own API key and Login Address
CAC_API_KEY='ABCDEFG123456789'
CAC_LOGIN_ADDR='example@example.com'
```

* Edit your `.bashrc` or `.zshrc` to import `cac-cli.conf`

```sh
$ echo ". ~/reps/cac-cli-sh/cac-cli.sh" >> ~/.zshrc
$ source ~/.zshrc
```

# Usage
## CAC APIs
### `$ cac-listservers`
```sh
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

```sh
$ cac-listtemplates
```

### `$ cac-listtasks`

```sh
$ cac-listtasks
```

### `$ cac-resources`

```sh
$ cac-resources
```

### `$ cac-powerop`

```sh
$ cac-powerop <ACTION> <SID>
```

### `$ cac-renameserver`

```sh
$ cac-renameserver <NAME> <SID>
```

### `$ cac-rdns`

```sh
$ cac-rdns <HOSTNAME> <SID>
```

### `$ cac-console`

```sh
$ cac-console <SID>
```

### `$ cac-runmode`

```sh
$ cac-runmode <MODE> <SID>
```

### `$ cac-build`

```sh
$ cac-build <CPU> <RAM> <STORAGE> <OS>
```

### `$ cac-delete`

```sh
$ cac-delete <SID>
```

## CAC original aliases
### `$ cac-ls`

```sh
$ cac-ls
```

### `$ cac-bld`

```sh
$ cac-bld <NUMBER>
```


# License

The scripts is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

