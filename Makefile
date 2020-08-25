setup:
# Create virtual environment for project
python3 -m venv ~/.ericserksnascapstone

source:
#reference virtual venv
. ~/.ericserksnascapstone/bin/activate

install:
#installs dependencies from inside virtualvenv
pip install --upgrade pip &&\
  pip install -r requirements.txt
  
lint:
#lint the Dockerfile
hadolint Dockerfile

all: install lint
