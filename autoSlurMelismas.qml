//==============================================
//  Auto-slur Melismas
//
//  Copyleft (🄯) 2021 Michele Spagnolo
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//==============================================

import QtQuick 2.0
import MuseScore 3.0

MuseScore {
      menuPath: "Plugins.Auto-Slur Melismas"
      description: "This plugin automatically add slurs to vocal melismas"
      version: "1.0"
      onRun: {
            if (typeof curScore === 'undefined')
                  Qt.quit()
            
            curScore.startCmd()
            
            var maxMelLength = 5 // Change this variable as needed!
            
            var cursor = curScore.newCursor()

            var endTick = curScore.lastSegment.tick+1; // Get the tick to the end of the score
            
            for (var staff = 0; staff < curScore.nstaves; staff++){ // Cycle through all staves
                  
                  var melismaList = [] // For each detected melisma on the current staff, 
				       // the couple (melStart, melLength) will be appended to the array
                  cursor.staffIdx = staff
                  cursor.rewind(0) // Rewind cursor at the beginning of current staff
                  
                  while (cursor.segment && cursor.tick < endTick){
                        if (cursor.element.lyrics.length > 0){ // if there's a syllable then:                         
                              var melStart = cursor.tick                        
                              var melLength = 0
                              cursor.next()
                              while (cursor.segment && cursor.element.type == Element.CHORD  && cursor.element.lyrics.length == 0 && melLength <= maxMelLength){
                                    melLength++
                                    cursor.next()                                    
                              }
                              if (melLength > 0 && melLength < maxMelLength)
                                    melismaList.push([melStart, melLength]) // When the melisma is recognized, it is saved in this array                                                                                                              
                        } else cursor.next()
                  }
                  
                  for (var i=0; i<melismaList.length; i++){ //now let's enter all the slurs on the current staff
                        cursor.rewindToTick(melismaList[i][0]) //cursor goes to start of melismas
                        curScore.selection.select(cursor.element.notes[0]) //select the note
                        for (var j=0; j<melismaList[i][1]; j++)
                              cmd("select-next-chord") //extends the range selection as many times as the length of the melisma (extremely inefficient)
                        cmd("add-slur") // equivalent of the 's' keyboard shortcut
                  }
            }        
            Qt.quit()
            }
      }
