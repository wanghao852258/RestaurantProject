//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------



namespace Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    
    public partial class SysAdmin
    {
        [DisplayName("LoginId")]
        [Required(ErrorMessage ="{0} can not be empty")]
        public int LoginId { get; set; }
        public string LoginName { get; set; }

        [DisplayName("Password")]
        [Required(ErrorMessage ="{0} can not be empty")]
        public string LoginPwd { get; set; }
    }
}
