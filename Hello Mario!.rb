use_bpm 100
use_synth :pulse
use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6

_ = nil

define :structure do |i,a,b,c,d|
  1.times { i.call }
  loop do
    2.times { a.call }
    2.times { b.call }
    1.times { c.call }
    2.times { a.call }
    2.times { d.call }
    1.times { c.call }
    1.times { d.call }
  end
end

in_thread do
  intro = -> { play_pattern_timed([:e5,:e5,_,:e5,_,:c5,:e5,_,
                                   :g5,_,_,_,_,_,_,_], [0.25]) }
  theme_a = -> {
    play_pattern_timed([:c5,_,_,:g4,_,_,:e4,_,
                        _,:a4,_,:b4,_,:Bb4,:a4,_], [0.25])
    play_pattern_timed([:g4,:e5,:g5], [1/3.0])
    play_pattern_timed([:a5,_,:f5,:g5,
                        _,:e5,_,:c5,
                        :d5,:b4,_,_], [0.25]) }
  theme_b = -> {
    play_pattern_timed([_,_,:g5,:fs5,:f5,:ds5,_,:e5,
                        _,:gs4,:a4,:c5,_,:a4,:c5,:d5,
                        _,_,:g5,:fs5,:f5,:ds5,_,:e5,
                        _,:c6,_,:c6,:c6,_,_,_,
                        _,_,:g5,:fs5,:f5,:ds5,_,:e5,
                        _,:gs4,:a4,:c5,_,:a4,:c5,:d5,
                        _,_,:ds5,_,_,:d5,_,_,
                        :c5,_,_,_,_,_,_,_], [0.25]) }
  theme_c = -> {
    play_pattern_timed([:c5,:c5,_,:c5,_,:c5,:d5,_,
                        :e5,:c5,_,:a4,:g4,_,_,_,
                        :c5,:c5,_,:c5,_,:c5,:d5,:e5,
                        _,_,_,_,_,_,_,_,
                        :c5,:c5,_,:c5,_,:c5,:d5,_,
                        :e5,:c5,_,:a4,:g4,_,_,_,
                        :e5,:e5,_,:e5,_,:c5,:e5,_,
                        :g5,_,_,_,_,_,_,_], [0.25]) }
  theme_d = -> {
    play_pattern_timed([:e5,:c5,_,:g4,_,_,:gs4,_,
                        :a4,:f5,_,:f5,:a4,_,_,_], [0.25])
    play_pattern_timed([:b4,:a5,:a5,
                        :a5,:g5,:f5], [1/3.0])
    play_pattern_timed([:e5,:c5,_,:a4,:g4,_,_,_], [0.25])
    play_pattern_timed([:e5,:c5,_,:g4,_,_,:gs4,_,
                        :a4,:f5,_,:f5,:a4,_,_,_,
                        :b4,:f5,_,:f5], [0.25])
    play_pattern_timed([:f5,:e5,:d5], [1/3.0])
  play_pattern_timed([:g5,:e5,_,:e5,:c5,_,_,_], [0.25]) }
  
  structure(intro, theme_a, theme_b, theme_c, theme_d)
end

in_thread do
  intro = -> { play_pattern_timed([:fs4,:fs4,_,:fs4,_,:fs4,:fs4,_,
                                   :b4,_,_,_,:g4,_,_,_], [0.25]) }
  theme_a = -> {
    play_pattern_timed([:e4,_,_,:c4,_,_,:g3,_,
                        _,:c4,_,:d4,_,:Db4,:c4,_], [0.25])
    play_pattern_timed([:c4,:g4,:b4], [1/3.0])
    play_pattern_timed([:c5,_,:a4,:b4,
                        _,:a4,_,:e4,
                        :f4,:d4,_,_], [0.25]) }
  theme_b = -> {
    play_pattern_timed([_,_,:e5,:ds5,:d5,:b4,_,:c5,
                        _,:e4,:f4,:g4,_,:c4,:e4,:f4,
                        _,_,:e5,:ds5,:d5,:b4,_,:c5,
                        _,:f5,_,:f5,:f5,_,_,_,
                        _,_,:e5,:ds5,:d5,:b4,_,:c5,
                        _,:e4,:f4,:g4,_,:c4,:e4,:f4,
                        _,_,:gs4,_,_,:f4,_,_,
                        :e4,_,_,_,_,_,_,_], [0.25]) }
  theme_c = -> {
    play_pattern_timed([:gs4,:gs4,_,:gs4,_,:gs4,:as4,_,
                        :g4,:e4,_,:e4,:c4,_,_,_,
                        :gs4,:gs4,_,:gs4,_,:gs4,:as4,:g4,
                        _,_,_,_,_,_,_,_,
                        :gs4,:gs4,_,:gs4,_,:gs4,:as4,_,
                        :g4,:e4,_,:e4,:c4,_,_,_,
                        :fs4,:fs4,_,:fs4,_,:fs4,:fs4,_,
                        :b4,_,_,_,:g4,_,_,_], [0.25]) }
  theme_d = -> {
    play_pattern_timed([:c5,:a4,_,:e4,_,_,:e4,_,
                        :f4,:c5,_,:c5,:f4,_,_,_], [0.25])
    play_pattern_timed([:g4,:f5,:f5,
                        :f5,:e5,:d5], [1/3.0])
    play_pattern_timed([:c5,:a4,_,:f4,:e4,_,_,_], [0.25])
    play_pattern_timed([:c5,:a4,_,:e4,_,_,:e4,_,
                        :f4,:c5,_,:c5,:f4,_,_,_,
                        :g4,:d5,_,:d5], [0.25])
    play_pattern_timed([:d5,:c5,:b4], [1/3.0])
  play_pattern_timed([:c5,_,_,_,_,_,_,_], [0.25]) }
  
  structure(intro, theme_a, theme_b, theme_c, theme_d)
end

in_thread do
  use_synth :tri
  use_synth_defaults attack: 0, sustain: 0.1, decay: 0.1, release: 0.1, amp: 0.4
  
  intro = -> { play_pattern_timed([:D4,:D4,_,:D4,_,:D4,:D4,_,
                                   :G3,_,_,_,:G4,_,_,_], [0.25]) }
  theme_a = -> {
    play_pattern_timed([:G4,_,_,:E4,_,_,:C4,_,
                        _,:F4,_,:G4,_,:Gb4,:F4,_], [0.25])
    play_pattern_timed([:E4,:C4,:E4], [1/3.0])
    play_pattern_timed([:F4,_,:D4,:E4,
                        _,:C4,_,:A3,
                        :B3,:G3,_,_], [0.25]) }
  theme_b = -> {
    play_pattern_timed([:C3,_,_,:G3,_,_,:C3,_,
                        :F3,_,_,:C3,:C3,_,:F3,_,
                        :C3,_,_,:E3,_,_,:G3,:C3,
                        _,:G2,_,:G2,:G2,_,:G4,_,
                        :C3,_,_,:G3,_,_,:C3,_,
                        :F3,_,_,:C3,:C3,_,:F3,_,
                        :C3,_,:Ab3,_,_,:Bb3,_,_,
                        :C3,_,_,:G2,:G2,_,:C3,_], [0.25]) }
  theme_c = -> {
    3.times {
      play_pattern_timed([:gs4,_,_,:ds4,_,_,:gs4,_,
                          :g4,_,_,:c4,_,_,:g4,_], [0.25])
    }
    play_pattern_timed([:D4,:D4,_,:D4,_,:D4,:D4,_,
                        :G3,_,_,_,:G4,_,_,_], [0.25]) }
  theme_d = -> {
    play_pattern_timed([:C3,_,_,:fs3,:g3,_,:C3,_,
                        :F3,_,:F3,_,:C3,:C3,:F3,_,
                        :D3,_,_,:F3,:G3,_,:B3,_,
                        :G3,_,:G3,_,:C3,:C3,:G3,_,
                        :C3,_,_,:fs3,:g3,_,:C3,_,
                        :F3,_,:F3,_,:C3,:C3,:F3,_,
                        :G3,_,_,:G3], [0.25])
    play_pattern_timed([:G3,:A3,:B3], [1/3.0])
    play_pattern_timed([:C4,_,:G3,_,:C4,_,_,_], [0.25])
  }
  
  structure(intro, theme_a, theme_b, theme_c, theme_d)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  
  ll = -> { play :a, sustain: 0.1; sleep 0.75 }
  l = -> { play :a, sustain: 0.1; sleep 0.5 }
  s = -> { play :a; sleep 0.25 }
  
  define :drum_pattern_a do
    [l,s,l,s,l,ll,l,s,s,s].map(&:call)
  end
  
  define :drum_pattern_b do
    play :b
    sleep 0.5
    play :a6
    sleep 0.3
    play :a7
    sleep 0.2
    play :a, sustain: 0.1
    sleep 0.5
    play :a6
    sleep 0.3
    play :a7
    sleep 0.2
  end
  
  define :drum_pattern_c do
    [ll,s,l,l].map(&:call)
  end
  
  with_fx :level, amp: 0.5 do
    1.times  { drum_pattern_a }
    loop do
      24.times { drum_pattern_b }
      4.times  { drum_pattern_a }
      8.times  { drum_pattern_b }
      16.times { drum_pattern_c }
      4.times  { drum_pattern_a }
      8.times  { drum_pattern_b }
    end
  end
end
