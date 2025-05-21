pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nidharsan8008/maven_project:latest'
        MAVEN_IMAGE = 'maven:3.8.5-openjdk-11-slim'
        PROJECT_DIR = '/app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/NIDHARSAN-V/Devops2.git'
            }
        }

      stage('Run Unit Tests') {
    steps {
        script {
            sh """
                docker run --rm \
                -v \$PWD:${PROJECT_DIR} \
                -w ${PROJECT_DIR} \
                ${MAVEN_IMAGE} \
                mvn clean test
            """

            sh """
                echo "Listing target directory contents on host:"
                ls -l target/
                echo "Listing surefire-reports directory on host:"
                ls -l target/surefire-reports || echo "No surefire-reports directory found"
            """
        }
    }
}

        stage('Publish Test Results') {
            steps {
                script {
                    echo "*************************************************"
                    sh 'pwd'
                    echo "*************************************************"
                    echo "---- Displaying Sample JUnit XML Report (first 30 lines) ----"
                    sh 'head -n 30 target/surefire-reports/*.xml || echo "JUnit report not found"'

                    echo "---- Publishing JUnit Test Results to Jenkins ----"
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Build Final Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub_token', url: 'https://index.docker.io/v1/') {
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }
}
