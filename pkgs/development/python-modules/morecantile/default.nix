{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  pythonOlder,

  attrs,
  click,
  flit,
  mercantile,
  pydantic,
  pyproj,
  rasterio,
}:

buildPythonPackage rec {
  pname = "morecantile";
  version = "5.4.2";
  pyproject = true;
  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "developmentseed";
    repo = "morecantile";
    rev = version;
    hash = "sha256-kUAde+6IUu95tFHFCB6kWoYsRf9GxR+gRJki/tvhIaY=";
  };

  nativeBuildInputs = [ flit ];

  propagatedBuildInputs = [
    attrs
    click
    pydantic
    pyproj
  ];

  nativeCheckInputs = [
    mercantile
    pytestCheckHook
    rasterio
  ];

  pythonImportsCheck = [ "morecantile" ];

  meta = {
    description = "Construct and use map tile grids in different projection";
    homepage = "https://developmentseed.org/morecantile/";
    license = lib.licenses.mit;
    maintainers = lib.teams.geospatial.members;
    mainProgram = "morecantile";
  };
}
