from dagster import load_assets_from_package_module, repository

from elt import assets


@repository
def elt():
    return [load_assets_from_package_module(assets)]
