﻿using Klarna.Common.Helpers;
using Klarna.Rest.Models;
using Mediachase.Commerce.Customers;

namespace Klarna.Common.Extensions
{
    public static class CustomerAddressExtensions
    {
        public static Address ToAddress(this CustomerAddress customerAddress)
        {
            var address = new Address
            {
                GivenName = customerAddress.FirstName,
                FamilyName = customerAddress.LastName,
                StreetAddress = customerAddress.Line1,
                StreetAddress2 = customerAddress.Line2,
                PostalCode = customerAddress.PostalCode,
                City = customerAddress.City,
                Email = customerAddress.Email,
                Phone = customerAddress.DaytimePhoneNumber ?? customerAddress.EveningPhoneNumber
            };

            var countryCode = CountryCodeHelper.GetTwoLetterCountryCode(customerAddress.CountryCode);
            address.Country = countryCode;
            if (customerAddress.CountryCode != null && customerAddress.RegionName != null)
            {
                address.Region = CountryCodeHelper.GetStateCode(countryCode, customerAddress.RegionName);
            }

            return address;
        }
    }
}
