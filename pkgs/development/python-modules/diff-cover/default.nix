{ lib
, buildPythonPackage
, chardet
, fetchPypi
, jinja2
, jinja2_pluralize
, pluggy
, pycodestyle
, pyflakes
, pygments
, pylint
, pytest-datadir
, pytest-mock
, pytestCheckHook
, pythonOlder
, tomli
}:

buildPythonPackage rec {
  pname = "diff-cover";
  version = "7.2.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "diff_cover";
    inherit version;
    hash = "sha256-MJvP3bwTZQsSFGIlLz9pZ6wZaBb4uR6WWi4MAroVzJI=";
  };

  propagatedBuildInputs = [
    chardet
    jinja2
    jinja2_pluralize
    pluggy
    pygments
    tomli
  ];

  checkInputs = [
    pycodestyle
    pyflakes
    pylint
    pytest-datadir
    pytest-mock
    pytestCheckHook
  ];

  disabledTests = [
    # Tests check for flake8
    "file_does_not_exist"
    # Comparing console output doesn't work reliable
    "console"
  ];

  pythonImportsCheck = [
    "diff_cover"
  ];

  meta = with lib; {
    description = "Automatically find diff lines that need test coverage";
    homepage = "https://github.com/Bachmann1234/diff-cover";
    changelog = "https://github.com/Bachmann1234/diff_cover/releases/tag/v${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ dzabraev ];
  };
}
