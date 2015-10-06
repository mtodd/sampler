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
    save: ->
      $.post "/samples?score=#{this.currentModel.score}&notes=#{this.currentModel.notes}", (data) =>
        this.set('sample.notes', "")
        this.set('sample.score', "0")
        this.set('sample', data)
        $('.default').prop('checked', true).click()
