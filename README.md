# Ansible Playbook for Setting up my Home Server

## Usage

- Ansible run machine can be Linux or macOS.
- Copy `.env.dist` to `.env`. Modify the content if necessary.
- Copy `vaults/.vault.password.dist` to `vaults/.vault.password`. Fill with vault password.
- Copy `inventory/.become.password.dist` to `inventory/.become.password`. Fill with become password.
- Copy `inventory/.connect.password.dist` to `inventory/.connect.password`. Fill with SSH password.
- Modify `inventory/01_static_inventory` to add/remove hosts if necessary.
- Modify variables in `group_vars/all.yml` if necessary.
- To list all overriable variables, run `./compile-default-vars.sh` and open `group_vars/_compiled_defaults.yml`
- Run `./install.sh`. If errors occur, retry until errors are gone.
- Run `./ansible-playbook.sh main.yml` to start Ansible Playbook.

## Vaults

- Sensitive data can be stored in encrypted vaults.
- Vault list:
  - `inventory/group_vars/all.yml`
  - `inventory/01_static_inventory`
  - `inventory/host_vars/*.yml`
  - `vaults/vault.yml`
  - `vaults/vault.vagrant.yml`
- To manage vaults, use these commands:

```bash
# view vault content
./ansible-vault.sh view {vault_path}

# decrypt vault content
./ansible-vault.sh decrypt {vault_path}

# encrypt vault content
./ansible-vault.sh encrypt {vault_path}

# change vault password
./ansible-vault.sh rekey {vault_path}

# edit vault content
./ansible-vault.sh edit {vault_path}
```

## Note

`.env`, `vaults/.vault.password`, `inventory/.become.password`, `inventory/.connect.password` contain sensitive data. They MUST NOT be pushed.
