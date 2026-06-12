pipeline {
    agent any

    tools {
        maven 'MAVEN_HOME'
    }

    environment {
        DOCKER_IMAGE = "srinadh7790/bank-app"
        
        // FIXED: use localhost instead of fake DNS
        SONAR_HOST = "http://localhost:9000"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                url: 'https://github.com/Srinadh7790/secure-bank.git'
            }
        }

        stage('Check Java') {
            steps {
                sh '''
                java -version
                javac -version || true
                echo $JAVA_HOME
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
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')]) {
                    dir('securebank') {
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
                sh """
                docker build -t $DOCKER_IMAGE:$BUILD_NUMBER .
                docker tag $DOCKER_IMAGE:$BUILD_NUMBER $DOCKER_IMAGE:latest
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
                    sh """
                    docker push $DOCKER_IMAGE:$BUILD_NUMBER
                    docker push $DOCKER_IMAGE:latest
                    """
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'ec2-ssh-key', keyFileVariable: 'KEY')]) {
                    sh """
                    ssh -i $KEY ec2-user@13.203.205.147 '
                    docker pull $DOCKER_IMAGE:$BUILD_NUMBER &&
                    docker stop bank-app || true &&
                    docker rm bank-app || true &&
                    docker run -d --name bank-app -p 8080:8080 $DOCKER_IMAGE:$BUILD_NUMBER
                    '
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline SUCCESS 🚀"
        }
        failure {
            echo "Pipeline FAILED ❌"
        }
    }
}
