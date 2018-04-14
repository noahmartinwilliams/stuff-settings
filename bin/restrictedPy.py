#! /usr/bin/python

import sys
import os
from RestrictedPython import compile_restricted
from RestrictedPython.Guards import safe_builtins

def is_in_directory(filepath, directory):
	return os.path.realpath(filepath).startswith(os.path.realpath(directory) + os.sep)

def newImport(string, a, b, c):
	f = open(string, 'r')
	src = f.read()
	code = compile_restricted(src, '<string>', 'exec')
	exec(code) in restricted_globals
	f.close()

def newOpen(string, mode):
	if is_in_directory(string, "."):
		return open(string, mode)
	else:
		raise IOError("permission denied can't access " + string)

def doPrint(*kargs):
	if len(kargs) != 0:
		string = kargs[0]
		print string

safe_builtins['open'] = newOpen
safe_builtins['__import__'] = newImport
safe_builtins['_print_'] = doPrint
safe_builtins['_getattr_'] = getattr
restricted_globals = dict(__builtins__ = safe_builtins)

sys.path.append(os.path.dirname(os.path.realpath(sys.argv[1])))
src = "import malicious"
code = compile_restricted(src, '<string>', 'exec')

exec(code) in restricted_globals
