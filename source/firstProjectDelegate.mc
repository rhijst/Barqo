import Toybox.Lang;
import Toybox.WatchUi;

class firstProjectDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new firstProjectMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}