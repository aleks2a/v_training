@ssh
Feature: Test SSH access to remote host

  Scenario: SSH to remote machine and read logs
    Given I open a SSH connection to host "172.17.251.213" with username "bayqa" and password "password01"
#    Then I print all Errors from log file
    Then I close SSH connection