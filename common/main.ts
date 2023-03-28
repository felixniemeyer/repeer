export interface ID {
  type: string
  value: string
}

export interface Agent {
  id: string, 
  name?: string, 
  ids: ID[], 
  value: number
}

const a = 1; 
export default a; 
