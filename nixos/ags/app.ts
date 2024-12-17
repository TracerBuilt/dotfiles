import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widget/Bar";
import NotificationPopups from "./widget/Notifications";
import Launcher from "./widget/Launcher";

App.start({
  css: style,
  instanceName: "astal",
  requestHandler(request, res) {
    print(request);
    res("ok");
  },
  main() {
    App.get_monitors().map(Bar);
    Launcher();
    App.get_monitors().map(NotificationPopups);
  },
});
