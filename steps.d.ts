/// <reference types='codeceptjs' />
type steps_file = typeof import('./steps_file.js');
type loginPage = typeof import('./tests/pages/loginObject.js');
type dashboardPage = typeof import('./tests/pages/dashboardObject.js');
type inventoryPage = typeof import('./tests/pages/inventoryObject.js');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, loginPage: loginPage, dashboardPage: dashboardPage, inventoryPage: inventoryPage }
  interface Methods extends Playwright {}
  interface I extends ReturnType<steps_file> {}
  namespace Translation {
    interface Actions {}
  }
}
