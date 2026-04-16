import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Graphics;

// https://en.wikipedia.org/wiki/Code_128
class BarcodeMode128 {
    var _data;
    var _pattern;
    var CODE128_PATTERNS;

    function initialize(data) {
        _data = data;
        CODE128_PATTERNS = Code128Patterns.TABLE;
    }

    function generate() {
        var codes = [];

        // START B = 104
        codes.add(104);

        // Encode data
        for (var i = 0; i < _data.length(); i++) {
            var c = _data.substring(i, i + 1);
            codes.add(charToCode128(c));
        }

        // CHECKSUM
        var checksum = 104; // start value

        for (var i = 0; i < _data.length(); i++) {
            checksum += charToCode128(_data.substring(i, i + 1)) * (i + 1);
        }

        checksum = checksum % 103;
        codes.add(checksum);

        // STOP = 106
        codes.add(106);

        // Convert to pattern
        _pattern = [];

        for (var i = 0; i < codes.size(); i++) {
            var code = codes[i];
            var pattern = getPattern(code);
            _pattern.addAll(pattern);
        }
    }

    function display(dc as Dc) {
        var screenW = dc.getWidth();
        var screenH = dc.getHeight();

        var quietZoneUnits = 20;

        // --- 1. Calculate total units (barcode + quiet zones)
        var totalUnits = quietZoneUnits * 2;

        for (var i = 0; i < _pattern.size(); i++) {
            totalUnits += _pattern[i];
        }

        // --- 2. Decide largest unit width
        var unitWidth = screenW / totalUnits;

        // --- 3. Barcode height
        var barHeight = (screenH * 0.6).toNumber();
        var y = (screenH - barHeight) / 2;

        // --- 4. Start X
        var x = quietZoneUnits * unitWidth;

        var currentX = x;
        var isBar = true;

        // --- 5. Draw barcode
        for (var i = 0; i < _pattern.size(); i++) {
            var w = _pattern[i] * unitWidth;

            if (isBar) {
                dc.fillRectangle(
                    currentX.toNumber(),
                    y.toNumber(),
                    w.toNumber(),
                    barHeight.toNumber()
                );
            }

            currentX += w;
            isBar = !isBar;
        }
    }
    private function charToCode128(char as String) as Number {
        var c = char.toCharArray()[0];
        var value = c.toNumber();

        // Code 128-B supports ASCII 32–127
        if (value < 32 || value > 127) {
            System.println("Unsupported char: " + char);
            return 0;
        }

        return value - 32;
    }

    function getPattern(code as Number) {
        // Minimal fallback (you MUST expand later)
        if (code < CODE128_PATTERNS.size()) {
            return CODE128_PATTERNS[code];
        }

        // fallback pattern (temporary)
        return [2, 1, 2, 2, 2, 2];
    }
}
