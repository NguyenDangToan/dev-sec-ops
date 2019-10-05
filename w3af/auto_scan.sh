#!/bin/bash

#input parameters
url=$1
module=$2

while [ -z $url ]; do
	#echo "Please input URL, syntax: ./demo_script.sh <URL>"
	echo -e "\e[31;43m Please input your URL, syntax: ./demo_script.sh <URL> <module>\e[0m"
	echo "You can input URL here: "
	read url
	echo "Your URL is $url"
done

while [ -z $module ]; do
	echo -e "\e[31;43m Please input module, syntax: ./demo_script.sh <URL> <module>:\e[0m"
	echo "You can input module here:  "
	read module
done
echo "Module is set: $module"

#edit url in demoV2.sh
#sed -i 's+url+'$url'+g' /dev-sec-ops/w3af/script_w3af/sql.txt
#sed -i 's+set target.*+set target '$url'+g' /dev-sec-ops/w3af/script_w3af/top10_OWASP.txt

#open w3af_console -s ____
cd
cd w3af/
if [ $module = "SQL_injection" ];then
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/sql.txt
	./w3af_console -s /root/dev-sec-ops/w3af/sql.txt
	
	#get vulnerability line and export to new file clearly
	grep -n 'vulnerability' /root/dev-sec-ops/w3af/reports/report_SQL_injection.txt > /root/dev-sec-ops/w3af/reports/report_SQL_injection_$(date +%d%m%Y).txt
	
elif [ $module = "OWASP_TOP10" ]; then
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/top10_OWASP.txt
	./w3af_console -s /root/dev-sec-ops/w3af/top10_OWASP.txt
	
	#get vulnerability line and export to new file clearly
	grep -n 'vulnerability' /root/dev-sec-ops/w3af/reports/report_OWASP_TOP10.txt > /root/dev-sec-ops/w3af/reports/report_OWASP_TOP10_$(date +%d%m%Y).txt

elif [ $module = "A2_OWASP" ];then
	echo -e "\e[31;43mA2_Broken Authentication\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/A2_Broken_Authentication.txt
	./w3af_console -s /root/dev-sec-ops/w3af/A2_Broken_Authentication.txt

elif [ $module = "A3_OWASP" ];then
	echo -e "\e[31;43mA3_Sensitive Data Exposure\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/A3_Sensitive_Data_Exposure.txt
	./w3af_console -s /root/dev-sec-ops/w3af/A3_Sensitive_Data_Exposure.txt

elif [ $module = "A4_OWASP" ];then
	echo -e "\e[31;43mA4_XML External Entities\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/A4_XML_External_Entities.txt
	./w3af_console -s /root/dev-sec-ops/w3af/A4_XML_External_Entities.txt

elif [ $module = "A5_OWASP" ];then
	echo -e "\e[31;43mA5_Broken Access Control\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/A5_Broken_Access_Control.txt
	./w3af_console -s /root/dev-sec-ops/w3af/A5_Broken_Access_Control.txt
elif [ $module = "A6_OWASP" ];then
	echo -e "\e[31;43mA6_Security Misconfiguration\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/scan_A6.txt
	./w3af_console -s /root/dev-sec-ops/w3af/scan_A6.txt
elif [ $module = "A7_OWASP" ];then
	echo -e "\e[31;43mA7_Cross-Site Scripting\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/scan_A7.txt
	./w3af_console -s /root/dev-sec-ops/w3af/scan_A7.txt
elif [ $module = "A8_OWASP" ];then
	echo -e "\e[31;43mA8_Insecure Deserialization\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/scan_A8.txt
	./w3af_console -s /root/dev-sec-ops/w3af/scan_A8.txt
elif [ $module = "A10_OWASP" ];then
	echo -e "\e[31;43mA10_Insufficient Logging&Monitoring\e[0m"
	sed -i 's+set target.*+set target '$url'+g' /root/dev-sec-ops/w3af/scan_A10.txt
	./w3af_console -s /root/dev-sec-ops/w3af/scan_A10.txt

fi
