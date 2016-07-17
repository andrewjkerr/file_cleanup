# file_cleanup

A small bash script to clean up filenames.

## usage

`./cleanup.sh [-s <separator>] [-d <text to delete>] -p <path to files> -f <format of files>`

## example

```
$ ./cleanup.sh -s "_" -d "-archive" -p "~/dev/project" -f ".rb"
/Users/andrewjkerr/dev/file_1-archive[Dropbox].rb
/Users/andrewjkerr/dev/file 1.rb
---
/Users/andrewjkerr/dev/file_2-archive.rb
/Users/andrewjkerr/dev/file 2.rb
---
Looks good? (Y/n):
Y
Done!
```
