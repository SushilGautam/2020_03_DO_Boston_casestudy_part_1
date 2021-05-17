pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "sushilgautam/final_flask_image"
        CONTAINER_NAME = "flask_app_project"
    }
    stages {
        stage('Build') {
            steps {
		script {
		     dir('./2020_03_DO_Boston_casestudy_part_1') {
			//  Building new image
			sh 'rm -rf 2020_03_DO_Boston_casestudy_part_1'
			sh 'git clone https://github.com/SushilGautam/2020_03_DO_Boston_casestudy_part_1.git'
			
			// create new repo image
			sh 'docker build -t $DOCKER_HUB_REPO:latest .'
			sh 'docker image tag $DOCKER_HUB_REPO:latest $DOCKER_HUB_REPO:$BUILD_NUMBER'
		     }
                }
	    }
	}
	stage('Publish') {
	    steps {
		//  Pushing Image to Repository
                    sh 'docker login -u "sushilgautam" -p "password"'
                }
                sh 'docker push $DOCKER_HUB_REPO:$BUILD_NUMBER'
                sh 'docker push $DOCKER_HUB_REPO:latest'
                
                echo "Image built and pushed to repository"
            }
        }
        stage('Deploy') {
          steps {
            script{
		// running ansible-playbook
		sh 'ansible-playbook flask_app_cornerstoneproject-playbook.yml'
                }
            }
      
        }
    }
}
