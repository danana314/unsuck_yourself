#class CommentThreadParticipationControl
#
#  constructor: ->
#    @ct_participation_control = $("[data-behavior='comment_thread_participation']")
#    if @ct_participation_control.length
#      @setup()
#
#  setup: ->
#    @toggle_button = @ct_participation_control.find("[data-behavior='participation_toggle']")
#    @toggle_button.on 'click', @handleClick
#
#  handleClick: (e) =>
#    @comment_thread_id = @ct_participation_control.data('comment-thread-id')
#    $.ajax(
#      url: "/comment_thread_participant/#{@comment_thread_id}",
#      data
#    )
#
#
#
#$(document).on 'turbolinks:load', ->
#  new CommentThreadParticipationControl
