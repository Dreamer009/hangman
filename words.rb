if $words.nil?
  $words = {}
  File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    $words[line.strip] = true
  end
end
