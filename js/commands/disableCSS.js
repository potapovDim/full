const disableTransition = (selector) => {
  const style = document.createElement('style')
  style.type = 'text/css'
  style.innerHTML = `div,span,p,ul,ol,li, nav, section {
    -webkit-transition: none !important;
    -moz-transition: none !important;
    -o-transition: none !important;
    -ms-transition: none !important;
    transition: none !important;
    transition: none !important;
    animation-name: none !important;
    background-image: none !important;
    background: none !important;
    }
    '*:before { background: none !important; }`
  document.getElementsByTagName(selector)[0].appendChild(style)
}

module.exports = function command () {
  console.log('dlksjaljdlkasjdljaskdljklsajld')
  return this.execute(disableTransition, ['head'])
}