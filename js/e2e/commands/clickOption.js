export function command(option) {
  return this.execute(`document.getElementById("country").options[${option}].selected=true`)
}