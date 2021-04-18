# Kraken portfolio reporting

## Intro

In this repo, you can find a Python notebook to create some basic crypto portfolio reporting from the Kraken API: both using public and private endpoint. This notebook proposes the following workflow:
- API authentification
- Get data from required endpoints
- Transform data
- Push structured data to GSheets using Google API (please follow [this guide](https://towardsdatascience.com/how-to-integrate-google-sheets-and-jupyter-notebooks-c469309aacea) to connect Jupyter with Google Sheets with Google API)
- Once the data is in Google Sheets, I visualised the required insights in Data Studio

This is just a proposal, once you get the notbook running, feel free to use the data as you like: direct visualisation in the notebook, send to any ottehr DB...

## Authentification

The `kraken.key` is the API key that you will generate from the Kraken UI, I added an example in the repository: private and secret required.

The `google-api-credentials.json` will be needed if you want to connect to the Google Sheets through Google API (see guide above).


## Running Things

All the libraries are listed in the `requirements.txt` file and a Makefile will help you setting up and runnig everything wit the following commands:

- `make install-packages` installs all requirements from the `requirements.txt` file.

- `make update-packages` installs (and updates) requirements from the `requirements.txt` file and then dumps all installed package versions to `requirements.txt.freeze`. 

- `make run-jupyter` runs jupyter notebook server from your virtual environment

- `.venv/bin/python` creates or updates virtualenv


