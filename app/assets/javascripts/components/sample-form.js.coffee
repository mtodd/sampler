window.Sampler.SampleFormComponent = Ember.Component.extend
  average: Ember.computed "sample.samples.average", ->
    @get("sample.samples.average") || 0

  studyToken: Ember.computed ->
    window.studyToken

  actions:
    save: ->
      data =
        score: @get('sample').score
        notes: @get('sample').notes
        token: window.studyToken

      ajax = $.post "/samples", data

      ajax.done (data) =>
        @set('sample.notes', "")
        @set('sample.score', "0")
        @set('sample', data)
        $('.default').prop('checked', true).click()

      ajax.fail =>
        console.log "failure", this, arguments
