Jobist.configure do
  queue :discogs, workers: 10, throttle: {1 => 1.second}
  queue :last_fm, workers: 10, throttle: {10 => 1.second}
  queue :index, workers: 10
end
