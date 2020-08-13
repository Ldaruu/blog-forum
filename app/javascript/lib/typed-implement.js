const { default: Typed } = require("./typed")

const ready = () => {
  let text = new Typed(
    '.element',{
      strings:[
        " Software development should not be a secret process." ,
        "When I take on a new project I make it my goal to not only deliver a well crafted product but to also ensure that each stage of the process is fully communicated."
      ],
      typeSpeed: 60,
      loop:true,
      backDelay: 1000,
      cursorChar: '💾'
    }
  )
  console.log(text)
  return text
}

$('document').ready( () => {
  $('document').on('turbolinks:load', ready())
})