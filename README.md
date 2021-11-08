# Auto-Slur Melismas

If you have ever written or transcribed vocal music, you know how important this plugin can be. This plugin will automatically detect melismas, i.e. multiple notes sung on the same syllable, and connect them with a slur, as is common practice in modern vocal notation.

### IMPORTANT NOTES

0. ALWAYS SAVE BEFORE USING THIS PLUGIN.

1. The plugin has NOT been tested with multiple voices on the same staff. Use it ONLY when you have a single voice per staff.

2. The plugin can not process a selected range. It will always process the entire document, automatically recognizing which staves have lyrics.

3. The plugin has an internal variable called `maxMelLength` (maximum melisma length, expressed in number of notes). Melismas longer than `maxMelLength` will be ignored. This is important because slurs on long melismas don't add anything except visual clutter, so they are usually omitted. My personal setting is `maxMelLength = 5`. Please change this variable to adjust to your needs. If you want arbitrarily long melismas, just set `maxMelLength` to a high value.

### KNOWN BUG

The plugin detects tied notes as melismas, so it will add spurious slurs on top of the ties. That is because the plugin simply looks at the next note, and I don't know how to check for the presence of the tie. This issue will likely require you to do some manual cleaning after you run the plugin. 

### PROPOSED IMPROVEMENTS

In order of importance:

- [ ] Fix the tie bug

- [ ] Make the variable `melMaxLength` selectable by the user via graphical interface

- [ ] Add another check to ignore melismas longer than one bar (because even if shorter than `maxMelLength`, long notes will cause excessively long melismas)

- [ ] Just find a more elegant way to implement it...?

If you wish to contribute, please don't hesitate to fork and submit a pull request!

### GENERAL REMARKS

This plugin is a masterclass of how *not* to program properly. It's a workaround of a workaround. But it gets the job done quite well. It is also quite slow: I developed it because I was working on a 90 pages choral work which needed hundreds of slurs. Running the plugin on such large document causes Musescore to freeze for a couple of minutes. Don't panic, it should work. Any improvement that makes the plugin more elegant or more efficient is very welcome. 

### LICENSE

Copyleft (🄯) 2021 Michele Spagnolo

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

<kbd> Vienna, 08/11/2021 | Michele Spagnolo </kbd>
