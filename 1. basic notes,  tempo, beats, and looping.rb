use_bpm 60      # tempo

5.times do      # looping 5 times
  
  2.times do
    play 51     # D#3
    sleep 0.4
    play 51     # D#3
    sleep 0.4
    play 62     # D4
    sleep 0.4
    play 62     # D4
    sleep 0.3
    play 58     # A#3
    sleep 0.4
  end
  
  2.times do
    play 55     # G3
    sleep 0.4
    play 55     # G3
    sleep 0.4
    play 62     # D4
    sleep 0.4
    play 62     # D4
    sleep 0.3
    play 58     # A#3
    sleep 0.4
  end
  
  play 60       # c4
  sleep 0.3
  
end

