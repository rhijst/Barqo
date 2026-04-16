import Toybox.Application;
import Toybox.WatchUi;
import Toybox.Graphics;

class QRMode {
    var _data;
    var _matrix;

    function initialize(data) {
        _data = data;
    }

    function generate() {
        // placeholder QR matrix
        _matrix = [
            [1, 0, 1, 0, 1, 0, 1],
            [0, 1, 0, 1, 0, 1, 0],
            [1, 0, 1, 0, 1, 0, 1],
            [0, 1, 0, 1, 0, 1, 0],
            [1, 0, 1, 0, 1, 0, 1],
            [0, 1, 0, 1, 0, 1, 0],
            [1, 0, 1, 0, 1, 0, 1],
        ];
    }

    function display(dc as Dc) {
        var size = dc.getWidth() - 20;

        if(_matrix == null || _matrix.size() == 0) {
            return;
        }

        var cellSize = size / _matrix.size();

        for (var r = 0; r < _matrix.size(); r++) {
            for (var c = 0; c < _matrix[r].size(); c++) {
                if (_matrix[r][c] == 1) {
                    dc.fillRectangle(
                        10 + c * cellSize,
                        10 + r * cellSize,
                        cellSize,
                        cellSize
                    );
                }
            }
        }
    }
}
