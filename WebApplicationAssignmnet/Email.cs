using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace WebApplicationAssignmnet
{
    public class Email
    {
        public bool SendPaymentEmail(string receiver)
        {
            try
            {
                var fromAddress = new MailAddress("tayyartwork@gmail.com", "Tayy Artwork");
                var toAddress = new MailAddress(receiver, "Customer");
                const string fromPassword = "test1234@";
                const string subject = "Payment Successfully";
                const string msg = @"Dear Customer,
Your order already placed. If you faced any problem, welcome to contact to us. 



Thank you.


Best Regards, 
TAYY Art Work";
                ;

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                    Timeout = 20000
                };

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = msg
                })
                {
                    smtp.Send(message);
                };

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public string SendResetEmail(string receiver)
        {
            try
            {
                Random random = new Random();
                string resetNumber = random.Next(0, 1000000).ToString("D6");
                var fromAddress = new MailAddress("tayyartwork@gmail.com", "Tayy Artwork");
                var toAddress = new MailAddress(receiver, "Customer");
                const string fromPassword = "test1234@";
                const string subject = "Reset Password";
                string msg = @"Dear Customer,
Your number is " + resetNumber;
                msg += @"

Thank you.


Best Regards, 
TAYY Art Work";
                ;

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
                    Timeout = 20000
                };

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = msg
                })
                {
                    smtp.Send(message);
                };

                return resetNumber;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}