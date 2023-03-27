pat1 = [66,00,66,73,71,00,69,00,68,00,68,68,71,00,69,68,66,00,66,81,80,81,80,81,66,00,66,81,80,81,80,81]
pat2 = [01,00,01,01,01,00,01,00,01,00,01,01,01,00,01,01,01,00,01,01,01,01,01,01,01,00,01,01,01,01,01,01]
pat3 = [69,69,69,69,73,73,73,73,71,71,71,71,76,76,76,76,78,78,78,78,78,78,78,78,78,78,78,78,78,73,71,69]
pat4 = [38,38,50,38,38,38,50,38]
pat5 = [0.75,0.25,0.5,0.5,0.75,0.25,0.5,0.5]

define :seq1 do
  i = 0
  32.times do
    use_synth :square
    play pat1[i], amp: pat2[i], attack: 0, release: 0.25
    sleep 0.5
    i = i + 1
  end
end

define :seq2 do
  i = 0
  32.times do
    use_synth :square
    play pat3[i], amp: 1, attack: 0, release: 0.25
    sample :elec_hi_snare, amp: 0.3, attack_level: 0.5, release: 0.25
    sample :bd_tek, amp: 0.3, attack_level: 0.5, release: 0.25
    sleep 0.5
    i = i + 1
  end
end

define :seq3 do
  i = 0
  x = 0
  8.times do
    use_synth :saw
    play pat4[i]+x, amp: 1, attack: 0, release: 0.25
    sleep pat5[i]
    i = i + 1
  end
  i = 0
  x = 2
  8.times do
    use_synth :saw
    play pat4[i]+x, amp: 1, attack: 0, release: 0.25
    sleep pat5[i]
    i = i + 1
  end
  i = 0
  x = 4
  8.times do
    use_synth :saw
    play pat4[i]+x, amp: 1, attack: 0, release: 0.25
    sleep pat5[i]
    i = i + 1
  end
  i = 0
  x = 4
  8.times do
    use_synth :saw
    play pat4[i]+x, amp: 1, attack: 0, release: 0.25
    sleep pat5[i]
    i = i + 1
  end
end

define :seq4 do
  16.times do
    sample :bd_tek
    sleep 1
    sample :elec_hi_snare, amp: 0.6, attack_level: 0.5
    sample :bd_tek
    sleep 1
  end
end

define :tema do |n|
  n.times do
    seq1
    seq1
    seq1
    seq2
  end
end

define :bass do |n|
  n.times do
    seq3
    seq3
    seq3
    seq3
  end
end

define :kick do |n|
  n.times do
    seq4
    seq4
    seq4
    seq4
  end
end

define :mute do |n|
  n.times do
    sleep 64
  end
end


use_bpm 138
with_fx :reverb do
  in_thread do tema 1; tema 8 end
  in_thread do bass 1; bass 10 end
  in_thread do mute 1; kick 6 end
end

