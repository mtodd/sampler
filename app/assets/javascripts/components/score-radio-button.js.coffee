window.Sampler.ScoreRadioButtonComponent = Ember.Component.extend({
  attributeBindings: [ "value", "checked:checked:" ]
  click: ->
    this.set("selected", this.$().find('input').prop('checked', true).val())
  checked: (->
    return this.get("score") == this.get("selected")
  ).property()
})
