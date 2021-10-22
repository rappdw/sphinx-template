# sphinx-template
Sphinx template repo. MyST + other extensions I like

## Usage

1) create a new repo using this one as a template (See [Create from template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template))
2) clone the new repo and cd into that repo
3) Create a virtual environment and install requirements.txt into that environment and activate that environment
4) `./quickstart.sh` and enter values when prompted 
5) `git commit -m "<pitch commit description>"`

Now edit your pitch and use Sphinx to build it

```shell
cd docs
make <html|rinoh|confluence>
```

To publish to confluence, edit `docs/conf.py` and set 
`confluence_publish = True` and then rerunning the sphinx-build

