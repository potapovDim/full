export interface User {
  role: Roles
  username: string
  password: string
  flows?: Array<string>
}

export enum Roles {
  Administrator = 'administrator',
  Artdirector = 'artdirector',
  Marketing = 'marketing',
  Support = 'support',
  Stockmanager = 'stockmanager'
}

export enum LeftMenuAdmin {
  Dashboard = 'Dashboard',
  Users = 'Users',
  Websites = 'Websites',
  // domains
  Domains = 'Domains',
  DomainsList = 'List',
  DomainsSettings = 'Settins',
  DomainsOpensrs = 'Opensrs',
  // concepts
  Concepts = 'Concepts'


}
