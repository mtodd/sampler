#= require jquery
#= require jquery_ujs
#= require ember
#= require ember-data
#= require active-model-adapter
#= require_self
#= require sampler

# for more details see: http://emberjs.com/guides/application/
window.Sampler = Ember.Application.create()

window.Sampler.ApplicationRoute = Ember.Route.extend
  model: ->
    return Ember.$.getJSON("/samples.json")

  afterModel: ->
    this.set('sample', this.modelFor('application'))

  actions:
    didTransition: ->
      Ember.run.scheduleOnce "afterRender", this, ->
        console.log window.studyToken, $('.study-token')
        $('.study-token').html(window.studyToken)
      return true # Bubble the didTransition event

    save: ->
      data =
        score: this.currentModel.score
        notes: this.currentModel.notes
        token: window.studyToken

      ajax = $.post "/samples", data

      ajax.done (data) =>
        this.set('sample.notes', "")
        this.set('sample.score', "0")
        this.set('sample', data)
        $('.default').prop('checked', true).click()

      ajax.fail =>
        console.log "failure", this, arguments
