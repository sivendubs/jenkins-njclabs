pipeline {
    agent any
    tools {
        maven 'Maven' 
	  
	    
    }
   stages {
   	stage('SonarQube Analysis'){
        	steps {
                	withSonarQubeEnv('Sonarqube') {
                    		script {
					container_Up = false
		    			LAST_STARTED = env.STAGE_NAME 
					sh "mvn -f apiops-generic-db-sapi/pom.xml sonar:sonar -Dsonar.sources=src/ -Dsonar.exclusions=**/java/** -Dsonar.test.exclusions=**/java/**"
                    			timeout(time: 1, unit: 'HOURS') { 
                        			sh "curl -u admin:admin -X GET -H 'Accept: application/json' http://104.248.169.167:9000/api/qualitygates/project_status?projectKey=com.mycompany:apiops-generic-db-sapi > status.json"
                        			def json = readJSON file:'status.json'
                        			echo "${json.projectStatus}"
                        			if ("${json.projectStatus.status}" == "ERROR") {
                            				currentBuild.result = 'FAILURE'
                           				error('Pipeline aborted due to quality gate failure.')
                           			}
                        		}     
                    		}
                	}
                }
	}
       /*stage('upload to nexus') {
      steps {
        script {
	  LAST_STARTED = env.STAGE_NAME
          echo "hello";
          pom = readMavenPom file: "pom.xml";
          filesbyGlob = findFiles(glob: "target/*.jar");
          echo "${filesbyGlob[0].path}";
          nexusArtifactUploader(artifacts: [[artifactId: pom.artifactId, classifier: '', file: filesbyGlob[0].path, type: 'jar']], credentialsId: 'nexus', groupId: pom.groupId, nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'com.testnjc', version: currentBuild.number.toString())
        }
      }
    }*/
	   
      stage('Build') {
      		steps {
	    		script {
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
				LAST_STARTED = env.STAGE_NAME
				sh "mvn -f apiops-generic-db-sapi/pom.xml -s $settings clean install  -DskipTests "     
					//sh "mvn -f apiops-generic-db-sapi/pom.xml clean install  -DskipTests"  
				}	
		    	} 
            	}    
      } 
	   
     stage('Build image') {
      		steps {
        		script {
			//      sh "docker stop apiops-salesforce-sapi" 
        		//   	sh "docker rm apiops-salesforce-sapi"
			   	LAST_STARTED = env.STAGE_NAME
				container_Up = false
			   	sh "docker build -t apiops-generic-db-sapi:mule -f Dockerfile ."
                	 
                        }
               }
      }

      stage('Run container') {
      		steps {
        		script {
			     	LAST_STARTED = env.STAGE_NAME
				
          		    	sh ' docker run -itd -p 8095:8081 --name apiops-generic-db-sapi apiops-generic-db-sapi:mule'
				container_Up = true
				sh 'sleep 90'
       			}
		}
     }
   	
    /* stage ('Munit Test'){
        	steps {
			script {
			   	LAST_STARTED = env.STAGE_NAME
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
			   	sh "mvn -f apiops-generic-db-sapi/pom.xml -Dhttp.port=8086 -s $settings -Dkey=mymulesoft test"
				
				publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'apiops-generic-db-sapi/target/site/munit/coverage', reportFiles: 'summary.html', reportName: 'Munit coverage Report', reportTitles: ''])
				}
			}		
        	}    
     }*/
      stage('Munit & Functional Testing'){
        	steps {
			script {
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
				LAST_STARTED = env.STAGE_NAME
				//sh "mvn -f apiops-generic-db-sapi/pom.xml -Dhttp.port=8086 -Dkey=mymulesoft test -Dtestfile=apiops-generic-db-sapi/src/test/javarunner.TestRunner.java "
				sh "mvn -f apiops-generic-db-sapi/pom.xml -s $settings -Dhttp.port=8086 -Dkey=mymulesoft -Dtestfile=apiops-generic-db-sapi/src/test/javarunner.TestRunner.java test "
				publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'apiops-generic-db-sapi/target/site/munit/coverage', reportFiles: 'summary.html', reportName: 'Munit coverage Report', reportTitles: ''])
				cucumber(failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: 'cucumber.json', jsonReportDirectory: 'apiops-generic-db-sapi/target', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1)
			}
			}
             	}   
     }
	
	  stage ('Jmeter Testing'){
	    steps{
		    sh "mvn -f apipos-jmeter-automation-master/pom.xml clean verify -Djmeter.path=/opt/jmeter/5.3/libexec/bin/"
		    perfReport filterRegex: '', sourceDataFiles: '**/*.jtl'
		    publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: '**/index.html', reportName: 'Jmeter- performance test report', reportTitles: 'Jmeter Reports'])
	
	    	   }
	   }
	   
    //stage('Generate Reports') {
    //		steps {
//			script {
//				LAST_STARTED = env.STAGE_NAME
//				cucumber(failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: 'cucumber.json', jsonReportDirectory: 'cucumber-API-Framework/target', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1)
//			}
 //               }
 //   }
	   
    stage('Archetype'){
        	steps {
			script {
		    		LAST_STARTED = env.STAGE_NAME
		    		configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
					def data = "archetype.artifactId=generic-db-sapi"
                  		        writeFile(file: 'archetype.properties', text: data)
                    			sh "mvn -f apiops-generic-db-sapi/pom.xml -s $settings archetype:create-from-project -Darchetype.properties=/var/lib/jenkins/workspace/devops-project/archetype.properties"
		    			sh "mvn -f apiops-generic-db-sapi/target/generated-sources/archetype/pom.xml -s $settings clean deploy -DaltSnapshotDeploymentRepository=nexus-snapshots::http://104.248.169.167:8081/repository/maven-snapshots/"
                  		} 
			}
              }   
     }
	  
    stage('Deploy to Cloudhub'){
        	steps {
			script {
				LAST_STARTED = env.STAGE_NAME
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
					
				sh 'mvn -f apiops-generic-db-sapi/pom.xml -s $settings package deploy -DmuleDeploy -DskipTests -Dkey=mymulesoft -Danypoint.username=njcdemo1 -Danypoint.password=Njclabs@123 -DapplicationName=apiops-generic-db-sapi-mule -Dcloudhub.region=us-east-2 -Danypoint.platform.client_id=2873c31e7152405e9dc38600007108e8 -Danypoint.platform.client_secret=70da4Da4228749B7A33C848E9a3C0849'
				}
			}
             	}
    }
	   
    stage('Email') {
      		steps {
			script {
          		    	readProps= readProperties file: 'apiops-generic-db-sapi/email.properties'
          		    	echo "${readProps['email.to']}"
        		    	emailext(subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', body: 'Build is Success.Please find the functional testing reports. In order to check the logs, please go to url: $BUILD_URL'+readFile("apiops-generic-db-sapi/emailTemplate.html"), attachmentsPattern: 'cucumber-API-Framework/target/cucumber-reports/report.html', from: "${readProps['email.from']}", mimeType: "${readProps['email.mimeType']}", to: "${readProps['email.to']}")
                        }
		}
    }   
    stage('Kill container') {
      		steps {
        		script {
	  	        	LAST_STARTED = env.STAGE_NAME		
          		    	sh 'docker rm -f apiops-generic-db-sapi'
				sh 'sleep 10'
				sh 'docker rmi apiops-generic-db-sapi:mule'
				
        		}
      		}
    	} 
   
   }
   post {
        failure {
	    script {
	    		emailbody = "Build Failed at $LAST_STARTED Stage. Please find the attached logs for more details."
          		readProps= readProperties file: 'cucumber-API-Framework/email.properties'
				emailext(subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', body: "$emailbody", attachLog: true, from: "${readProps['email.from']}", to: "${readProps['email.to']}")
                        if (container_Up)  {
		 		sh 'docker rm -f apiops-generic-db-sapi'	
				sh 'sleep 10'
				sh 'docker rmi apiops-generic-db-sapi:mule'
				
		 }
	    } 
        }
    } 
} 
