# lava-tests
LAVA tests

## How to use

All tests have only been tested on Apalis iMX6 so fat, although they have been written thinking about other modules.

### Directories

- *<module_name>*: have the test job definitions that should be submitted to the LAVA server.
- *common*: holds the lava test shell definitions used by the test job definitions.
- *common/sh_scripts*: holds the shell scripts used by the test shell definitions.

### Tests and status

The scripts are currently divided into "Tested and working", "Script working on module without LAVA", which usually means the image being used for tests is
lacking some feature, tool or configuration, and "Unfinished and to be improved", where some tests are under development and testing, while others are working
but should have more features.

#### Tested and working

- [Smoke tests basic](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/smoke-tests-basic.yaml): working.
- [Basic shell script](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/basic-shell-script.yaml): working.

#### Script working on module without LAVA

- [Smoke tests network](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/smoke-tests-network.yaml): the board has no internet access yet. Shell scripts work on Apalis iMX6.
- [Opkg](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/opkg.yaml): the board has no internet access yet. Shell scripts work on Apalis iMX6.
- [Read-ahead](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/read_ahead.yaml): image tested had default read-ahead size. Shell scripts work on Apalis iMX6. 
- [Hdparm](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/hdparm.yaml): image tested does not have hdpart. Script works on Apalis iMX6.

#### Unfinished and to be improved

- [Nbench](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/nbench.yaml): image tested does not have nbench. Script works but results are not currenty parsed, only stored.
- [Flash resize](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/flash_resize.yaml): not working. Must wait until boot from flash is available.

### ToDo

- There are tests that work based on the module model, by using 'uname'. Later, scripts have additional
parameters for modules that have the same name but different configuration. E.g. colibri-imx7 and
colibri-imx7-1gb. This will fail, therefore the technique to find the module configuration has to
be updated.
- Discuss whether benchmarks should have separate tests for min and max values, when testing a range
- Currently the nbench results are not parsed. This should be improved
- Add a sanity check to the beginning of tests when a benchmark or command
should be available by default, e.g. lava-test-case hdparm-available --shell hdparm --help
- Consider having a server with benchmarks and other binaries compiled for tests using the latest image/toolchain
