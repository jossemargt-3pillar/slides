# RKE2 DEV RPMs Demo

---

# Build

- The spec files are from [rke2-packaging](https://github.com/rancher/rke2-packaging)
- Built using _patched_ [rke2-packaging](https://github.com/rancher/rke2-packaging) scripts
- Built on *Alpine* instead of *RHEL*
  - Required to override Alpine [rpm macros locally](https://github.com/rancher/rke2/pull/2542/files#diff-a05679e8c89d2c4cd7ac5cc42e82d80cf3f5d8df4beffc280c426ebd14c4315eR38-R40)
  - Required to extract `sysmted-rpm-macros` [from a RHEL image](https://github.com/rancher/rke2/pull/2542/files#diff-dd2c0eb6ea5cfc6c4bd4eac30934e2d5746747af48fef6da689e85b752f39557R26-R27)

---

# Installation demo

<!-- Run the demo

INSTALL_RKE2_COMMIT="438104d9f792a977bf5e7c04fee2420ede88d0ea" \
INSTALL_RKE2_METHOD="rpm" \
vagrant up --no-provision --provision-with rke2-upload-installer,rke2-install

-->

----

## Requires to explicitly set `rpm` as installation method

```sh
INSTALL_RKE2_COMMIT="438104d9f792a977bf5e7c04fee2420ede88d0ea" \
INSTALL_RKE2_METHOD="rpm" \
./install.sh
```

----

## Skips adding `Rancher RKE2 1.2X` repository

```sh
# stable rpm
$ grep -oP 'name=\K.*' /etc/yum.repos.d/rancher-rke2.repo
Rancher RKE2 Common (stable)
Rancher RKE2 1.22 (stable)
# dev rpm
$ grep -oP 'name=\K.*' /etc/yum.repos.d/rancher-rke2.repo
Rancher RKE2 Common (stable)
```

----

## Installs RKE2 airgap images post rpm installation

```sh
# stable rpm
$ ls /var/lib/rancher/rke2/agent/images
# dev rpm
$ ls /var/lib/rancher/rke2/agent/images
rke2-images.linux-amd64.tar.zst
```

----

## How to verify that RKE2 dev rpm installation worked

```sh
$ systemctl enable --now rke2-server
$ systemctl status rke2-server
[... status ... ]
$ export KUBECONFIG=/etc/rancher/rke2/rke2.yaml
$ /var/lib/rancher/rke2/bin/kubectl get pods -w --all-namespaces
[ ... pods ... ]
```

----

## Details not visible on the demo

- The rpms **are unsigned**
- On SUSE distributions:
  - The rpm fetch process is handled by `zypper` internally for `transactional-update` compatibility
  - A **restart is required** for systems where `transactional-update` is enabled

---

# Questions or concerns?

---

# Thanks
