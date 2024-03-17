pipeline{
    agent any
    stages{
        stage("Code Clone"){
            steps{
            echo "Cloning the Code..."
            git url: "https://github.com/bhuvi1508/discord-clone.git", branch: "master"
            echo "Code has been Cloned..."
            }
        }
        stage("Build"){
            steps{
            echo "Building the code..."
            sh "docker build . -t discord-app"
            }
        }
        stage("Push to DockerHub"){
            steps{
                echo "Pushing the image on the DockerHub..."
                withCredentials([usernamePassword(credentialsId:"dockerHub", passwordVariable:"dockerHubpass",usernameVariable:"dockerHubUser")]){
                    sh "docker tag discord-app ${env.dockerHubUser}/discord-app:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubpass}"
                    sh "docker push ${env.dockerHubUser}/discord-app:latest"
                    echo "Image successfully pushed..."
                }
            }
        }
        stage("Deploying"){
            steps{
                echo "Deploying the Application.."
                sh "docker-compose down && docker-compose up -d"
                echo "Application has been deployed.."
                
            }
            
        }
    }
    
}
