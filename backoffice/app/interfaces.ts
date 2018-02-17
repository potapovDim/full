export interface User {
  role: Roles
  username: string
  password: string
  flows?: Array<string>
}

export enum Roles {
  Admin = 'Admin',
  Administrator = 'administrator',
  Artdirector = 'artdirector',
  Marketing = 'marketing',
  Support = 'support',
  Stockmanager = 'stockmanager'
}

