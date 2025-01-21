import { App } from 'astal/gtk3'
import style from './style.scss'
import Bar from './widgets/Bar'
import Launcher, { LauncherWindowName } from './widgets/Launcher'
import Notifications from './widgets/Notifications'

App.start({
	css: style,
	main() {
		App.get_monitors().map(Bar)
		Launcher()
		App.get_monitors().map(Notifications)
	},
	requestHandler(request: string, res: (response: any) => void) {
		if (request === LauncherWindowName) {
			App.toggle_window(LauncherWindowName)
			res('app launcher toggled')
		} else {
			res('command not found')
		}
	}
})
