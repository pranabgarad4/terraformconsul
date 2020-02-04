###Jenkinsfile###

import groovy.json.JsonOutput
//git env vars
env.git_url = 'https://github.com/pranabgarad4/terraformconsul.git'
env.git_branch = 'master'

//jenkins env vars
env.jenkins_server_url = 'http://pranabmac.gateway.local:8080'
env.jenkins_node_custom_workspace_path = "/opt/jenkins/jenkins_home/${JOB_NAME}/workspace"
env.jenkins_node_label = 'master'


pipeline {
agent {
node {
customWorkspace "$jenkins_node_custom_workspace_path"
label "$jenkins_node_label"
} 
}
stages {
stage('fetch_latest_code') {
steps {
git branch: "$git_branch" ,
url: "$git_url"
}
}

stage('init_and_plan') {
steps {
sh "sudo terraform init $jenkins_node_custom_workspace_path/workspace"
sh "sudo terraform plan $jenkins_node_custom_workspace_path/workspace"
}
}
}
stage('apply_changes') {
steps {
sudo terraform apply $jenkins_node_custom_workspace_path/workspace"
}
}
}