import Toybox.Lang;
import Toybox.WatchUi;

class barqoDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new barqoMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}