const audio = [
    { name: "apple", file: "apple.ogg", volume: 0.20 },
    { name: "iphone_ping", file: "iphone_ping.ogg", volume: 0.20 },
    { name: "hangup", file: "hangup.ogg", volume: 0.20 },
    { name: "ringtone", file: "ringtone.ogg", volume: 0.20 },
    { name: "radioon", file: "radioon.ogg", volume: 0.20 },
    { name: "radiooff", file: "radiooff.ogg", volume: 0.20 },
    { name: "purge", file: "purge.ogg", volume: 0.20 },
    { name: "gtaloadin", file: "gtaloadin.ogg", volume: 0.20 },
    { name: "drill", file: "drill.ogg", volume: 0.20 },
    { name: "alarm", file: "alarm.ogg", volume: 0.40 },
    { name: "starter", file: "GMTStarter.ogg", volume: 0.40 },
    { name: "supplydrop", file: "supplydrop.ogg", volume: 0.40 },
    {name:"herewegoagain", file:"herewegoagain.ogg", volume: 0.3},
    {name:"elevatormusic", file:"elevatormusic.ogg", volume: 0},
    {name:"tubearriving", file:"tubearriving.ogg", volume: 0.3},
    {name:"tubeleaving", file:"tubeleaving.ogg", volume: 0.3},
    {name:"questcomplete", file:"questcomplete.ogg", volume: 0.3},
    {name:"playMoney", file:"money.ogg", volume: 0.3},
    {name:"playHandcuff", file:"handcuff.ogg", volume: 0.3},
    {name:"playRadioOn", file:"radioon.ogg", volume: 0.1},
    {name:"playRadioOff", file:"radiooff.ogg", volume: 0.1},
    {name:"playRussianRoulette", file:"roulette.ogg", volume: 0.2},
    {name:"playSaw", file:"saw.ogg", volume: 0.3},
    {name:"emptygun", file:"emptygun.ogg", volume: 0.2},
    {name:"playDead", file:"dead.ogg", volume: 0.3},
    {name:"playRingTone", file:"ringtone.ogg", volume: 0.3},
    {name:"playCasinoWin", file:"casino_win.ogg", volume: 0.4},
    {name:"playCasinoLose", file:"casino_lose.ogg", volume: 0.3},
    {name:"knockedtfout", file:"knockedtfout.ogg", volume: 0.9},
    {name:"seatbelt", file:"chime.ogg", volume: 0.3},
    {name:"ring", file:"ring.ogg", volume: 0.3},
    {name:"zipper", file:"zipper.ogg", volume: 0.3},
    {name:"knifeArch", file:"knifearch.ogg", volume: 0.3},
    {name:"jackpotroll", file:"jackpotroll.ogg", volume: 0.3},
    {name:"hangup", file:"hangup.ogg", volume: 0.3},
    {name:"iphone_ping", file:"iphone_ping.ogg", volume: 0.2},
    {name:"breathalyser", file:"breathalyser.ogg", volume: 0.2},
    {name:"car_alarm", file:"caralarm.webm", volume: 0.1},
    {name:"taser", file:"taser.ogg", volume: 0.1},
    {name:"reactivate", file:"reactivate.ogg", volume: 0.15},
    {name:"arcsound", file:"arcsound.ogg", volume: 0.15},
    {name:"metronome", file:"metronome.ogg", volume: 0.15},
    {name:"safeToTouch", file:"safeToTouch.ogg", volume: 0.15},
    {name:"shockAdvisedCharging", file:"shockAdvisedCharging.ogg", volume: 0.35},
    {name:"threeBeeps", file:"threeBeeps.ogg", volume: 0.15},
    {name:"checkPatientAlarm", file:"checkPatientAlarm.ogg", volume: 0.15},
    {name:"analysingHeartRythm", file:"analysingHeartRythm.ogg", volume: 0.15},
    {name:"pushToShock", file:"pushToShock.ogg", volume: 0.25},
    {name:"carryOutShock", file:"carryOutShock.ogg", volume: 0.25},
    {name:"callanambulance", file:"callanambulance.webm", volume: 1.00},
    {name:"headshot", file:"rustheadshotsound.ogg", volume: 1.00},
    {name:"bodyshot", file:"rusthitmarkersound.ogg", volume: 1.00},
    {name:"pilotJobLine1", file:"pilotJobLine1.ogg", volume: 0.80},
    {name:"pilotJobLine2", file:"pilotJobLine2.ogg", volume: 0.80},
    {name:"pilotJobLine3", file:"pilotJobLine3.ogg", volume: 0.80},
    {name:"pilotJobLine4", file:"pilotJobLine4.ogg", volume: 0.80},
    {name:"pilotJobLine5", file:"pilotJobLine5.ogg", volume: 0.80},
    {name:"pilotJobLine6", file:"pilotJobLine6.ogg", volume: 0.80},
    {name:"pilotJobLine7", file:"pilotJobLine7.ogg", volume: 0.80},
    {name:"pilotPullUpAlarm", file:"pilotPullUpAlarm.ogg", volume: 0.50},
    {name:"pilotSeatbelt", file:"pilotSeatbelt.ogg", volume: 0.35},
    {name:"airbag", file:"airbag.ogg", volume: 0.15},
    {name:"ulimitedpower", file:"ulimitedpower.ogg", volume: 0.35},
    {name:"wrathofgod", file:"wrathofgod.webm", volume: 0.35},
    {name:"hackingSuccess", file:"hackingSuccess.ogg", volume: 0.35},
    {name:"hackingFail", file:"hackingFail.ogg", volume: 0.35},
    {name:"hackingIntro", file:"hackingIntro.ogg", volume: 0.35},
    {name:"br-gas", file:"br-gas.ogg", volume: 0.3},
    {name:"whatawonderfulworld", file:"whatawonderfulworld.webm", volume: 0.3},
    {name:"fortnite_death", file:"fortnite_death.webm", volume: 0.3},
    {name:"roblox_death", file:"roblox_death.webm", volume: 0.3},
    {name:"minecraft_death", file:"minecraft_death.webm", volume: 0.3},
    {name:"pacman_death", file:"pacman_death.webm", volume: 0.3},
    {name:"mario_death", file:"mario_death.webm", volume: 0.3},
    {name:"csgo_death", file:"csgo_death.webm", volume: 0.3},
    {name:"MPCT_AKAA_01", file:"MPCT_AKAA_01.webm", volume: 0.3}, //Johnny on the spot!
    {name:"MPCT_AKAA_02", file:"MPCT_AKAA_02.webm", volume: 0.3},
    {name:"MPCT_AKAA_03", file:"MPCT_AKAA_03.webm", volume: 0.3},
    {name:"MPCT_AKAA_04", file:"MPCT_AKAA_04.webm", volume: 0.3},
    {name:"MPCT_AKAA_05", file:"MPCT_AKAA_05.webm", volume: 0.3},
    {name:"MPCT_ALAA_01", file:"MPCT_ALAA_01.webm", volume: 0.3}, //Cant bring car
    {name:"MPCT_ALAA_02", file:"MPCT_ALAA_02.webm", volume: 0.3},
    {name:"MPCT_ALAA_03", file:"MPCT_ALAA_03.webm", volume: 0.3},
    {name:"MPCT_ALAA_04", file:"MPCT_ALAA_04.webm", volume: 0.3},
    {name:"MPCT_ALAA_05", file:"MPCT_ALAA_05.webm", volume: 0.3},
]

var audioPlayer = null;
  
window.addEventListener('message', function (event) {
    if (findAudioToPlay(event.data.transactionType)) {
      let audio = findAudioToPlay(event.data.transactionType)
      if (audioPlayer != null) {
        audioPlayer.pause();
      }
      audioPlayer = new Audio("./sounds/" + audio.file);
      audioPlayer.volume = audio.volume;
      audioPlayer.play();
    }
});
  
function findAudioToPlay(name) {
    for (a of audio) {
      if (a.name == name) {
        return a
      }
    }
    return false
}