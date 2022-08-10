import unittest
import simpleargs

test "parse args":
  var p: ParseSchema
  p.initParser("my tool"):
    p.addOption("-i", "--input", help="path to input")
    p.addOption("-o", "--out", help="Output file")
    p.addOption("-x", "--xarg", help="xarg", default="xarg")     
    p.addFlag(long="--flag1", help="Flag1")
    p.addFlag(long="--flag2", help="Flag2")

  var opts = p.parseOptions("--input myinput --out myoutput --flag1")

  check opts.isSet("input") == true
  check opts.isSet("out") == true
  check opts.isSet("flag1") == true
  check opts.isSet("flag2") == false

  check opts["input"] == "myinput"
  check opts["out"] == "myoutput"
  check opts["xarg"] == "xarg"