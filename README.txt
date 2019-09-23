Hi, welcome to my SRE challenge GitHub.

My python code challenge is here in the root directory.
My code for the terraform servers via AWS are in the Linux and Windows folders.

I have made 3 instances on US-East-1 and 1 instance on US-West-2.
54.159.144.192 - Windows server 2019 1 on US east 1 - secured with HTTPS, a self-signed certificate, and HSTS. This server has 	
3389 open so that I can modify it directly if necessary.
54.152.55.89   - Windows server 2019 on US east 1 - secured with HTTPS, a self-signed certificate, and HSTS.
3.230.30.152   - Ubuntu Linux server 1 on US east 1 - does not have HTTPS but was created using a busybox command during initialization.
54.149.237.131 – Ubuntu Linux server 1 on US west 2 - does not have HTTPS but was created using a busybox command during initialization.

For the windows servers I created an instance and set up IIS along with X-Frame-Options, X-Content-Type-Options, X-XSS-Protection, and Strict-Transport-Security custom headers. I also created a self-signed SSL certificate. I then saved this instance as a snapshot. After this I then integrated the snapshot into terraform to be able to re-deploy the snapshot with these configurations already in place. I also used terraform to create AWS policies to only allow ports 80 and 443. In addition to this I used terraform to create and assign an elastic IP to the server.

For the Linux servers I created a partial bash script to create a simple webpage using busybox. I also created security policies in AWS for only the ports 80 and 443 to be accessible. In addition to this I used terraform to create and assign an elastic IP to the server. If I change the terraform apply -var region=us-east-1 to region=us-west-2 it will deploy the Linux server on the server in Oregon.

I also created a tool written in PowerShell (Check-Port.ps1) to check if a port is open or closed, however on a closed port it takes around 30 seconds to return an answer. I utilized NMAP to scan all 65,535 ports of each server to verify that only ports 80, 443, and 3389 were open where applicable.
