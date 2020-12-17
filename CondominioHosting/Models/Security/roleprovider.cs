using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;

namespace CondominioHosting.Models.Security
{
    public class roleprovider : RoleProvider
    {
        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            using (Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext())
            {
                return db.AccesoTables.Select(r => r.AccesNombre).ToArray();
            }
        }

        public override string[] GetRolesForUser(string PersonaCorreo)
        {
            using (Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext())
            {
                var user = db.PersonaTables.SingleOrDefault(u => u.PersonaCorreo == PersonaCorreo);
                if (user == null)
                    return new string[] { };
                return user.RolTable.DetalleRolTables == null ? new string[] { } :
                  user.RolTable.DetalleRolTables.Select(u => u.AccesoTable).Select(u => u.AccesNombre).ToArray();
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string PersonaCorreo, string roleName)
        {
            using (Models.DataBaseCodominiumDataContext db = new Models.DataBaseCodominiumDataContext())
            {
                var user = db.PersonaTables.SingleOrDefault(u => u.PersonaCorreo == PersonaCorreo);
                if (user == null)
                    return false;
                return user.RolTable.DetalleRolTables != null && user.RolTable.DetalleRolTables.Select(
                     u => u.AccesoTable).Any(r => r.AccesNombre == roleName);
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}