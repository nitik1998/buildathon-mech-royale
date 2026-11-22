package mech

// Hackermen: per-slot random streams. A listed slot seeds the bot's random numbers with
// hello.seed + 1000003 * salt; other slots play as the unchanged bot.
var slotSalt = map[int]int64{6: 1}
