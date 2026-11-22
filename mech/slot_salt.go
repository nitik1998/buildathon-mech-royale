package mech

import "math/rand"

// Hackermen: per-slot random streams. A listed slot seeds the bot's random numbers with
// hello.seed + 1000003 * salt; slotReseed restarts them from another stream once the bot has made
// a given number of kills, so the match is unchanged up to that kill. Other slots play as the unchanged bot.
var slotSalt = map[int]int64{}

var slotReseed = map[int][][2]int64{11: {{5, 1}}}

var hmSeed0 int64

var hmReseedI int

func (b *Brain) hmReseed() {
	rs := slotReseed[b.Slot]
	for hmReseedI < len(rs) && int64(b.kills) >= rs[hmReseedI][0] {
		b.rng = rand.New(rand.NewSource(hmSeed0 + 1000003*rs[hmReseedI][1] + 7919*rs[hmReseedI][0]))
		hmReseedI++
	}
}
