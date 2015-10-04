window.Sampler.ScoreRadioButtonComponent = Ember.Component.extend({
  attributeBindings: [ "value", "checked:checked:" ]
  click: ->
    $container = this.$()
    $container.siblings().find('label').removeClass('is-checked')
    $container.find('label').addClass('is-checked')
    $radio = $container.find('input').prop('checked', true)
    this.set("selected", $radio.val())
  checked: (->
    return this.get("score") == this.get("selected")
  ).property()
})
