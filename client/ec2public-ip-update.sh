#script to update the ec2 instance public ip dynamically.

PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
export PUBLIC_IP