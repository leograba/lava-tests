#!/bin/bash

MODULES_LIST=\
"apalis_imx6;"\
"apalis_t30;"\
"apalis_tk1;"\
"colibri_imx6;"\
"colibri_imx6ull;"\
"colibri_imx7;"\
"colibri_t20;"\
"colibri_t30;"\
"colibri_vf"

PRODUCT_IDS=\
"apalis_imx6.0028.apalis-iMX6Q-2GB-IT;"\
"apalis_imx6.0027.apalis-iMX6Q-1GB;"\
"apalis_imx6.0035.apalis-iMX6D-1GB-IT;"\
"apalis_imx6.0019.apalis-iMX6D-512MB;"\
\
"apalis_t30.0026.apalis-T30-1GB;"\
"apalis_t30.0031.apalis-T30-1GB-IT;"\
"apalis_t30.0025.apalis-T30-2GB;"\
\
"apalis_tk1.0034.apalis-TK1-2GB;"\
\
"colibri_imx6.0014.colibri-iMX6S-256MB;"\
"colibri_imx6.0016.colibri-iMX6S-256MB-IT;"\
"colibri_imx6.0015.colibri-iMX6D-512MB;"\
"colibri_imx6.0017.colibri-iMX6D-512MB-IT;"\
\
"colibri_imx6ull.0036.colibri-iMX6ULL-256MB;"\
"colibri_imx6ull.0040.colibri-iMX6ULL-512MB-WiFi/BL-IT;"\
\
"colibri_imx7.0032.colibri-iMX7S-256MB;"\
"colibri_imx7.0033.colibri-iMX7D-512MB;"\
"colibri_imx7.0039.colibri-iMX7D-1GB;"\
\
"colibri_t20.0020.colibri-T20-256MB;"\
"colibri_t20.0024.colibri-T20-256MB-IT;"\
"colibri_t20.0021.colibri-T20-512MB;"\
"colibri_t20.0022.colibri-T20-512MB-IT;"\
\
"colibri_t30.0023.colibri-T30-1GB;"\
"colibri_t30.0030.colibri-T30-1GB-IT;"\
\
"colibri_vf.0012.colibri-VF61-256MB-IT;"\
"colibri_vf.0010.colibri-VF50-128MB;"\
"colibri_vf.0013.colibri-VF50-128MB-IT"

#echo $MODULES_LIST
#echo $PRODUCT_IDS

#Get input data
read -e -p "Please enter path where the scripts should be installed. Default to current directory: " -i "$PWD/" PRJ_PATH
read -e -p "Chosen directory is $PRJ_PATH  Proceed(Y/n)?" -i "y" PROCEED
case "$PROCEED" in 
	y|Y ) echo "proceeding...";;
	n|N ) echo "exiting..."; exit;;
	* ) echo "invalid choice, exiting..."; exit;;
esac
read -p "Enter test name:" TEST_NAME
TEST_FILE="$TEST_NAME-threshold-values.sh"
read -e -p "Test file will be $TEST_FILE  Proceed(Y/n)?" -i "y" PROCEED
case "$PROCEED" in 
	y|Y ) echo "proceeding...";;
	n|N ) echo "exiting..."; exit;;
	* ) echo "invalid choice, exiting..."; exit;;
esac

#Checks before starting
for MODULE in $(echo $MODULES_LIST | tr ";" "\n"); do
	#Check if all directories exist
	if [ ! -d "$PRJ_PATH$MODULE/resources" ]; then
		read -e -p "Directory $PRJ_PATH$MODULE/resources does not exist. Create(Y/n)?" -i "y" PROCEED
		case "$PROCEED" in 
			y|Y ) mkdir -p $PRJ_PATH$MODULE/resources;;
			n|N ) echo "Exiting..."; exit;;
			* ) echo "invalid choice, exiting..."; exit;;
		esac
	fi
	#Check if there is already files with this test name
	if [ -e "$PRJ_PATH$MODULE/resources/$TEST_FILE" ]; then
		read -e -p "File $PRJ_PATH$MODULE/resources/$TEST_FILE exist. Overwrite(y/N)?" -i "y" PROCEED
		case "$PROCEED" in 
			y|Y )	mv $PRJ_PATH$MODULE/resources/$TEST_FILE $PRJ_PATH$MODULE/resources/$TEST_FILE~;
					echo "Saved backup at "$PRJ_PATH$MODULE/resources/$TEST_FILE~"";;
			n|N ) echo "Exiting..."; exit;;
			* ) echo "invalid choice, exiting..."; exit;;
		esac
	fi
done

#Get benchmark variables/parameters
echo "Enter the benchmark parameters for this test separated by semicolon"
echo "e.g. HAS_EMMC;EMMC_MAX_WRITE_SPEED;EMMC_MIN_WRITE_SPEED"
read -p "Parameters: " TEST_PARM
NPARMS=0
if [ -z $TEST_PARM ]; then
	echo "No test parameters, creating script skeleton only"
else
	echo "Parameters:"
	for PARM in $(echo $TEST_PARM | tr ";" "\n"); do
		echo $PARM
		let "NPARMS++"
	done
fi

#Create script
for MODULE in $(echo $MODULES_LIST | tr ";" "\n"); do
	echo -e "#!/bin/sh\n"\
			"set -x\n\n"\
			"MOD_ID=\$(cat /proc/device-tree/toradex,product-id)\n"\
			"case \$MOD_ID in\n\n\n" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
	read -e -p "Use same value for all $MODULE SKUs(y/N)?" -i "N" PROCEED

	case "$PROCEED" in
		#same value for all SKUs
		y|Y )	CPARM=0
				#read values for all SKUs
				for PARM in $(echo $TEST_PARM | tr ";" "\n"); do
					read -p "Enter value for $MODULE $PARM: " PARM_VAL
					if [ $CPARM -eq 0 ]; then
						PARMS_VALUES_LIST="$PARM_VAL"
						let "CPARM++"
					else
						PARMS_VALUES_LIST="$PARMS_VALUES_LIST;$PARM_VAL"
					fi
				done
				#generate file
				for PRODUCT in $(echo $PRODUCT_IDS | tr ";" "\n"); do
					if [[ $PRODUCT == "$MODULE"* ]]; then
						PROD_ID=$(echo $PRODUCT | cut -d "." -f2)
						PROD_DESC=$(echo $PRODUCT | cut -d "." -f3)
						echo -e "    #$PROD_DESC\n"\
								"    $PROD_ID)" >> $PRJ_PATH$MODULE/resources/$TEST_FILE

						if [ -z $TEST_PARM ]; then
							echo -e "\n" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
						else
							CPARM=1
							for PARM in $(echo $TEST_PARM | tr ";" "\n"); do
								PARM_VAL=$(echo $PARMS_VALUES_LIST | cut -d ';' -f $CPARM)
								if [ "$CPARM" -ne "$NPARMS" ]; then
									echo -e "        export $PARM=$PARM_VAL;" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
								else
									echo -e "        export $PARM=$PARM_VAL;;\n" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
								fi
								let "CPARM++"
							done
						fi
					fi
				done;;
		#one value for each of the SKUs
		n|N ) 	for PRODUCT in $(echo $PRODUCT_IDS | tr ";" "\n"); do
					if [[ $PRODUCT == "$MODULE"* ]]; then
						PROD_ID=$(echo $PRODUCT | cut -d "." -f2)
						PROD_DESC=$(echo $PRODUCT | cut -d "." -f3)
						echo -e "    #$PROD_DESC\n"\
								"    $PROD_ID)" >> $PRJ_PATH$MODULE/resources/$TEST_FILE

						if [ -z $TEST_PARM ]; then
							echo -e "\n" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
						else
							CPARM=0
							for PARM in $(echo $TEST_PARM | tr ";" "\n"); do
								let "CPARM++"
								read -p "Enter value for $PROD_DESC $PARM: " PARM_VAL
								if [ "$CPARM" -lt "$NPARMS" ]; then
									echo -e "        export $PARM=$PARM_VAL;" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
								else
									echo -e "        export $PARM=$PARM_VAL;;\n" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
								fi
							done
						fi

					fi
				done;;
		* ) echo "invalid choice, exiting..."; exit;;
	esac
	
	echo -e "    *) false ;;\n"\
			"esac" >> $PRJ_PATH$MODULE/resources/$TEST_FILE
done
