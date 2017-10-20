# lava-tests
LAVA tests

## How to use

### Directories

- *<module_name>*: have the test job definitions that should be submitted to the LAVA server.
- *common*: holds the lava test shell definitions used by the test job definitions.
- *common/sh_scripts*: holds the shell scripts used by the test shell definitions.

### ToDo

- There are tests that work based on the module model, by using 'uname'. Later, scripts have additional
parameters for modules that have the same name but different configuration. E.g. colibri-imx7 and
colibri-imx7-1gb. This will fail, therefore the technique to find the module configuration has to
be updated.
- Discuss whether benchmarks should have separate tests for min and max values, when testing a range
- Currently the nbench results are not parsed. This should be improved
- Add a sanity check to the beginning of tests when a benchmark or command
should be available by default, e.g. lava-test-case hdparm-available --shell hdparm --help
