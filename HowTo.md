#### Some notes on how to deploy this
Followed this tutorial https://packaging.python.org/en/latest/tutorials/packaging-projects/
The pwd is on my google
Dont forget to update the version number in pyproject.toml -- currently is 0.0.2
And to change the testpipy to pipy in the twine upload
And to skip existing versions with
python3 -m twine upload --skip-existing --repository pypi dist/*

Steps 
1. Change version in pyproject.toml
2. Build with
   1.  python3 -m build
3. deploy with
   1. python3 -m twine upload --skip-existing --repository pypi dist/*
``

## Webpage
Following this tutorial https://docs.readthedocs.io/en/stable/tutorial/
Sign with Github
To build locally
   sphinx-build -a docs/source/ docs/build