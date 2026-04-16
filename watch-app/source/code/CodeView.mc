import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class CodeView extends WatchUi.View {
    var _card;
    var _generator;

    function initialize(card) {
        View.initialize();
        _card = card;
        _generator = new CodeGenerator(_card[:data]);
        _generator.generate();
    }

    function toggleMode() {
        _generator.switchMode();
        _generator.generate();
        WatchUi.requestUpdate();
    }

    function onUpdate(dc as Dc) as Void {
        // Clear screen
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.clear();

        // Draw QR or barcode in black
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);

        _generator.displayCode(dc);
    }
}
