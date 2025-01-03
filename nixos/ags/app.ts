import { App } from 'astal/gtk3'
import style from './style.scss'
import Bar from './widgets/Bar'
import Launcher from './widgets/Launcher'
import Notifications from './wdigets/Notifications'

App.start({
	css: style,
	instanceName: 'js',
	requestHandler(request, res) {
		print(request)
		res('ok')
	},
	main() {
		App.get_monitors().map(Bar)
		Launcher
		App.get_monitors().map(Notifications)
	}
})
