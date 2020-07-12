##
# Project Title
#
# @file
# @version 0.1

clean:
	rm -rf *.egg-info
	rm -rf dist

dist: clean ## builds source and wheel package
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist

testrelease: dist
	python -m twine upload --repository testpypi dist/*

release: dist
	python -m twine upload --repository pypi dist/*


# end

# example 1
# make testrelease
#
# example 2
# make release
