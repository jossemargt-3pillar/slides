# RKE2 DEV RPMs

---

## Summary

- We need RKE2 rpms built from commits on a similar fashion as the existing commit `tar.gz`
- The PR to start doing it within RKE2 CI is up and open for discussion
  - <https://github.com/rancher/rke2/pull/2542>

---

# Highlights

----

## Same yet built different

- Follows the spec files in [rke2-packaging](https://github.com/rancher/rke2-packaging)
- Built using a patched version of the [rke2-packaging](https://github.com/rancher/rke2-packaging) scripts
- Built on *Alpine* instead of *RHEL*
  - Required to override Alpine rpm macros locally
  - Required to extract `sysmted-rpm-macros` from a RHEL image
- Purposely unsigned to discorage its usage outside of Development and QA

----

## Installation

- rpm install works as expected
- rke2 airgap images are fetched and installed post rpm installation
- On SLES the fetch process is handled by `zypper`
  - This was required for `transactional-update` compatibility

---

# A couple of questions

----

- Is it ok to use **rke2-ci-builds** GCS bucket?
  - For object TTL and retention policies verification, with whom should I follow up?
- Since we are packaging built binaries, have we consider having a single generic rpm?
- Why do we create SRPMS when no source code is on it?

---

# Questions or concerns?

---

# Thanks
