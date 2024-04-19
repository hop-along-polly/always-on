PYTHON_CMD ?= python3
VENV_PYTHON ?= .venv/bin/python
VENV_PIP ?= .venv/bin/pip

.PHONY: clean tests

.venv: requirements.txt
	${PYTHON_CMD} -m venv .venv
	${VENV_PIP} install -r requirements.txt

run:
	uvicorn alwayson.app:app --reload

tests: .venv requirements-dev.txt
	${VENV_PIP} install -r requirements-dev.txt
	${VENV_PYTHON} -m pytest tests/ -s

clean:
	rm -rf .venv
