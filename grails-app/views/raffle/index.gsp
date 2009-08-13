<%--
  Created by IntelliJ IDEA.
  User: mstine
  Date: Aug 10, 2009
  Time: 8:37:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Raffle</title>
  <style type="text/css" media="screen">
  .person {
    width: 300px;
    height: 25px;
    border: 1px solid #999;
    padding: 10px;
    font-family: Arial, "MS Trebuchet", sans-serif;
    color: #000;
  }

  .winner {
    background: yellow;
  }

  #slotMachine {
    background: url("${resource(dir:'images/winners', file:'mask.png')}") no-repeat top center;
    width: 100%;
    padding: 0;
  }

  #theWheel {
    width: 320px;
    margin: 0 auto 0 auto;
    padding: 40px 0 15px 0;
  }

  #p1 {
    background: #e0e0e0 url("${resource(dir:'images/winners', file:'p1.png')}") repeat-x bottom left;
    text-align: center;
    font-size: 8pt;
  }

  #p2 {
    background: #f0f0f0 url("${resource(dir:'images/winners', file:'p2.png')}") repeat-x top left;
    text-align: center;
    font-size: 10pt;
  }

  #p3 {
    text-align: center;
    font-size: 12pt;
  }

  #p4 {
    background: #f0f0f0 url("${resource(dir:'images/winners', file:'p4.png')}") repeat-x bottom left;
    text-align: center;
    font-size: 10pt;
  }

  #p5 {
    background: #f0f0f0 url("${resource(dir:'images/winners', file:'p5.png')}") repeat-x top left;
    text-align: center;
    font-size: 8pt;
  }

  </style>
  <g:javascript library="scriptaculous"/>
  <script type="text/javascript" charset="utf-8">
    var eventId = ${event?.id};
    var people = new Array();
    var intervalId;

    function doShift() {
      var firstPerson = people.shift();
      people[people.size()] = firstPerson;
      updateDivs();

      if (people[2].raffleWinner == true) {
        clearInterval(intervalId);
        $('p3').addClassName('winner');
        new Effect.Pulsate('p3', {from: 0.6, pulses: 8, afterFinish: function() {
          $('winnersList').childElements().each(function(item) {
            item.remove();
          })

          new Ajax.Request('<g:createLink controller="raffle" action="listWinners" id="${event.id}"/>', {onSuccess: function(transport) {
            var results = eval('(' + transport.responseText + ')');
            results.winners.each(function(winner) {
              Element.insert($('winnersList'), new Element('li', {'id':'winner' + winner.id}).update(winner.firstName + ' ' + winner.lastName + '  [<a href="#" onclick="deleteWinner(' + winner.id + ', \'winner' + winner.id + '\'); return false;">X</a>]'));
            });
          }});
        }});
      }
    }

    function updateDivs() {
      $('p1').innerHTML = people[0].firstName + ' ' + people[0].lastName;
      $('p2').innerHTML = people[1].firstName + ' ' + people[1].lastName;
      $('p3').innerHTML = people[2].firstName + ' ' + people[2].lastName;
      $('p4').innerHTML = people[3].firstName + ' ' + people[3].lastName;
      $('p5').innerHTML = people[4].firstName + ' ' + people[4].lastName;
    }

    function chooseWinner() {
      $('p3').removeClassName('winner');

      new Ajax.Request('<g:createLink controller="raffle" action="pickWinner" id="${event.id}"/>', {onSuccess: function(transport) {
        var results = eval('(' + transport.responseText + ')');
        people = results.nonWinners;
        updateDivs();
        intervalId = setInterval(doShift, 500);
      }});
    }

    function deleteWinner(id, domId) {
      Effect.SwitchOff(domId);
      new Ajax.Request('<g:createLink controller="raffle" action="deleteWinner"/>/'+id);
    }
  </script>
</head>
<body>
<h1>Prize drawing for <g:formatDate date="${event?.startTime}" format="MM-dd-yyyy"/></h1>
<div class="secondaryMenu">
  <g:link controller="event" action="show" id="${event.id}">Back to Event</g:link>
</div>
<br/>
<div id="slotMachine">
  <div id="theWheel">
    <div id="p1"
            class="person">${nonWinningParticipants[0]?.user?.firstName} ${nonWinningParticipants[0]?.user?.lastName}</div>
    <div id="p2"
            class="person">${nonWinningParticipants[1]?.user?.firstName} ${nonWinningParticipants[1]?.user?.lastName}</div>
    <div id="p3"
            class="person">${nonWinningParticipants[2]?.user?.firstName} ${nonWinningParticipants[2]?.user?.lastName}</div>
    <div id="p4"
            class="person">${nonWinningParticipants[3]?.user?.firstName} ${nonWinningParticipants[3]?.user?.lastName}</div>
    <div id="p5"
            class="person">${nonWinningParticipants[4]?.user?.firstName} ${nonWinningParticipants[4]?.user?.lastName}</div>
  </div>
  <p style="text-align: center; padding-bottom: 35px;">
    <input type="button" value="Spin the Wheel" onclick="chooseWinner()"/>
  </p>
</div>
<h2>Winners:</h2>
<ul id="winnersList">
  <g:each var="participant" in="${winningParticipants}">
    <li id="winner${participant?.user?.id}">${participant?.user?.firstName} ${participant?.user?.lastName} [<a href="#" onclick="deleteWinner(${participant?.user?.id}, 'winner${participant?.user?.id}');
    return false;">X</a>]</li>
  </g:each>
</ul>
</body>
</html>