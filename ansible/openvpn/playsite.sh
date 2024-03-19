# NOTE: Ansible Vault is used only to avoid putting secrets into code base. vault-password-file should NOT be checked into code.
ansible-playbook site.yml --vault-password-file ~/crypt/keys/aws/frankfurt-admin-a.pem -v -e@vault.yml
