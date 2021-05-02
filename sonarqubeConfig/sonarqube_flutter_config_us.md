# Flutter and SonarQube good choice to improve our project

This article will give you a brief introduction to an analysis tool for your code.
We will try to answer: Why use sonarqube? How to install it?

The English version of this article: 
The Spanish version of this article:

# Introduction
Sonarqube, like so many similar tools, allows us to perform static code analysis, this will guide us to detect points for improvement.

## Why use sonarqube?
It will help us to identify the things we do well. But mainly the things we do wrong.
Among the main uses, we can highlight the possibility of identifying aspects such as:
- duplicate code
- dead code
- coding standards
- unnecessary comments
- lack of unit tests and integration tests
- file size and methods
- spaghetti code
- vulnerabilities


## What information can sonarqube show us?
- **Quality Gate**: Rules that the analyzed project must comply with to pass the stage.
- **Bugs y Vulnerabilidades**: Refers to actual or potential failures.
- **Code smells**: It is an indication that you can improve the writing of your code. It does not mean that you have any errors, but it could increase the risk of errors.
- **Coverage**: It allows us to know how much code has been tested and validated by the tests.

# How to install and use it?

Let's see the steps for you to install it and integrate it into your developer day.

### Prerequisites:
- [Docker](https://docs.docker.com/get-docker)


### Setup and run sonarqube
1. Install sonarqube from **terminal** with the following command:
	```
	docker pull sonarqube
	```
	
2. Run the **sonarqube** container,  two ways to do it:

	- Using the following **command**
			```docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 	sonarqube:latest```
			
		If you downloaded a version other than *latest* change to the specific version.
		Important to remember the *--name* for later use.


	- The second way to do it is through **docker** as shown in the following image:
	 Important to remember the *name* for later use
	<p align="center" width="100%">
    <img src="https://i.imgur.com/Iygj8gT.png" width="600"/>
	</p>
	

3. Enter to ```localhost:9000``` to validate that everything runs fine, you will find a section like the following image, the username and password is **admin**:
	<p align="center" width="100%">
    <img src="https://i.imgur.com/xnAez9L.png" width="600"/>
	</p>

4. We are going to install a plugin to be able to support the analysis in Flutter, 
	- Download from section **[releases](https://github.com/insideapp-oss/sonar-flutter)** the latest version of the file **.jar**
	- We are going to copy the downloaded file through the **terminal** in the docker container.
	- From the **docker** application we are going to execute the **cli** and then you are going to take the "**id-docker**" from the docker container as shown in the following images.
	<p align="center" width="100%">
    <img src="https://i.imgur.com/Bo4SMkd.png" width="600"/>
    <img src="https://i.imgur.com/hN3Ue7w.png" width="600"/>    
	</p>

	- Then you are going to copy the **.jar** file to the docker container as follows:
		```docker cp file_path.jar id-docker:/opt/name/extensions/plugins```

		**file_path.jar**: path where you downloaded the file **.jar**
		**id-docker**: id of the container obtained in the previous step
		**name**: container name. If you followed the tutorial without making changes, it is **sonarqube**

	- Check in the cli console that you have the **.jar** file in the correct location
	- Reboot the docker container
5. Download the [**SonarScanner**](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)
	- Dowload the **.zip** file for you OS and set it as a system variable for your OS
	- Ex: On my Mac, 
		- Download and unzip in a folder called **tools** in $HOME
		- Then my bash/zsh configuration is as follows:  ```export PATH="$PATH":"$HOME/tools/sonar-scanner/bin"```
6. Let's go back to going back to ```localhost:9000```
7. Followed by that you will create a project and you will choose the option **Manually**
8. Enter a key and a name of your choice
9. Enter a token for your project of your choice
10. Create a [configuration](https://github.com/insideapp-oss/sonar-flutter#project-configuration) file in your flutter project called: ```sonar-project.properties```
	```console
	# Project identification
	sonar.projectKey=flutter_rocks
	sonar.projectName=Flutter Rocks
	sonar.projectVersion=1.0
		
	# Source code location.
	# Path is relative to the sonar-project.properties file. Defaults to .
	# Use commas to specify more than one folder.
	sonar.sources=lib
	sonar.tests=test

	# Encoding of the source code. Default is default system encoding.
	sonar.sourceEncoding=UTF-8

	# Allows reuse of an existing analyzer report
	# sonar.dart.analysis.reportPath=

	# Analyzer mode
	# Can be:
	# - flutter (flutter analyze) - default
	# - dart (dart analyze)
	# - legacy (dartanalyzer)
	# sonar.flutter.analyzer.mode= 
	```
11. Execute the command for your OS as indicated by the **SonarQube** console in the root of your project
	<p align="center" width="100%">
    <img src="https://i.imgur.com/zN4S6nt.png" width="600"/>
	</p>
13. Result: You can reload your **dashboard** to see all outputs
	<p align="center" width="100%">
    <img src="https://i.imgur.com/6ivPZnm.png" width="600"/>
    <img src="https://i.imgur.com/m3PTgHi.png" width="600"/>
	</p>

PD: If you get an error when indexing the files in the test-folder, you can follow this [solution](https://stackoverflow.com/questions/29837369/cant-be-indexed-twice-testsourcedirectory-and-sourcedirectory-are-same/40150551#40150551)


## Conclusion
** Sonarqube ** can become the best ally for projects where you have teams that require evaluating the quality of the code and taking a quality leap. It will allow you to create "rules" so that a team can keep up with customer expectations.

---
The steps to run and install sonarqube are short; what I wanted to achieve was to be as detailed as possible for people who are just starting, and need a more detailed step-by-step.


Greetings everyone, thanks for getting here. 
Consider giving like, share, and see you in an upcoming Flutter article.





### References:
- https://docs.sonarqube.org/latest/setup/get-started-2-minutes/
- https://hub.docker.com/_/sonarqube.
- https://docs.docker.com/engine/reference/commandline/cp/
- https://stackoverflow.com/questions/29837369/cant-be-indexed-twice-testsourcedirectory-and-sourcedirectory-are-same/40150551#40150551
- https://github.com/insideapp-oss/sonar-flutter
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjg3MDU2MTI3LDU3Nzc1NzQzLC0xNzg1OT
I2NjkyLC0yMTY3OTE3MSwtNDI1NjkxMDQ0LC0xMjczNTg0ODQw
LC03ODE2NzYxMyw3MzA5OTgxMTZdfQ==
-->