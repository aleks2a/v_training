@ssh
Feature: Test SSH access to remote host

  Scenario: SSH to remote machine and read logs
    Given I open a SSH connection to host "172.17.249.156" with username "jenkins" and password "robotium"
    Then I print all Errors from log file
    Then I close SSH connection