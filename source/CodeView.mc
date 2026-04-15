import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class CodeView extends WatchUi.View {
    var _card;
    var _mode = "qr";

    function initialize(card) {
        View.initialize();
        _card = card;
    }

    function toggleMode() {
        if (_mode.equals("qr")) {
            _mode = "barcode";
        } else {
            _mode = "qr";
        }
        WatchUi.requestUpdate();
    }

    function onUpdate(dc as Dc) as Void {
        // Clear screen
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.clear();

        // ' Draw a black filled rectangle (a square)
        dc.fillRectangle(100, 100, 100, 100); // ' x, y, width, height

        // return;

        // Draw QR or barcode in black
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);

        System.println("Current code type: " + _card[:code]);

        if (_mode.equals("qr")) {
            drawQRCode(dc, 10, 10, dc.getWidth() - 20, _card[:data]);
        } else {
            drawBarcode(
                dc,
                10,
                dc.getHeight() / 2 - 20,
                dc.getWidth() - 20,
                40,
                _card[:data]
            );
        }
    }

    function drawQRCode(
        dc as Dc,
        x as Number,
        y as Number,
        size as Number,
        code as String
    ) as Void {
        // Example: simple placeholder matrix
        var matrix = [
            [1, 0, 1, 0, 1, 0, 1],
            [0, 1, 0, 1, 0, 1, 0],
            [1, 0, 1, 0, 1, 0, 1],
            [0, 1, 0, 1, 0, 1, 0],
            [1, 0, 1, 0, 1, 0, 1],
            [0, 1, 0, 1, 0, 1, 0],
            [1, 0, 1, 0, 1, 0, 1],
        ];

        var cellSize = size / matrix.size();

        for (var row = 0; row < matrix.size(); row += 1) {
            for (var col = 0; col < matrix[row].size(); col += 1) {
                if (matrix[row][col] == 1) {
                    dc.fillRectangle(
                        x + col * cellSize,
                        y + row * cellSize,
                        cellSize,
                        cellSize
                    );
                }
            }
        }
    }

    function drawBarcode(
        dc as Dc,
        x as Number,
        y as Number,
        width as Number,
        height as Number,
        code as String
    ) as Void {
        var barWidth = width / code.length();

        for (var i = 0; i < code.length(); i += 1) {
            if (i % 2 == 0) {
                dc.fillRectangle(x + i * barWidth, y, barWidth, height);
            }
        }
    }
}
