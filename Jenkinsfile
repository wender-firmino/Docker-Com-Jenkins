pipeline{
agent{
docker{
image 'openjdk:11'
args '-v /root/.m2:/root/.m2'
}
}
options{
skipStagesAfterUnstable(){
}
stages{
stage('Build'){
steps{
sh 'javac HelloWorld.java && java HelloWorld'

}
}
}
}
