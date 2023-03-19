---
- name: Allow access by public IP
  hosts: localhost
  become: no
  gather_facts: no
  tasks:
      - name: Configure option in k8s-cluster.yml
        replace:
          path: ../kubespray/inventory/diplomcluster/group_vars/k8s_cluster/k8s-cluster.yml
          regexp: '^.*supplementary_addresses_in_ssl_keys:.*'
          replace: "supplementary_addresses_in_ssl_keys: [127.0.0.1, {{ hostvars[\"diplom-control-${workspace}-0\"][\"ansible_host\"] }}]"