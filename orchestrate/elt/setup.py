from setuptools import find_packages, setup

if __name__ == "__main__":
    setup(
        name="elt",
        packages=find_packages(exclude=["elt_tests"]),
        install_requires=[
            "dagster",
        ],
        extras_require={"dev": ["dagit", "pytest"]},
    )
