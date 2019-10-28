# GOO

![logo](http://172.104.108.121:20080/s/d83nfRN7xKhuN2k/download)

This is a part of construct tool (like npm script field).
Run shell cmd and sh script any where in your project.

## installation

install `jq` by `apt`, `yum`, `brew` or something else.

```
git clone https://github.com/liu946/goo.git
cd goo
(sudo) ./install.sh
```

## update

```
# The updating function is added to the system script of goo.
goo update
```

## usage

### init project

```
mkdir project
cd project
goo init # enter the name of this project (default is dir name)
goo
```

### add command
`in goo.json`

```
{
  "command": {
    "test": "echo no testing script",
    "print": "echo 'add your own bash code with json format.'",
    "more": "echo 'feel free to add more command.'",
    "note": "echo 'do not forget to add comma at end of command line except the last.'"
  }
}

```

### add script

The script will be overwrite by the commmand if this is name conflict.

```
├── script
    ├── your_bash_code.sh # you can call it with '$ goo your_bash_code'
    ├── some_code.sh # use 'CALL_PATH' and 'PROJECT_ROOT' global var to locate
    └── more_code.sh # use 'PROJECT_ROOT' to get the project name set when it is initialed

```

## using `.env` file

If you want to deploy the script on different environment, the difference can be set in `/SAME/PATH/AS/GOO_JSON/.env` as the bash script which will be sourced as a subscript if exist.

A sample of `.env` file

```
ENV=development
```

## features

1. We'll not support other arguments like 'goo xxx @other-args' command, to recommand that only when duplicate command can be used as construct command other than the changable ones.

> other working flow coming soon
