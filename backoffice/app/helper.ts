import { ExpectedConditions as EC, browser, $, $$, ElementFinder } from 'protractor'

export async function waitForElement(element: ElementFinder, time = 1500, message = 'Element does not present') {
  await browser.wait(EC.presenceOf(element), time, message)
}
