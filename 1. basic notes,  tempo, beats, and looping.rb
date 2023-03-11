use_bpm 60      # tempo

3.times do      # looping 3 times
  
  2.times do
    play 51     # Eb
    sleep 0.5   # whole note
    play 51     # Eb
    sleep 0.45
    play 62     # D4
    sleep 0.35
    play 62     # D4
    sleep 0.3
    play 58     # Bb
    sleep 0.5   # whole note
  end
  
  2.times do
    play 55     # G3
    sleep 0.5   # whole note
    play 55     # G3
    sleep 0.45
    play 62     # D4
    sleep 0.35
    play 62     # D4
    sleep 0.3
    play 58     # Bb
    sleep 0.5   # whole note
  end
  
  play 60       # C4
  sleep 0.1
  sleep 0.25    # 1/16 note rest
  
end

