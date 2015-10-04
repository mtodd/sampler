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
    return {score: "0"}
