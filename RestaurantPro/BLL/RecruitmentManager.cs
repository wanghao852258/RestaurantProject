﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using DAL;

namespace BLL
{
    public class RecruitmentManager
    {
        private RecruitmentService recruitmentService = new RecruitmentService();
        public int AddPosition(Recruitment recuritment)
        {
            return recruitmentService.AddPosition(recuritment);
        }


        public int ModifyPosition(Recruitment recruitment)
        {
            return recruitmentService.ModifyPosition(recruitment);
        }

        public List<Recruitment> GetAllPostion()
        {
            return recruitmentService.GetAllPostion();
        }


        public int DeletePosition(int postId)
        {

            return recruitmentService.DeletePosition(postId);
        }


        public Recruitment GetPositionById(int postId)
        {

            return recruitmentService.GetPositionById(postId);
        }

    }
}
