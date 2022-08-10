# Simpleargs package

A simple package for parsing command line arguments with basic functionality. This is intended for quick arg parsing with minimum dependencies, for more complex scenarios, see alternatives like the [argparse](https://github.com/iffy/nim-argparse) package.

## Quick start

The essential usage is to create a parsing schema and then parse command line arguments

```nim
var p: ParseSchema
    p.initParser("my tool"):
        p.addOption("-i", "--input", help="path to input", required=true, default="input.txt"):
        p.addOption("-o", "--out", help="Output file")        
        p.addFlag(long="--flag_on", help="This flag is true")

    var opts = p.parseOptions()
```

The help message is automatically print if `--help` or `-h` are parsed from command-line.

## Retrieve values

- An argument value can be retrieved using `[]` notation on the object from `parseOptions()`, like `opts["input"]`. In this case a string is returned. The same works for positional arguments using an int like `opts[0]`.

- You can also automatically get the correct var type using the `getOpt` method on a previously declared var, like

    ```nim
    var x: int
    opts.getOpt("input", x)
    ```

    This will raise and exception if the value from the argument cannot be casted to the requested data type.

- You can use `isSet` method to check if an argument was set at the command line, like `opts.isSet("input")` return true if `--input` was used at the command line. Note that at the moment this check strictly so the above example returns false if the short version of the option `-i` was used instead.

## Limitations

1. At the moment when only long option name is specified this needs to be explicit. So this works `addOption(long="--input", help="help text")`, but this does not work `addOption("--input", help="help text")`.

2. The return object after parsing will contain both short and long option names if both were set.

3. No support for option with multiple values, if an option is seen multiple times during parsing this will result in an error.

4. When option are set at command line using the short name, the value need to be specified with `=`. So this works `mytool -i=input.txt`, but this does not work `mytool -i input.txt`.
