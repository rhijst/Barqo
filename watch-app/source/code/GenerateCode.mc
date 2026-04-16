import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

//https://www.qrcode-tiger.com/nl/barcode-types
class CodeGenerator {
    var _mode;
    var _data;

    function initialize(data) {
        _data = data;
        _mode = new QRMode(_data); // default
    }

    function switchMode() {
        if (_mode instanceof QRMode) {
            _mode = new BarcodeMode128(_data);
        } else {
            _mode = new QRMode(_data);
        }
    }

    function setMode(mode as String) {
        if (mode.equals("qr")) {
            _mode = new QRMode(_data);
        } else if (mode.equals("barcode128")) {
            _mode = new BarcodeMode128(_data);
        }
    }

    function generate() {
        _mode.generate();
    }

    function displayCode(dc) {
        _mode.display(dc);
    }
}
