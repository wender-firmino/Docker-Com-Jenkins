pipeline{
  agent{
    docker{
      image 'openjdk:11'
      args '-v /root/.m2:/root/.m2'
    }
  }
  options{
    skipStagesAfterUnstable()
  }
  stages{
    stage('Build'){
      steps{
        sh 'javac HelloWorld.java && java HelloWorld'
      }
      stage('Results') {
            steps {
                script {
                    def logz = currentBuild.rawBuild.getLog(10000);
                    def result = logz.find { it.contains('Ola mundo') }
                    if (result) {
                        error ('Failing due to ' + result)
                    }
                }
            }
        }
    }
  }
}
