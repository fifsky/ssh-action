# Remote SSH Commands

Simple GitHub Action to run a command on a remote server using SSH. This is working with the latest [GitHub Actions](https://github.com/features/actions).

**⚠️Only support private key**

## ✨ Example Usage

**Example using OpenSSH private key**

```yml
- name: ls -a via ssh
  uses: fifsky/ssh-action@release
  with:
    command: |
      cd /tmp &&
      ls -a
    host: ${{ secrets.HOST }}
    user: root
    key: ${{ secrets.PRIVATE_KEY}}
```

🔐 Set your secrets here: `https://github.com/USERNAME/REPO/settings/secrets`.

Check out [the workflow example](.github/workflows/workflow.yml) for a minimalistic yaml workflow in GitHub Actions.

**Result**

![result of example ssh workflow](result.png)

## Options

- **host** - _string_ - Hostname or IP address of the server. **Default:** `'localhost'`

- **port** - _integer_ - Port number of the server. **Default:** `22`

- **user** - _string_ - Username for authentication. **Default:** (root)

- **password** - _string_ - Password for password-based user authentication. **Default:** (none)

- **key** - _string_ - Required, that contains a private key for either key-based or hostbased user authentication (OpenSSH format). **Default:** (none)


## Thanks

Documentation and parameters design from:
https://github.com/garygrossgarten/github-action-ssh