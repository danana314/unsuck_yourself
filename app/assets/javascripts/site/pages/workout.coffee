class WorkoutProgressBar

  constructor: ->
    @progess_bar = $("[data-behavior='workout_progress']")
    if @progess_bar.length
      @progess_bar.bind('correctAnswerReceived', @correctAnswerUpdate)
      @progess_bar.bind('incorrectAnswerReceived', @incorrectAnswerUpdate)

  correctAnswerUpdate: =>
    @progress_bar_inner = @progess_bar.find('.progress-bar')
    @progress_bar_inner.addClass('bg-success')
    @progress_bar_inner.removeClass('bg-danger')
    @updateWidth()

  incorrectAnswerUpdate: =>
    @progress_bar_inner = @progess_bar.find('.progress-bar')
    @progress_bar_inner.removeClass('bg-success')
    @progress_bar_inner.addClass('bg-danger')
    @updateWidth()

  updateWidth: ->
    @progess_bar = $("[data-behavior='workout_progress']")
    progress = @progess_bar.attr('data-progress')
    @progress_bar_inner = @progess_bar.find('.progress-bar')

    @progress_bar_inner.attr('style', "width:#{progress}%")
    @progress_bar_inner.attr('aria-valuenow', progress)
    @progress_bar_inner.html("#{progress}% there...")

$(document).on 'turbolinks:load', ->
  new WorkoutProgressBar
