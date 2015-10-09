window.Sampler.SampleFormComponent = Ember.Component.extend({
  didInsertElement: ->
    $('.study-token').html(window.studyToken)

  actions:
    save: ->
      data =
        score: this.get('sample').score
        notes: this.get('sample').notes
        token: window.studyToken

      ajax = $.post "/samples", data

      ajax.done (data) =>
        this.set('sample.notes', "")
        this.set('sample.score', "0")
        this.set('sample', data)
        $('.default').prop('checked', true).click()

      ajax.fail =>
        console.log "failure", this, arguments
})
