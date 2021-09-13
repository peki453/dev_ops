# How to run playbook on the remote machine?

To run Ansible playbook on hosts use `ansible-playbook -i inventory/ install_docker.yml`.

Legend:
- `install_docker.yml`<br>
playbook
- `inventory`<br>
folder with dynamic inventory configuration

<br>

# How to run ansible linter?

To run ansimble linter use following commands:

- `sh`
- `sudo apt install ansible-lint`
- `cd ansible`
- `ansible-lint .`