## Expire Signing GPG Keys
```bash
gpg --list-secret-keys # pick key-id to expire
gpg --edit-key <keyid> # follow prompt after entering `expire`
```
In order to expire the sub-key, select it via running `key 1` in the prompt first 

## Shredding
```bash
find . -type f -exec shred {} \
```
