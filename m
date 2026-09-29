Return-Path: <SRS0=nt1a=HV=detnov.org=sales@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1845ECA5FA7
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 22:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E254F1F00893; Tue, 29 Sep 2026 22:08:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=85.121.51.224
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790719713;
	b=EOUUBmP9H+JN8DadyYc9/zeJBTspKrgK2QYbjZegu6oJYHziMCCE5JFqCKLKiqeybD7C
	 E9rdtJHW374pF/1eWF8AdqcnV95I3slxq7TSKMakufyE48+ftl4HrQobw01QEQ+5Luyf/
	 01OP00TXtu/7keGzIY+ZP1W3yPjoq5aNfVXUhv0gNqN6t+/+vB/PbsoqP8QVuGs8D3cst
	 Ghl/880R3AB89FCsH12UoCDB6BDffembTlsT86BbjWAaOlnTBreEOTXW+Y0IKQOaOPSfD
	 5qa7twzcmrJUNhyhxqGQREVyxIFvFHRbQ3cwzRHRVAiV4fa16dhviNUTBr4172Fa3rQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790719713;
	h=DMARC-Filter:Received:DKIM-Signature:Date:List-Id:To:From:Reply-To:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gbqJGP6JwIMJd7e6WzInJsfN6HU4w+mTMe8OnVGqeA0=;
	b=vIU8o/j5kphXqppSbFBc5lf5eeehCsjFaQQu/fpl1zJqZZB9Of0DerFTmo8esbDuXcn4
	 0dGzqcMU8O1elcSSfz005ddSEpU0agK45x/xht8lgr+w1iRC+frDceXtIYRnDJdOMgp9Q
	 OH2SFUV5g+NA9CnYpCIMKYgFCE9sJcnUnhsMwgu9epjrNGs9cTUciT+jpT30W6KCFNOw0
	 tNVF2VSpdeEXXhZascmKqjhQZVi/DVgi+SPTSSLP44beTKkJpFxYein7g+4QMNJGtKrjc
	 oMfywuLhCB/tHzhGdo7rx1OORyRLPS2HU8BMF03Mk256VAOWhDw4ifO6njZ0f1TUMSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=detnov.org header.i=@detnov.org header.a=rsa-sha256 header.s=default header.b=RbgpXFz6;
	dmarc=pass header.from=detnov.org;
	spf=pass smtp.mailfrom=detnov.org;
	arc=none smtp.remote-ip=85.121.51.224
Received: from detnov.org (detnov.org [85.121.51.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0ADC51F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 22:08:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=detnov.org header.i=@detnov.org header.a=rsa-sha256 header.s=default header.b=RbgpXFz6
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0ADC51F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=detnov.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=detnov.org
Received: from 127.0.0.1 (unknown [23.95.89.238])
	(Authenticated sender: sales@detnov.org)
	by detnov.org (Postfix) with ESMTPSA id 51C90121AEB
	for <linux-firmware@kernel.org>; Wed, 30 Sep 2026 00:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=detnov.org;
	s=default; t=1790719522;
	bh=gbqJGP6JwIMJd7e6WzInJsfN6HU4w+mTMe8OnVGqeA0=;
	h=Date:To:From:Reply-To:Subject:From;
	b=RbgpXFz6EpidkfzOchHfqv7z7opWmc4qC5YWDAgs14KNFg7jxFn2Z9BFIExV7HCCZ
	 zIdfMx92WaRFmCwhCoLXQ15ARIbzmjb1b1q9L+qXsoKgaQNdKr/icWZuMssuLaoJfu
	 kgb4rqEqVXRAcVhPI2SdFEmi4Ha9Rin7jQjdzI+qwbyLZRdsr2XXUGdgAWK2mBTQeY
	 d7l7S9TfNKnmmS6Cs2pMD9ZknkSprvnL6KGv6sBde4cT08xba29PtAlm2JzkjKEjQz
	 xYkS9t01uVeI9PxDDDlFgwW5PjECRqSgPtNXmac/uoEobDHrlOg4fm8+jXem1iS9Z0
	 QUkVxIVIY6olA==
Date: Tue, 29 Sep 2026 18:38:24 +0200
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Prime tech Ware <sales@detnov.org>
Reply-To: sales@primetechware.com
Subject: Listing
Message-ID: <8e2862ce428ba1429fa2083b3c1b20e4@detnov.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="1eb0380ad81af495006b24de6f2bd6b8f"
Content-Transfer-Encoding: 8bit

This is a multi-part message in MIME format.

--1eb0380ad81af495006b24de6f2bd6b8f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit






Prime Tech Ware - Inventory Update














Prime Tech Ware



Current Inventory Update









Hello,



Please find below our current inventory availability.



Availability and pricing are subject to prior sale and final confirmation.
For specific quantities, quotations, or product information, please contact
our sales team.









DDR4 Memory












Product


Available


Unit Price




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











DDR5 / Server Memory












Product


Available


Unit Price




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


Available


Unit Price




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











Cisco Collaboration Equipment












Product


Available


Unit Price




SPARK-BOARD70-K9 — Cisco Spark Board 70, Standard
8
$1,850



SPARK-BOARD70-G-K9 — Cisco Spark Board 70, Global/GPL Variant
5
$1,950



CS-BRD75P-K9 — Cisco Board Pro 75
3
$10,200



CS-BRD55P-K9 — Cisco Board Pro 55
3
$5,900



CS-ROOMBARPRO-K9 — Cisco Room Bar Pro
5
$2,950



CS-ROOMBAR-K9 — Cisco Room Bar
15
$610



CS-DESKPRO-K9 — Cisco Desk Pro
9
$1,100











Lenovo ThinkSystem












Product


Available


Unit Price




ThinkSystem SR250 V3 — 1U Single-Socket Rack Server
6
$1,800



ThinkSystem SR630 V3 — 1U Dual-Socket Rack Server
8
$3,500



ThinkSystem SR650 V3 — 2U Dual-Socket Rack Server
13
$5,000



ThinkSystem SR650a V3 — 2U Accelerated Server
5
$6,500



ThinkSystem SR665 V3 — 2U Dual-Socket AMD Server
6
$7,500



ThinkSystem SR645 V3 — 1U Dual-Socket AMD Server
3
$4,500



ThinkSystem SR635 V3 — 1U Single-Socket AMD Server
8
$3,500



ThinkSystem SR675 V3 — 2U Accelerated/GPU-Capable Server
10
$8,000











NVIDIA GPUs












Product


Available


Unit Price




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











For quotations, availability confirmation, product specifications,
or inspection requirements, please contact us.



Martin Liam
Prime Tech Ware
Email:

sales@primetechware.com

Phone: +1 909 435 4982
Phone: +1 909 552 6526

primetechware.com










Inventory and pricing are subject to availability and prior sale.
Please confirm current stock and pricing before placing an order.














--1eb0380ad81af495006b24de6f2bd6b8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prime Tech Ware - Inventory Update</title>
</head>

<body style="margin:0;padding:0;background:#ffffff;font-family:Arial,Helvetica,sans-serif;color:#333333;">

<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
<td align="center" style="padding:20px 10px;">

<table role="presentation" width="700" cellpadding="0" cellspacing="0" border="0"
style="width:100%;max-width:700px;background:#ffffff;">

<tr>
<td style="padding:10px 0 18px 0;border-bottom:1px solid #dddddd;">

<div style="font-size:22px;font-weight:bold;color:#222222;">
Prime Tech Ware
</div>

<div style="font-size:13px;color:#666666;margin-top:4px;">
Current Inventory Update
</div>

</td>
</tr>

<tr>
<td style="padding:20px 0 15px 0;">

<p style="margin:0 0 12px 0;font-size:14px;line-height:1.6;">
Hello,
</p>

<p style="margin:0 0 12px 0;font-size:14px;line-height:1.6;">
Please find below our current inventory availability.
</p>

<p style="margin:0;font-size:14px;line-height:1.6;">
Availability and pricing are subject to prior sale and final confirmation.
For specific quantities, quotations, or product information, please contact
our sales team.
</p>

</td>
</tr>

<tr>
<td style="padding:12px 0 8px 0;">

<h2 style="font-size:17px;font-weight:bold;margin:0;color:#222222;">
DDR4 Memory
</h2>

</td>
</tr>

<tr>
<td>

<table role="presentation" width="100%" cellpadding="7" cellspacing="0" border="1"
style="border-collapse:collapse;border-color:#dddddd;font-size:13px;">

<tr>
<th align="left" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Product
</th>
<th align="center" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Available
</th>
<th align="right" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Unit Price
</th>
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

<tr>
<td style="padding:25px 0 8px 0;">

<h2 style="font-size:17px;font-weight:bold;margin:0;color:#222222;">
DDR5 / Server Memory
</h2>

</td>
</tr>

<tr>
<td>

<table role="presentation" width="100%" cellpadding="7" cellspacing="0" border="1"
style="border-collapse:collapse;border-color:#dddddd;font-size:13px;">

<tr>
<th align="left" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Product
</th>
<th align="center" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Available
</th>
<th align="right" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Unit Price
</th>
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

<tr>
<td style="padding:25px 0 8px 0;">

<h2 style="font-size:17px;font-weight:bold;margin:0;color:#222222;">
Cisco Networking
</h2>

</td>
</tr>

<tr>
<td>

<table role="presentation" width="100%" cellpadding="7" cellspacing="0" border="1"
style="border-collapse:collapse;border-color:#dddddd;font-size:13px;">

<tr>
<th align="left" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Product
</th>
<th align="center" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Available
</th>
<th align="right" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Unit Price
</th>
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

<tr>
<td style="padding:25px 0 8px 0;">

<h2 style="font-size:17px;font-weight:bold;margin:0;color:#222222;">
Cisco Collaboration Equipment
</h2>

</td>
</tr>

<tr>
<td>

<table role="presentation" width="100%" cellpadding="7" cellspacing="0" border="1"
style="border-collapse:collapse;border-color:#dddddd;font-size:13px;">

<tr>
<th align="left" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Product
</th>
<th align="center" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Available
</th>
<th align="right" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Unit Price
</th>
</tr>

<tr>
<td>SPARK-BOARD70-K9 — Cisco Spark Board 70, Standard</td>
<td align="center">8</td>
<td align="right">$1,850</td>
</tr>

<tr>
<td>SPARK-BOARD70-G-K9 — Cisco Spark Board 70, Global/GPL Variant</td>
<td align="center">5</td>
<td align="right">$1,950</td>
</tr>

<tr>
<td>CS-BRD75P-K9 — Cisco Board Pro 75</td>
<td align="center">3</td>
<td align="right">$10,200</td>
</tr>

<tr>
<td>CS-BRD55P-K9 — Cisco Board Pro 55</td>
<td align="center">3</td>
<td align="right">$5,900</td>
</tr>

<tr>
<td>CS-ROOMBARPRO-K9 — Cisco Room Bar Pro</td>
<td align="center">5</td>
<td align="right">$2,950</td>
</tr>

<tr>
<td>CS-ROOMBAR-K9 — Cisco Room Bar</td>
<td align="center">15</td>
<td align="right">$610</td>
</tr>

<tr>
<td>CS-DESKPRO-K9 — Cisco Desk Pro</td>
<td align="center">9</td>
<td align="right">$1,100</td>
</tr>

</table>

</td>
</tr>

<tr>
<td style="padding:25px 0 8px 0;">

<h2 style="font-size:17px;font-weight:bold;margin:0;color:#222222;">
Lenovo ThinkSystem
</h2>

</td>
</tr>

<tr>
<td>

<table role="presentation" width="100%" cellpadding="7" cellspacing="0" border="1"
style="border-collapse:collapse;border-color:#dddddd;font-size:13px;">

<tr>
<th align="left" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Product
</th>
<th align="center" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Available
</th>
<th align="right" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Unit Price
</th>
</tr>

<tr>
<td>ThinkSystem SR250 V3 — 1U Single-Socket Rack Server</td>
<td align="center">6</td>
<td align="right">$1,800</td>
</tr>

<tr>
<td>ThinkSystem SR630 V3 — 1U Dual-Socket Rack Server</td>
<td align="center">8</td>
<td align="right">$3,500</td>
</tr>

<tr>
<td>ThinkSystem SR650 V3 — 2U Dual-Socket Rack Server</td>
<td align="center">13</td>
<td align="right">$5,000</td>
</tr>

<tr>
<td>ThinkSystem SR650a V3 — 2U Accelerated Server</td>
<td align="center">5</td>
<td align="right">$6,500</td>
</tr>

<tr>
<td>ThinkSystem SR665 V3 — 2U Dual-Socket AMD Server</td>
<td align="center">6</td>
<td align="right">$7,500</td>
</tr>

<tr>
<td>ThinkSystem SR645 V3 — 1U Dual-Socket AMD Server</td>
<td align="center">3</td>
<td align="right">$4,500</td>
</tr>

<tr>
<td>ThinkSystem SR635 V3 — 1U Single-Socket AMD Server</td>
<td align="center">8</td>
<td align="right">$3,500</td>
</tr>

<tr>
<td>ThinkSystem SR675 V3 — 2U Accelerated/GPU-Capable Server</td>
<td align="center">10</td>
<td align="right">$8,000</td>
</tr>

</table>

</td>
</tr>

<tr>
<td style="padding:25px 0 8px 0;">

<h2 style="font-size:17px;font-weight:bold;margin:0;color:#222222;">
NVIDIA GPUs
</h2>

</td>
</tr>

<tr>
<td>

<table role="presentation" width="100%" cellpadding="7" cellspacing="0" border="1"
style="border-collapse:collapse;border-color:#dddddd;font-size:13px;">

<tr>
<th align="left" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Product
</th>
<th align="center" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Available
</th>
<th align="right" style="padding:8px;background:#f7f7f7;font-weight:bold;">
Unit Price
</th>
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

<tr>
<td style="padding:25px 0 15px 0;border-top:1px solid #dddddd;">

<p style="margin:0 0 10px 0;font-size:14px;line-height:1.6;">
For quotations, availability confirmation, product specifications,
or inspection requirements, please contact us.
</p>

<p style="margin:0;font-size:14px;line-height:1.7;">
<strong>Martin Liam</strong><br>
Prime Tech Ware<br>
Email:
<a href="mailto:sales@primetechware.com"
style="color:#333333;text-decoration:none;">
sales@primetechware.com
</a><br>
Phone: +1 909 435 4982<br>
Phone: +1 909 552 6526<br>
<a href="https://primetechware.com"
style="color:#333333;text-decoration:none;">
primetechware.com
</a>
</p>

</td>
</tr>

<tr>
<td style="padding:15px 0;border-top:1px solid #dddddd;">

<p style="margin:0;font-size:11px;color:#777777;line-height:1.5;">
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



--1eb0380ad81af495006b24de6f2bd6b8f--

