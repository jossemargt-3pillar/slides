# RKE2 DEV RPMs

---

## Summary

- The PR to start doing it within RKE2 CI is going throug *QA verification*
  - <https://github.com/rancher/rke2/pull/2542>
- Target OS
  - Centos7
  - Rocky
  - SLES
- These are **unsigned** to discourage its usage outside development purposes

---

## How to use it once it's merged

```sh
INSTALL_RKE2_COMMIT="fbe4a16ecaea83be45b555c4c520a9828ac7b2b5" \
INSTALL_RKE2_METHOD="rpm" \
./install.sh
```

---

## When dev rpms are made

- Every single commit with a succesfull build
- **Skipped** on TAG and s390x

---

## Implementation details

- CI setup
- New CI steps
- `install.sh` script changes
  
---

## Thanks
