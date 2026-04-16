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
        var checksum = createChecksum();
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
        var quietZoneUnits = 40;

        // --- 1. Calculate total units
        var totalUnits = 0;

        for (var i = 0; i < _pattern.size(); i++) {
            totalUnits += _pattern[i];
        }

        if (totalUnits == 0) {
            System.println("No data to display");
            return;
        }

        // To much information to display
        if (totalUnits > screenW - quietZoneUnits) {
            System.println("Data too long to display");
            return;
        }

        // --- 2. Decide largest unit width, max 4
        var unitWidth = screenW / totalUnits;

        // --- 3. Barcode height
        var barHeight = (screenH * 0.6).toNumber();
        var y = (screenH - barHeight) / 2;

        // --- 4. Start X (centered)
        var totalWidth = totalUnits * unitWidth;
        var x = (screenW - totalWidth) / 2;

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
        if (code < CODE128_PATTERNS.size()) {
            return CODE128_PATTERNS[code];
        }

        // fallback pattern 0
        System.println("Invalid code: " + code);
        return [2, 1, 2, 2, 2, 2];
    }

    //https://en.wikipedia.org/wiki/Code_128#Check_digit_calculation
    function createChecksum() as Number {
        var checksum = 104; // start value

        // Calculate checksum using weighted sum
        for (var i = 0; i < _data.length(); i++) {
            var char = _data.substring(i, i + 1);
            checksum += charToCode128(char) * (i + 1);
        }

        // get remainder of division by 103
        checksum = checksum % 103;
        return checksum;
    }
}
