#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import setup, find_packages

with open('README.md') as readme_file:
    readme = readme_file.read()

requirements = [ ]

setup_requirements = ['pytest-runner', ]

test_requirements = ['pytest>=3', ]

setup(
    author="msk-access",
    author_email='msk.access@gmail.com',
    python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*, !=3.4.*',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Apache Software License',
        'Natural Language :: English',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.7',
    ],
    description="Central location for CWL CommandLineTools",
    install_requires=requirements,
    license="Apache Software License 2.0",
    long_description=readme + '\n\n',
    include_package_data=True,
    keywords='cwl-commandlinetools',
    name='cwl-commandlinetools',
    packages=find_packages(include=['cwl_commandlinetools', 'cwl_commandlinetools.*']),
    setup_requires=setup_requirements,
    test_suite='tests',
    tests_require=test_requirements,
    url='https://github.com/msk-access/cwl-commandlinetools',
    version='1.2.0',
    zip_safe=False,
)
