$ ->
	# $("#camera").webcam({
	# 	width: 320
	# 	height: 240
	# 	mode: "callback"
	# 	swffile: "/jscam.swf"
	# 	onCapture: ->
	# 		webcam.save("/api/photos/upload")
	# 	onSave: (data) ->
	# 		col = data.split(";")
	# 		img = image
	# 		for i in [0...320]
	# 			tmp = parseInt(col[i])
	# 			img.data[pos + 0] = (tmp >> 16) & 0xff
	# 			img.data[pos + 1] = (tmp >> 8) & 0xff
	# 			img.data[pos + 2] = tmp & 0xff
	# 			img.data[pos + 3] = 0xff
	# 			pos+= 4

	# 		if (pos >= 4 * 320 * 240)
	# 			#ctx.putImageData(img, 0, 0)
	# 			pos = 0
	# })
	