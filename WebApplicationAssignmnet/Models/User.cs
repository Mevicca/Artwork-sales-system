﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationAssignmnet.Models
{
    //------------------------------------------------------------------------------
    // <auto-generated>
    //     This code was generated from a template.
    //
    //     Manual changes to this file may cause unexpected behavior in your application.
    //     Manual changes to this file will be overwritten if the code is regenerated.
    // </auto-generated>
    //------------------------------------------------------------------------------

    namespace WebApplicationAssignmnet.Models
    {
        public class User
        {
            //used for mapping the artist and customer
            public int ID { get; set; }
            public string Password { get; set; }
            public string FullName { get; set; }
            public string Email { get; set; }
            public char Gender { get; set; }
            public System.DateTime CreatedAt { get; set; }
            public bool IsActive { get; set; }
        }
    }

}