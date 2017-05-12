# GOO

This is a part of construct tool (like npm script field).
Run shell cmd and sh script any where in your project.

## installation

```
git clone https://github.com/liu946/goo.git
cd goo
(sudo) ./install.sh
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

```
├── script
    ├── your_bash_code.sh # you can call it with '$ goo your_bash_code'
    ├── some_code.sh # use 'CALL_PATH' and 'PROJECT_ROOT' global var to locate
    └── more_code.sh # use 'PROJECT_ROOT' to get the project name set when it is initialed

```


> other working flood coming soon
