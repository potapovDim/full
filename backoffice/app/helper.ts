import { ExpectedConditions as EC, browser, $, $$, ElementFinder } from 'protractor'

export async function waitForElement(element: any, time = 1500, message = 'Element does not present') {
  if (Array.isArray(element)) {
    for (const elem of element) {
      // await browser.wait(EC.presenceOf(elem), time)
      await browser.wait(EC.elementToBeClickable(elem), time)
    }
  } else {
    // await browser.wait(EC.presenceOf(element), time)
    await browser.wait(EC.elementToBeClickable(element), time)
  }
}
