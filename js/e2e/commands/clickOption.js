export function command(option) {
  return this.elements('css selector', 'option', elements => elements[option].mouseButtonClick('left', () => {
    console.log(elements[option], 'clicked')
    })
  )
}