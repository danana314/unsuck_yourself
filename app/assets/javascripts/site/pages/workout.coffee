class WorkoutProgressBar

  constructor: ->
    @progess_bar = $("[data-behavior='workout_progress']")
    if @progess_bar.length
      @progess_bar.bind('correctAnswerReceived', @correctAnswerUpdate)
      @progess_bar.bind('incorrectAnswerReceived', @incorrectAnswerUpdate)

  correctAnswerUpdate: ->
    console.log 'answer correct'

  incorrectAnswerUpdate: ->
    console.log 'answer incorrect'


$(document).on 'turbolinks:load', ->
  new WorkoutProgressBar
