In order to install the SNMP Tools you need to: 
 sudo apt install snmp - allowing to use snmpget, snmpwalk and so on
 sudo apt install libsnmp-dev - allowing to use snmptranslate
 sudo apt-get install snmp-mibs-downloader - downloading and fixing some additional MIB files without which you won't have snmptranslate functionality
 
 Checking if snmptranslate works:
 http://net-snmp.sourceforge.net/wiki/index.php/TUT:snmptranslate
 
 Using and loading MIBs:
 http://net-snmp.sourceforge.net/wiki/index.php/TUT:Using_and_loading_MIBS
 
The command: net-snmp-config --default-mibdirs shows you where it looks for the MIB files
so you can create a custom directory mkdir -p ~/.snmp/mibs and upload there the MIB files
You can also load them in order not to use the -m argument specifying the MIB file to use for searching the OID by creating a snmp.conf file in ~/.snmp
and you can put inside the following line: 
mibs +T21-ENCODER-MIB
mibs +T21-MIB
mibs +T21-SYSTEM-MIB

while +T21-ENCODER-MIB is the name of the MIB file located in ~/.snmp/mibs without the extension. When you are ready you can just use: 

snmptranslate -IR -On sourceLockStatus.0

Otherwise you can use:
snmptranslate -m +CISCO-RHINO-MIB -IR -On ciscoLS1010ChassisFanLed

You can check the SNMP OIDs available executing snmpwalk command: 

snmpwalk -v2c -c public 10.153.243.24 transcodeTable

where transcodeTable is a section in the MIB file. This will walk over all elements nested under the transcodeTable, their respective OIDs and their values. 

Please note that "public" is the read-only password and if you want to use snmpset you should use "private" which is the default password.
