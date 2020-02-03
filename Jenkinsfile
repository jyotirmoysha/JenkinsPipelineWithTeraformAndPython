pipeline {
    agent {
        node {
            label 'worknode_azure'
        }
    }
    stages {
        
        stage ('Code_Checkout') {
            steps {
                git branch: 'LiveSpread_POM', credentialsId: 'a42da2df-9208-4437-a15e-62116c558117', url: 'https://genpactdigitalengineering.visualstudio.com/CORA_AI_LIVESPREAD/_git/LiveSpread_SQL_NOUIC'
            }
        }
        stage ('Build_Pakage') {
            steps {
                sh '/usr/bin/mvn package'
            }
        }
        stage ('Code_Upload') {
            steps {
				
					nexusArtifactUploader(
						nexusVersion: 'nexus3',
						protocol: 'http',
						nexusUrl: '10.75.242.71:8080',
						groupId: 'com.genpact.LiveSpread',
						version: '${BUILD_NUMBER}',
						repository: 'Cora_LS_PIMCO_Dev',
						credentialsId: 'nexus',
						artifacts: [
						    [artifactId: 'LiveSpread',
						    classifier: '',
					        file: '/var/jenkins/workspace/Cora_LS_PIMCO_Dev/target/LiveSpread.war',
							type: 'war']
					    ]
					)
			}
        }
        stage ('Terraform_Init') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'af6743e9-f229-4e07-a4a2-f3bb2a9510ca', passwordVariable: 'pwd', usernameVariable: 'usr')]){
                sh "terraform init  -var 'user=${usr}' -var 'password=${pwd}'"
            }}
        }
        stage ('Terraform_Validate') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'af6743e9-f229-4e07-a4a2-f3bb2a9510ca', passwordVariable: 'pwd', usernameVariable: 'usr')]){
                sh "terraform validate  -var 'user=${usr}' -var 'password=${pwd}'"
            }}
            }
        stage ('Terraform_Apply') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'af6743e9-f229-4e07-a4a2-f3bb2a9510ca', passwordVariable: 'pwd', usernameVariable: 'usr')]){
                sh "terraform apply -input=true -auto-approve -var 'user=${usr}' -var 'password=${pwd}'"
                sh "terraform destroy -input=true -auto-approve -var 'user=${usr}' -var 'password=${pwd}'"
            }}
        }
        }
    }
