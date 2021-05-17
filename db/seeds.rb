# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Regular", description: "Regular: Puede leer información"})
r2 = Role.create({name: "Promoter", description: "Promotor: ingresa información diaria en punto de venta"})
r3 = Role.create({name: "Merchandizer", description: "Mercaderista: el que hace visita diaria a todos los puntos para ver que todo el material este bien y mesas organizadas, dicta capacitaciones y eventos en punto de venta. Aclara dudas a los clientes y da explicaciones al cliente o consultores del punto de venta."})
r4 = Role.create({name: "Supervisor", description: "Supervisor: es el jefe de los merchandiser y supervisor. Y pueden tener contacto con los coordinadores de los puntos de venta."})
r5 = Role.create({name: "AdminAccount", description: "Administrador de Cuenta: Es de consulta. Es encargado de las cuentas que estén a cargo."})
r6 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

#u1 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})

u21 = User.create({name: "ANDREA KATHERINE TORRES SALAZAR", email: "andrea-torres@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u22 = User.create({name: "ANGIE PAOLA GARCIA JUAGIBIOY", email: "angie-garcia@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u23 = User.create({name: "BRANDON ESNEYDER MESA VALENCIA", email: "albeiro-ortiz@accionplus.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u24 = User.create({name: "CARLOS WILFREDO GARZON MOLANO", email: "carlos-garzon@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u25 = User.create({name: "JOANA PATRICIA AVILA MORATO", email: "joana-avila@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u26 = User.create({name: "JOHN  ALEXANDER ACERO MORAD", email: "john-acero@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u28 = User.create({name: "JOHN HENRY JIMENEZ VEGA", email: "john-jimenez@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u29 = User.create({name: "MAURICIO CARABALLO RUBIO", email: "mauricio-caraballo@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u2a = User.create({name: "SANDRA GERALDINE CAMACHO GUERRERO", email: "sandra-camacho@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u2b = User.create({name: "VICTOR JULIO LOPEZ AVELLANEDA", email: "victor-lopez@accionbpo.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})



#u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
#u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r4.id})
#u5 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r5.id})
u6 = User.create({name: "Marleida", email: "marleida-fragozo@accionplus.com", password: "12345678", password_confirmation: "12345678", role_id: r6.id})
