@enigma = Enigma.new
@key = Key.new
@offset = Offset.new
@shift = Shift.new(@key, @offset)
@key.expects(:random_5digits).returns(['1', '0', '2', '4', '7'])
@key.assign_keys
@offset.assign_offsets
@shift.make_shift_keys
