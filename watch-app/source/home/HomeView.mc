import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;

class HomeView extends WatchUi.View {
    var options = ["QR Code", "Barcode"];
    var cards = [
        { :name => "Gym", :data => "773100073684704120" },
        { :name => "Store", :data => "1234567890123" },
    ];
    var selectedIndex = 0;

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        dc.drawText(
            width / 2,
            40,
            Graphics.FONT_MEDIUM,
            "Barqo",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        for (var i = 0; i < cards.size(); i++) {
            if (i == selectedIndex) {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            } else {
                dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_BLACK);
            }

            dc.drawText(
                width / 2,
                height / 2 + i * 50,
                Graphics.FONT_SMALL,
                cards[i][:name],
                Graphics.TEXT_JUSTIFY_CENTER
            );
        }
    }

    function moveUp() {
        if (selectedIndex > 0) {
            selectedIndex--;
            WatchUi.requestUpdate();
        }
    }

    function moveDown() {
        if (selectedIndex < options.size() - 1) {
            selectedIndex++;
            WatchUi.requestUpdate();
        }
    }

    // function getSelected() {
    //     return selectedIndex;
    // }

    function getSelectedCard() {
        return cards[selectedIndex];
    }
}
