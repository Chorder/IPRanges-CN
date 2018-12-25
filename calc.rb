
Dir.new('ranges').each do |f|
  unless f.index('.') == 0
    region = f.split('.')[0]
    range_b_file = File.new("ranges-b/#{region}.txt",'a+')
    range_c_file = File.new("ranges-c/#{region}.txt",'a+')
    #Dir.mkdir("ranges-c/#{region}"
    File.readlines("ranges/#{f}").each do |line|
      start_ip = line.split()[0]
      end_ip = line.split()[1]
      ( start_ip.split('.')[0] .. end_ip.split('.')[0] ).each do |a|
        ( start_ip.split('.')[1] .. end_ip.split('.')[1] ).each do |b|
          range_b = "#{a}.#{b}.0.0/16\n"
          range_b_file.write( range_b )
          (1..255).each do |c|
            range_c = "#{a}.#{b}.#{c}.0/24\n"
            range_c_file.write( range_c )
          end
        end 
      end
    end
    range_b_file.close
    range_c_file.close
  end 
end 
