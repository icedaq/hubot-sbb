# Description:
#   Get Swiss public transportation info.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot sbb from <from> to <to> - Prints the next connections.
#
# Author:
#   icedaq

module.exports = (robot) ->

  robot.respond /sbb from (.*) to (.*)/i, (msg) ->
    from = msg.match[1]
    to = msg.match[2]

    robot.http("http://transport.opendata.ch/v1/connections?from=#{from}&to=#{to}&limit=3")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        data = JSON.parse body
        apiFrom = data.connections[0].from.station.name
        apiTo = data.connections[0].to.station.name

        message = "#{apiFrom} -> #{apiTo}\n"
        count=1
        for i in data.connections
          departure = new Date(i.from.departure)
          departureFormated = "#{pad(departure.getHours())}:#{pad(departure.getMinutes())}"
          arrival = new Date(i.to.arrival)
          arrivalFormated = "#{pad(arrival.getHours())}:#{pad(arrival.getMinutes())}"
          message += "#{count}. #{departureFormated} - #{arrivalFormated}. Journey: "

          changes = (i.sections.length-1)
          start = i.sections[0].departure.station.name # We start here.
          end = i.sections[changes].arrival.station.name

          trip = " -> "
          if changes >= 1
            for j in [1..changes]
              sDeparture = i.sections[j].departure.station.name
              trip += "#{sDeparture} -> "

          message += "#{start}#{trip}#{end}.\n"
          count++
        msg.reply message.trim()

pad = (n) ->
  ("0" + n).slice(-2)
