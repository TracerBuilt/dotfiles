import { clock } from 'lib/variables'
import PanelButton from '../PanelButton'
import options from 'options'

const nth = (d: number) => {
	const j = d % 10,
		k = d % 100
	if (j === 1 && k !== 11) return d + 'st'

	if (j === 2 && k !== 12) return d + 'nd'

	if (j === 3 && k !== 13) return d + 'rd'

	return d + 'th'
}

const { format, action } = options.bar.date
const time = Utils.derive(
	[clock, format],
	(c, f) => c.format(f) + ' ' + nth(c.get_day_of_month()),
)

export default () =>
	PanelButton({
		window: 'datemenu',
		on_clicked: action.bind(),
		child: Widget.Label({
			justification: 'center',
			label: time.bind(),
			class_name: 'date',
		}),
	})
