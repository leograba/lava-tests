# lava-tests
LAVA tests

## How to use

All tests have only been tested on few modules so far, although they have been written thinking about module compatibility.

### Directories

- *<module_name>*: have the test job definitions that should be submitted to the LAVA server.
- *<module_name>/resources*: keeps scripts that export min and max values for benchmarks, to be sourced in the benchmark scripts.
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
- [Nbench](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/nbench.yaml): image tested does not have nbench. Shell script work on Apalis iMX6. Benchmark acceptable range has to be reviewed.
- [Free RAM](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/free-ram.yaml): not tested using LAVA. Shell script works on Colibri iMX7. Benchmark acceptable range has to be reviewed.
- [Tinymembench](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/tinymembench.yaml): not tested using LAVA. Shell script works on Colibri iMX7. Benchmark acceptable range has to be reviewed.

#### Unfinished and to be improved

- [Flash resize](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/flash_resize.yaml): not working. Must wait until boot from flash is available. Must review for UBI based modules.
- [Hdparm](https://github.com/leograba/lava-tests/blob/master/apalis_imx6/hdparm.yaml): image tested does not have hdparm. Script works on Apalis iMX6. Benchmark acceptable range has to be reviewed. Must remove UBI based modules.

### ToDo and tips

- Update the scripts to use */proc/device-tree/toradex,product-id* to identify the module type.
- Discuss whether benchmarks should have separate tests for min and max values, when testing a range.
- Add a sanity check to the beginning of tests when a benchmark or command
should be available by default, e.g. *lava-test-case hdparm-available --shell hdparm --help*.
- Consider having a server with benchmarks and other binaries compiled for tests using the latest image/toolchain.
- Go throught the upper/lower limits of the benchmarks and verify if they are feasible.
- Add logfile to benchmark tests using lava-test-case-attach.
- Consider migrating the benchmark expected values (min and max) for all tests to a single script that can be sourced.
