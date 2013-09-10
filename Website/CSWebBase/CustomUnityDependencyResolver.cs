﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSBusiness.Resolver;
using CSBusiness.Discount;
using Microsoft.Practices.Unity;

namespace CSWebBase
{
    public class CustomUnityDependencyResolver : UnityDependencyResolver
    {
        protected override void ConfigureContainer(Microsoft.Practices.Unity.IUnityContainer container)
        {
            base.ConfigureContainer(container);

            container.RegisterType<IDiscountCalculator, CustomDiscountCalculator>(new InjectionFactory(x =>
            {
                return new CustomDiscountCalculator();
            }));

        }
    }
}
