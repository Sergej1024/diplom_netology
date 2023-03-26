#!groovy
// Run docker build
properties([disableConcurrentBuilds()])

pipeline {
    agent { 
        label 'built-in'
        }
    triggers { pollSCM('* * * * *') }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages {
        stage("import credentials") {
            steps {
                echo " ============== import credentials =================="
                sh """
                if [ ! -s /var/jenkins_home/credentialImported ]; then
                    curl http://localhost:8080/jnlpJars/jenkins-cli.jar -o jenkins-cli.jar
                    java -jar jenkins-cli.jar -s http://localhost:8080 import-credentials-as-xml "system::system::jenkins" < /var/jenkins_home/exported-credentials.xml
                    echo 'imported' > /var/jenkins_home/credentialImported
                fi
                """
            }
        }
        stage("get tag") {
            steps {
                script {
                    latestTag = sh(returnStdout: true, script: "git describe --tags").trim()
                }
                echo "latestTag=$latestTag"
            }
        }
        stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    docker login -u $USERNAME -p $PASSWORD
                    """
                }
            }
        }
        stage("create docker image") {
            steps {
                echo " ============== start building image =================="
                dir ('.') {
                	sh """
                    docker build -t ${login}/diplom-test-app:$latestTag . 
                    """
                }
            }
        }
        stage("docker push") {
            steps {
                echo " ============== start pushing image =================="
                sh """
                docker push ${login}/diplom-test-app:$latestTag
                """
            }
        }
        stage("kubectl deploy") {
            steps {
                echo " ============== start pushing image =================="
                sh """
                kubectl set image deployment.apps/diplom-test-app diplom-test-app=${login}/diplom-test-app:$latestTag
                """
            }
        }
    }
}