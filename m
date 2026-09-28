Return-Path: <SRS0=JbNP=HU=detnov.org=sales@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7463BC9832F
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 02:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A8D11F000FF; Mon, 28 Sep 2026 02:42:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=85.121.51.224
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790563368;
	b=I69rVne+NC3d8RZKDDsL7Hpj82LE7B7pGcvLl6L4hdz83wY+8X2TQlRQAqvyNn/kLupc
	 Rp+sUs1L6TqiL1Xce9eESOCyU7a6VZdDlnsAX9uAmmvpSHhYG0SbEurhIsCWw2qd86PEG
	 dq1CeF6i+rzqR7Sevn4Pz026ydCZTMxVEksIgp94V+r9AocuxWb0Mue16CChHf0CAbnHU
	 7Rw6vzhDP2jMBkSq5rO5op1if9QZO1oG7GYnoN9KRBqe+KGBTeLT4nH3prcd7idyPSEMh
	 HoDHe5HugGmB1A7N1nlQMhZFBiGy1AXYhDdD3P9yURSqloY7L5hJ06chCN2QEybPJMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790563368;
	h=DMARC-Filter:Received:DKIM-Signature:Date:List-Id:To:From:Reply-To:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+YlUFrZodHKqhhNSm0Y+21GWcWafm9Yo2RSbavWwNhE=;
	b=SmWQHuSC7lOy7znR/GshjqQRN7PDiMYWA5+iusG1YpcYn7KUlf/HuBq/lYYFEyipWiSs
	 mxVcr6tXMidbE/QQUEMvnmN0iX+JCYNwdWOqIToqk19mjfTLdPeZ8OA/muJ2fyFVTCVDZ
	 VEffE/1BeomuZyEz1iceIwJSbynVxvqQcpK12SUJcx2tuOBPY7acxDH7Y/fKxWNe9N36m
	 igSLNGX7AoRHrmC1AB/T/ElbK1VkNRvCubEzrMnL4X4X6R7t8ZrGhXjVSlp9OyVA7iUR7
	 ph5vOskzJMq15h46vCTm+Y0szowm/fMoQphr7/eeQC7xub216XMj/HXA/cReUvGjViQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=detnov.org header.i=@detnov.org header.a=rsa-sha256 header.s=default header.b=crIXTVmA;
	dmarc=pass header.from=detnov.org;
	spf=pass smtp.mailfrom=detnov.org;
	arc=none smtp.remote-ip=85.121.51.224
Received: from detnov.org (detnov.org [85.121.51.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E6461F00898
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 02:42:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=detnov.org header.i=@detnov.org header.a=rsa-sha256 header.s=default header.b=crIXTVmA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5E6461F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=detnov.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=detnov.org
Received: from 127.0.0.1 (unknown [23.95.89.238])
	(Authenticated sender: sales@detnov.org)
	by detnov.org (Postfix) with ESMTPSA id 9BE161222C1
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 04:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=detnov.org;
	s=default; t=1790563360;
	bh=+YlUFrZodHKqhhNSm0Y+21GWcWafm9Yo2RSbavWwNhE=;
	h=Date:To:From:Reply-To:Subject:From;
	b=crIXTVmApJpU7eMJcmP+IU0LhWkc0+NiMC8oTdVhsY4E7VevbClVqohlROkCLxAuT
	 xq7gXdljxMQaGSywknGW9p/4SVVLZY2cnPELwzE5jcObvYm0eWo1VG3zFAfnDskfx4
	 nHoSbeWGe8YDf2E4KxzTz5gA32g3LRbbOrfwhFRMhih/b2jjPFiqWOgVuncgSPBZ/B
	 Y4x1y74YqgR2+ZKefgHkRHNNFPXO3K7OQDX9YFBPWy5srg5uj+WlTLh3ZlQuW/vD4d
	 Bd3U0wI77RYIyCpC8geXURsmgrVvBKilsI9Pmv6Lq2VnvT5GVIzvt/RdnA8va6WqXj
	 UCeE7zsicClGw==
Date: Mon, 28 Sep 2026 02:00:37 +0200
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Prime tech Ware <sales@detnov.org>
Reply-To: sales@primetechware.com
Subject: Attn:
Message-ID: <1c782783b905d066e4ec5d52a09df9ed@detnov.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="1054c0ed2348902a2943cc78779b08788"
Content-Transfer-Encoding: 8bit

This is a multi-part message in MIME format.

--1054c0ed2348902a2943cc78779b08788
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit






Prime Tech Ware - Current Inventory














Prime Tech Ware


Business Hardware Supply









Hello,



Please find below our current inventory availability across memory, networking,
collaboration, server and NVIDIA GPU products.



Quantities are subject to prior sale. Please contact us to confirm current
availability and lead time for your required items.











DDR4 Memory





Product
Qty.
Price



32GB 2Rx4 PC4-2400T
460
$8



32GB 2Rx4 PC4-3200AA
500
$10



16GB 2Rx8 PC4-3200AA
500
$6



128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM
70
$80



32GB Dual Rank x4 DDR4-2933 CAS-21
90
$15



64GB Dual Rank x4 DDR4-2933 CAS-21
50
$28



32GB Dual Rank x4 DDR4-3200 CAS-22
59
$18



64GB Dual Rank x4 DDR4-3200 CAS-22
100
$32












DDR5 &amp; Server Memory





Product
Qty.
Price



DDR5 64GB 4800MHz ECC RDIMM 2Rx4 P43331-B21
16
$510



DDR5 64GB 5600MHz ECC RDIMM 2Rx4 P64707-B21
19
$700



DDR4 64GB 3200MHz ECC RDIMM 2Rx4 SK Hynix
25
$360



DDR5 64GB 4800MHz ECC RDIMM 2Rx4 Samsung
25
$470



DDR5 64GB 5600MHz ECC RDIMM 2Rx4 SK Hynix
20
$430












Cisco Networking





Product
Qty.
Price



C9300-48T-A Cisco Catalyst 9300
12
$490



C9200-48P-A Cisco Catalyst 9200
10
$180



C9200L-48P-4G-E Cisco Catalyst 9200L
15
$120



C9500-24Y4C-A Cisco Catalyst 9500
2
$2,800



N9K-C93180YC-FX Cisco Nexus 93180YC-FX
10
$400



N9K-C93180YC-FX3 Cisco Nexus 93180YC-FX3
8
$590



N9K-C9336C-FX2 Cisco Nexus 9336C-FX2
3
$2,400












Cisco Collaboration





Product
Qty.
Price



SPARK-BOARD70-K9
8
$1,850



SPARK-BOARD70-G-K9
5
$1,950



CS-BRD75P-K9
3
$10,200



CS-BRD55P-K9
3
$5,900



CS-ROOMBARPRO-K9
5
$2,950



CS-ROOMBAR-K9
15
$610



CS-DESKPRO-K9
9
$1,100












Lenovo ThinkSystem





Product
Qty.
Price



ThinkSystem SR250 V3
6
$1,800



ThinkSystem SR630 V3
8
$3,500



ThinkSystem SR650 V3
13
$5,000



ThinkSystem SR650a V3
5
$6,500



ThinkSystem SR665 V3
6
$7,500



ThinkSystem SR645 V3
3
$4,500



ThinkSystem SR635 V3
8
$3,500



ThinkSystem SR675 V3
10
$8,000












NVIDIA GPUs





Product
Qty.
Price



NVIDIA H100 PCIe — 80GB HBM3
6
$19,300



NVIDIA H200 PCIe/NVL — 141GB HBM3e
4
$21,500



NVIDIA L40S — 48GB GDDR6
7
$3,500



NVIDIA RTX PRO 6000 Blackwell Server Edition — 96GB GDDR7 ECC
2
$9,900



NVIDIA RTX PRO 6000 Blackwell Workstation Edition — 96GB GDDR7
3
$3,900



NVIDIA B200 — 180GB HBM3e
3
$22,000



NVIDIA RTX 6000 Ada — 48GB GDDR6 ECC
10
$2,100



NVIDIA A100 — 40GB/80GB
15
$2,000



NVIDIA L4 — 24GB GDDR6
17
$970












If you are interested in any of the above products, please send us your
required part numbers and quantities. We can confirm availability and
provide the next steps for ordering, payment, pickup or delivery.



Best regards,
Martin Liam
Prime Tech Ware
Compton, California

sales@primetechware.com

+1 909 435 4982
+1 909 552 6526

primetechware.com












Inventory and pricing are subject to availability and prior sale.
Please confirm current stock and pricing before placing an order.














--1054c0ed2348902a2943cc78779b08788
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prime Tech Ware - Current Inventory</title>
</head>

<body style="margin:0; padding:0; background:#ffffff; font-family:Arial, Helvetica, sans-serif; color:#333333;">

<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background:#ffffff;">
<tr>
<td align="center" style="padding:20px 10px;">

<table role="presentation" width="700" cellpadding="0" cellspacing="0" border="0"
style="max-width:700px; width:100%; border:1px solid #dddddd; background:#ffffff;">

<!-- HEADER -->
<tr>
<td style="padding:22px 25px; border-bottom:1px solid #dddddd;">
<div style="font-size:24px; font-weight:bold; color:#222222;">
Prime Tech Ware
</div>
<div style="font-size:13px; color:#666666; margin-top:4px;">
Business Hardware Supply
</div>
</td>
</tr>

<!-- INTRODUCTION -->
<tr>
<td style="padding:22px 25px 10px 25px;">

<p style="margin:0 0 10px 0; font-size:15px; line-height:1.6;">
Hello,
</p>

<p style="margin:0 0 10px 0; font-size:14px; line-height:1.6;">
Please find below our current inventory availability across memory, networking,
collaboration, server and NVIDIA GPU products.
</p>

<p style="margin:0 0 20px 0; font-size:14px; line-height:1.6;">
Quantities are subject to prior sale. Please contact us to confirm current
availability and lead time for your required items.
</p>

</td>
</tr>


<!-- DDR4 MEMORY -->
<tr>
<td style="padding:0 25px 20px 25px;">

<h2 style="font-size:18px; color:#222222; margin:10px 0;">
DDR4 Memory
</h2>

<table width="100%" cellpadding="8" cellspacing="0" border="1"
style="border-collapse:collapse; border-color:#dddddd; font-size:13px;">

<tr style="background:#f5f5f5;">
<th align="left">Product</th>
<th align="center">Qty.</th>
<th align="right">Price</th>
</tr>

<tr>
<td>32GB 2Rx4 PC4-2400T</td>
<td align="center">460</td>
<td align="right">$8</td>
</tr>

<tr>
<td>32GB 2Rx4 PC4-3200AA</td>
<td align="center">500</td>
<td align="right">$10</td>
</tr>

<tr>
<td>16GB 2Rx8 PC4-3200AA</td>
<td align="center">500</td>
<td align="right">$6</td>
</tr>

<tr>
<td>128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM</td>
<td align="center">70</td>
<td align="right">$80</td>
</tr>

<tr>
<td>32GB Dual Rank x4 DDR4-2933 CAS-21</td>
<td align="center">90</td>
<td align="right">$15</td>
</tr>

<tr>
<td>64GB Dual Rank x4 DDR4-2933 CAS-21</td>
<td align="center">50</td>
<td align="right">$28</td>
</tr>

<tr>
<td>32GB Dual Rank x4 DDR4-3200 CAS-22</td>
<td align="center">59</td>
<td align="right">$18</td>
</tr>

<tr>
<td>64GB Dual Rank x4 DDR4-3200 CAS-22</td>
<td align="center">100</td>
<td align="right">$32</td>
</tr>

</table>
</td>
</tr>


<!-- DDR5 / SERVER MEMORY -->
<tr>
<td style="padding:0 25px 20px 25px;">

<h2 style="font-size:18px; color:#222222; margin:10px 0;">
DDR5 &amp; Server Memory
</h2>

<table width="100%" cellpadding="8" cellspacing="0" border="1"
style="border-collapse:collapse; border-color:#dddddd; font-size:13px;">

<tr style="background:#f5f5f5;">
<th align="left">Product</th>
<th align="center">Qty.</th>
<th align="right">Price</th>
</tr>

<tr>
<td>DDR5 64GB 4800MHz ECC RDIMM 2Rx4 P43331-B21</td>
<td align="center">16</td>
<td align="right">$510</td>
</tr>

<tr>
<td>DDR5 64GB 5600MHz ECC RDIMM 2Rx4 P64707-B21</td>
<td align="center">19</td>
<td align="right">$700</td>
</tr>

<tr>
<td>DDR4 64GB 3200MHz ECC RDIMM 2Rx4 SK Hynix</td>
<td align="center">25</td>
<td align="right">$360</td>
</tr>

<tr>
<td>DDR5 64GB 4800MHz ECC RDIMM 2Rx4 Samsung</td>
<td align="center">25</td>
<td align="right">$470</td>
</tr>

<tr>
<td>DDR5 64GB 5600MHz ECC RDIMM 2Rx4 SK Hynix</td>
<td align="center">20</td>
<td align="right">$430</td>
</tr>

</table>
</td>
</tr>


<!-- CISCO NETWORKING -->
<tr>
<td style="padding:0 25px 20px 25px;">

<h2 style="font-size:18px; color:#222222; margin:10px 0;">
Cisco Networking
</h2>

<table width="100%" cellpadding="8" cellspacing="0" border="1"
style="border-collapse:collapse; border-color:#dddddd; font-size:13px;">

<tr style="background:#f5f5f5;">
<th align="left">Product</th>
<th align="center">Qty.</th>
<th align="right">Price</th>
</tr>

<tr>
<td>C9300-48T-A Cisco Catalyst 9300</td>
<td align="center">12</td>
<td align="right">$490</td>
</tr>

<tr>
<td>C9200-48P-A Cisco Catalyst 9200</td>
<td align="center">10</td>
<td align="right">$180</td>
</tr>

<tr>
<td>C9200L-48P-4G-E Cisco Catalyst 9200L</td>
<td align="center">15</td>
<td align="right">$120</td>
</tr>

<tr>
<td>C9500-24Y4C-A Cisco Catalyst 9500</td>
<td align="center">2</td>
<td align="right">$2,800</td>
</tr>

<tr>
<td>N9K-C93180YC-FX Cisco Nexus 93180YC-FX</td>
<td align="center">10</td>
<td align="right">$400</td>
</tr>

<tr>
<td>N9K-C93180YC-FX3 Cisco Nexus 93180YC-FX3</td>
<td align="center">8</td>
<td align="right">$590</td>
</tr>

<tr>
<td>N9K-C9336C-FX2 Cisco Nexus 9336C-FX2</td>
<td align="center">3</td>
<td align="right">$2,400</td>
</tr>

</table>
</td>
</tr>


<!-- CISCO COLLABORATION -->
<tr>
<td style="padding:0 25px 20px 25px;">

<h2 style="font-size:18px; color:#222222; margin:10px 0;">
Cisco Collaboration
</h2>

<table width="100%" cellpadding="8" cellspacing="0" border="1"
style="border-collapse:collapse; border-color:#dddddd; font-size:13px;">

<tr style="background:#f5f5f5;">
<th align="left">Product</th>
<th align="center">Qty.</th>
<th align="right">Price</th>
</tr>

<tr>
<td>SPARK-BOARD70-K9</td>
<td align="center">8</td>
<td align="right">$1,850</td>
</tr>

<tr>
<td>SPARK-BOARD70-G-K9</td>
<td align="center">5</td>
<td align="right">$1,950</td>
</tr>

<tr>
<td>CS-BRD75P-K9</td>
<td align="center">3</td>
<td align="right">$10,200</td>
</tr>

<tr>
<td>CS-BRD55P-K9</td>
<td align="center">3</td>
<td align="right">$5,900</td>
</tr>

<tr>
<td>CS-ROOMBARPRO-K9</td>
<td align="center">5</td>
<td align="right">$2,950</td>
</tr>

<tr>
<td>CS-ROOMBAR-K9</td>
<td align="center">15</td>
<td align="right">$610</td>
</tr>

<tr>
<td>CS-DESKPRO-K9</td>
<td align="center">9</td>
<td align="right">$1,100</td>
</tr>

</table>
</td>
</tr>


<!-- LENOVO -->
<tr>
<td style="padding:0 25px 20px 25px;">

<h2 style="font-size:18px; color:#222222; margin:10px 0;">
Lenovo ThinkSystem
</h2>

<table width="100%" cellpadding="8" cellspacing="0" border="1"
style="border-collapse:collapse; border-color:#dddddd; font-size:13px;">

<tr style="background:#f5f5f5;">
<th align="left">Product</th>
<th align="center">Qty.</th>
<th align="right">Price</th>
</tr>

<tr>
<td>ThinkSystem SR250 V3</td>
<td align="center">6</td>
<td align="right">$1,800</td>
</tr>

<tr>
<td>ThinkSystem SR630 V3</td>
<td align="center">8</td>
<td align="right">$3,500</td>
</tr>

<tr>
<td>ThinkSystem SR650 V3</td>
<td align="center">13</td>
<td align="right">$5,000</td>
</tr>

<tr>
<td>ThinkSystem SR650a V3</td>
<td align="center">5</td>
<td align="right">$6,500</td>
</tr>

<tr>
<td>ThinkSystem SR665 V3</td>
<td align="center">6</td>
<td align="right">$7,500</td>
</tr>

<tr>
<td>ThinkSystem SR645 V3</td>
<td align="center">3</td>
<td align="right">$4,500</td>
</tr>

<tr>
<td>ThinkSystem SR635 V3</td>
<td align="center">8</td>
<td align="right">$3,500</td>
</tr>

<tr>
<td>ThinkSystem SR675 V3</td>
<td align="center">10</td>
<td align="right">$8,000</td>
</tr>

</table>
</td>
</tr>


<!-- NVIDIA -->
<tr>
<td style="padding:0 25px 20px 25px;">

<h2 style="font-size:18px; color:#222222; margin:10px 0;">
NVIDIA GPUs
</h2>

<table width="100%" cellpadding="8" cellspacing="0" border="1"
style="border-collapse:collapse; border-color:#dddddd; font-size:13px;">

<tr style="background:#f5f5f5;">
<th align="left">Product</th>
<th align="center">Qty.</th>
<th align="right">Price</th>
</tr>

<tr>
<td>NVIDIA H100 PCIe — 80GB HBM3</td>
<td align="center">6</td>
<td align="right">$19,300</td>
</tr>

<tr>
<td>NVIDIA H200 PCIe/NVL — 141GB HBM3e</td>
<td align="center">4</td>
<td align="right">$21,500</td>
</tr>

<tr>
<td>NVIDIA L40S — 48GB GDDR6</td>
<td align="center">7</td>
<td align="right">$3,500</td>
</tr>

<tr>
<td>NVIDIA RTX PRO 6000 Blackwell Server Edition — 96GB GDDR7 ECC</td>
<td align="center">2</td>
<td align="right">$9,900</td>
</tr>

<tr>
<td>NVIDIA RTX PRO 6000 Blackwell Workstation Edition — 96GB GDDR7</td>
<td align="center">3</td>
<td align="right">$3,900</td>
</tr>

<tr>
<td>NVIDIA B200 — 180GB HBM3e</td>
<td align="center">3</td>
<td align="right">$22,000</td>
</tr>

<tr>
<td>NVIDIA RTX 6000 Ada — 48GB GDDR6 ECC</td>
<td align="center">10</td>
<td align="right">$2,100</td>
</tr>

<tr>
<td>NVIDIA A100 — 40GB/80GB</td>
<td align="center">15</td>
<td align="right">$2,000</td>
</tr>

<tr>
<td>NVIDIA L4 — 24GB GDDR6</td>
<td align="center">17</td>
<td align="right">$970</td>
</tr>

</table>
</td>
</tr>


<!-- CONTACT -->
<tr>
<td style="padding:10px 25px 25px 25px;">

<p style="font-size:14px; line-height:1.6; margin:0 0 10px 0;">
If you are interested in any of the above products, please send us your
required part numbers and quantities. We can confirm availability and
provide the next steps for ordering, payment, pickup or delivery.
</p>

<p style="font-size:14px; line-height:1.6; margin:0;">
Best regards,<br>
<strong>Martin Liam</strong><br>
Prime Tech Ware<br>
Compton, California<br>
<a href="mailto:sales@primetechware.com"
style="color:#333333; text-decoration:none;">
sales@primetechware.com
</a><br>
+1 909 435 4982<br>
+1 909 552 6526<br>
<a href="https://primetechware.com"
style="color:#333333; text-decoration:none;">
primetechware.com
</a>
</p>

</td>
</tr>


<!-- FOOTER -->
<tr>
<td style="padding:15px 25px; border-top:1px solid #dddddd; background:#fafafa;">

<p style="font-size:11px; color:#777777; line-height:1.5; margin:0;">
Inventory and pricing are subject to availability and prior sale.
Please confirm current stock and pricing before placing an order.
</p>

</td>
</tr>

</table>

</td>
</tr>
</table>

</body>
</html>



--1054c0ed2348902a2943cc78779b08788--

