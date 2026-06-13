```groovy
pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    environment {
        DOCKER_IMAGE = "srinadh7790/bank-app"
        SONAR_HOST  = "http://3.109.56.52:9000"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    credentialsId: 'github-credential',
                    url: 'https://github.com/Srinadh7790/secure-bank.git'
            }
        }

        stage('Check Java') {
            steps {
                sh '''
                    java -version
                    javac -version
                    echo "JAVA_HOME=$JAVA_HOME"
                '''
            }
        }

        stage('Build') {
            steps {
                dir('securebank') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Code Quality Analysis') {
            steps {
                dir('securebank') {
                    withCredentials([
                        string(
                            credentialsId: 'sonartoken',
                            variable: 'SONAR_TOKEN'
                        )
                    ]) {
                        sh """
                        mvn sonar:sonar \
                        -Dsonar.host.url=${SONAR_HOST} \
                        -Dsonar.login=${SONAR_TOKEN}
                        """
                    }
                }
            }
        }

        stage('Upload Artifact to Nexus') {
            steps {
                dir('securebank') {
                    sh 'mvn deploy -DskipTests'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('securebank') {
                    sh """
                    docker build \
                    -t ${DOCKER_IMAGE}:${BUILD_NUMBER} \
                    -t ${DOCKER_IMAGE}:latest .
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry(
                    credentialsId: 'dockerhub-creds',
                    url: ''
                ) {
                    sh """
                    docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    docker push ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: 'ec2-ssh-key',
                        keyFileVariable: 'KEY'
                    )
                ]) {

                    sh """
                    ssh -o StrictHostKeyChecking=no \
                    -i \$KEY ec2-user@13.203.205.147 '

                    docker pull ${DOCKER_IMAGE}:${BUILD_NUMBER}

                    docker stop bank-app || true
                    docker rm bank-app || true

                    docker run -d \
                    --name bank-app \
                    -p 8080:8080 \
                    ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    '
                    """
                }
            }
        }
    }

    post {

        success {
            echo 'Pipeline SUCCESS 🚀'
        }

        failure {
            echo 'Pipeline FAILED ❌'
        }

        always {
            cleanWs()
        }
    }
}
```
