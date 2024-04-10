import Bar from './widgets/Bar'
import Launcher from './widgets/Launcher'

const scss = `${App.configDir}/styles/global.scss`
const css = `/tmp/global.css`

Utils.exec(`sassc ${scss} ${css}`)

Utils.monitorFile(
	// directory that contains the scss files
	`${App.configDir}/styles`,

	// reload function
	function() {
		// main scss file
		const scss = `${App.configDir}/styles/global.scss`

		// target css file
		const css = `/tmp/global.css`

		// compile, reset, apply
		Utils.exec(`sassc ${scss} ${css}`)
		App.resetCss()
		App.applyCss(css)
	},
)

App.config({
	style: css,
	windows: [Bar(0), Launcher]
})
