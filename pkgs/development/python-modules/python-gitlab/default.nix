{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, argcomplete
, requests
, requests-toolbelt
, pyyaml
}:

buildPythonPackage rec {
  pname = "python-gitlab";
  version = "3.4.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-YYC4HuLyZa2NhBKVahdAtNPOynsori9wff5iN1/tAII=";
  };

  propagatedBuildInputs = [
    argcomplete
    pyyaml
    requests
    requests-toolbelt
  ];

  # tests rely on a gitlab instance on a local docker setup
  doCheck = false;

  pythonImportsCheck = [
    "gitlab"
  ];

  meta = with lib; {
    description = "Interact with GitLab API";
    homepage = "https://github.com/python-gitlab/python-gitlab";
    license = licenses.lgpl3;
    maintainers = with maintainers; [ nyanloutre ];
  };
}
