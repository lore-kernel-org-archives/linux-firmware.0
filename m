Return-Path: <SRS0=X5Q2=HR=detnov.org=sales@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5FEC98321
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Sep 2026 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 942C71F00898; Fri, 25 Sep 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=85.121.51.224
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790362376;
	b=h4mm9Wtm8VwabkyCYPDQvMKFSSYmz7TUjXiXAUSrLcj9Dh7/5Gb+u9IUK6DFcLgQ/X2P
	 g1wmNhYtVoQpE4zqaxZBXtzeG4WQAULCfYyASsTVTpc0MetpgnF+l1NqxIWUbD0dso/Sm
	 ZfsXa6v4k2ZCFpvtitjgaQwuFbKvtsT+81094PRtbYDFYFG4bwFzP3C+hMnHXSCTNgXqB
	 lN8JUg+S/sdzawz8Q2hT017I3W0sSESQ7eLabjpDRxlxrfmxP3nVLPg8tEzWMjNs6DejD
	 +ce+l0LVl3tM6I0AsZx/bCTBzwh4OzqGGVqhD73282P3cR+IYpuNARnZlZfUSDn0HhQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790362376;
	h=DMARC-Filter:Received:DKIM-Signature:Date:List-Id:To:From:Reply-To:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IYgjgsPwpIpoY5wLNecLYVExyKrDAiaRtkl3bYS9yy0=;
	b=SQo7drL3wZ2iz+zJnVN9A+8Gr4+m2fj8dCgkyuNuPyDPsftZIVyukOoRqWYrIMQjCVeW
	 zYjwWZi+VXprIPZaV+TGEI+l3oLRxxsO89p5JGO/amNhhiUmAoslLr1vHm1BBY/rlYLsn
	 Jaw9eHt7o6G9fUOZBcX0TGayo5JmFaR+ewm78NGEY2qDacq3m0FQqUeRSVy70Z2hqznVe
	 sGqIpp2xGh8An8Fru6hKAZ8e3dlmTQ21qi62ohME0YiDZKMk479TDBCgHX1mGpuGIxOON
	 2n6KObhSo0Jr/jBkPVqnm4+/oTkwyA9yDMHUR/fzjAryinNSbBv++gVHCzxUCzhQODQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=detnov.org header.i=@detnov.org header.a=rsa-sha256 header.s=default header.b="m4G/R0mL";
	dmarc=pass header.from=detnov.org;
	spf=pass smtp.mailfrom=detnov.org;
	arc=none smtp.remote-ip=85.121.51.224
Received: from detnov.org (detnov.org [85.121.51.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97D3C1F00893
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 18:52:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=detnov.org header.i=@detnov.org header.a=rsa-sha256 header.s=default header.b=m4G/R0mL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 97D3C1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=detnov.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=detnov.org
Received: from 127.0.0.1 (unknown [23.95.89.238])
	(Authenticated sender: sales@detnov.org)
	by detnov.org (Postfix) with ESMTPSA id 024DF1250F7
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 20:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=detnov.org;
	s=default; t=1790362357;
	bh=IYgjgsPwpIpoY5wLNecLYVExyKrDAiaRtkl3bYS9yy0=;
	h=Date:To:From:Reply-To:Subject:From;
	b=m4G/R0mLrd/4x5ImdWP3854N/oqlLSoxV1kKvtnTkjgkdxjllumceo/7iZQEKRC7X
	 gSa/9MraUoBzzXw09i1HbdI5Z8csGaWuRAeSN/ZrTDAhDHiaCVAtZ/wCsCBW+kzpn/
	 3KVhIOFTfrj937+ER6YpO4mVMyQfSaLq2UAX2l2gkeGErS2UhWwIFj6Q/kJ2QfA756
	 9vhM/j513BOd0HCmly7OdBq1C+J1jk1EdgG+Rma7X0rSmJ0k0xuG95tQVHgYY8lYEQ
	 Xkrd5YENszR6bxY8aUA0CaU+FPvq4tXF0WUPh4XwcLGYLngthxnm9vo/lLgZLenwrN
	 pckxJNoZDEt+w==
Date: Fri, 25 Sep 2026 17:24:05 +0200
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Prime tech Ware <sales@detnov.org>
Reply-To: sales@primetechware.com
Subject: INFO
Message-ID: <148ecc346a8c672ceb1e4ca63a2ade6a@detnov.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="1088327066151b1b5f0d9769e96568876"
Content-Transfer-Encoding: 8bit

This is a multi-part message in MIME format.

--1088327066151b1b5f0d9769e96568876
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit






Prime Tech Ware - Current Inventory Update














Prime Tech Ware


Current Inventory Update









Hello,



I wanted to share our current inventory update. The following
products are currently available and can ship, subject to final
availability confirmation.



For larger quantities, product specifications, quotations, or
inspection requirements, please contact our sales team so we can
confirm availability and prepare a formal quotation.










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


C9300-48T-A Cisco Catalyst 930012$490

C9200-48P-A Cisco Catalyst 920010$180

C9200L-48P-4G-E Cisco Catalyst 9200L15$120

C9500-24Y4C-A Cisco Catalyst 95002$2,800

N9K-C93180YC-FX Cisco Nexus 93180YC-FX10$400

N9K-C93180YC-FX3 Cisco Nexus 93180YC-FX38$590

N9K-C9336C-FX2 Cisco Nexus 9336C-FX23$2,400










Cisco Collaboration Equipment










Product
Available
Unit Price


SPARK-BOARD70-K9 — Cisco Spark Board 70, Standard8$1,850

SPARK-BOARD70-G-K9 — Cisco Spark Board 70, Global/GPL Variant5$1,950

CS-BRD75P-K9 — Cisco Board Pro 753$10,200

CS-BRD55P-K9 — Cisco Board Pro 553$5,900

CS-ROOMBARPRO-K9 — Cisco Room Bar Pro5$2,950

CS-ROOMBAR-K9 — Cisco Room Bar15$610

CS-DESKPRO-K9 — Cisco Desk Pro9$1,100










Lenovo ThinkSystem










Product
Available
Unit Price


ThinkSystem SR250 V3 — 1U Single-Socket Rack Server6$1,800

ThinkSystem SR630 V3 — 1U Dual-Socket Rack Server8$3,500

ThinkSystem SR650 V3 — 2U Dual-Socket Rack Server13$5,000

ThinkSystem SR650a V3 — 2U Accelerated Server5$6,500

ThinkSystem SR665 V3 — 2U Dual-Socket AMD Server6$7,500

ThinkSystem SR645 V3 — 1U Dual-Socket AMD Server3$4,500

ThinkSystem SR635 V3 — 1U Single-Socket AMD Server8$3,500

ThinkSystem SR675 V3 — 2U Accelerated/GPU-Capable Server10$8,000










NVIDIA GPUs










Product
Available
Unit Price


NVIDIA H100 PCIe — 80GB HBM36$19,300


NVIDIA H200 PCIe/NVL — 141GB HBM3e
4
$21,500


NVIDIA L40S — 48GB GDDR67$3,500

NVIDIA RTX PRO 6000 Blackwell Server Edition — 96GB GDDR7 ECC2$9,900

NVIDIA RTX PRO 6000 Blackwell Workstation Edition — 96GB GDDR73$3,900

NVIDIA B200 — 180GB HBM3e3$22,000

NVIDIA RTX 6000 Ada — 48GB GDDR6 ECC10$2,100

NVIDIA A100 — 40GB/80GB15$2,000

NVIDIA L4 — 24GB GDDR617$970
















Quotations, Availability &amp; Inspection



For quotations, availability confirmation, product details,
or inspection scheduling, please contact us:



Email:

sales@primetechware.com



Phone:

+1 909 435 4982
















Thank you,



Martin Liam
Prime Tech Ware














--1088327066151b1b5f0d9769e96568876
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Prime Tech Ware - Current Inventory Update</title>
</head>

<body style="margin:0;padding:0;background:#f4f6f8;font-family:Arial,Helvetica,sans-serif;color:#222;">

<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background:#f4f6f8;padding:25px 0;">
<tr>
<td align="center">

<table width="760" cellpadding="0" cellspacing="0" border="0"
style="max-width:760px;width:100%;background:#ffffff;border:1px solid #e2e5e9;">

<!-- HEADER -->
<tr>
<td style="background:#1f2937;padding:25px 30px;">
<h1 style="margin:0;color:#ffffff;font-size:24px;font-weight:600;">
Prime Tech Ware
</h1>
<p style="margin:6px 0 0;color:#d1d5db;font-size:14px;">
Current Inventory Update
</p>
</td>
</tr>

<!-- INTRO -->
<tr>
<td style="padding:28px 30px 18px;">

<p style="margin:0 0 14px;font-size:15px;line-height:1.6;">
Hello,
</p>

<p style="margin:0 0 14px;font-size:15px;line-height:1.6;">
I wanted to share our current inventory update. The following
products are currently available and can ship, subject to final
availability confirmation.
</p>

<p style="margin:0;font-size:14px;line-height:1.6;color:#555;">
For larger quantities, product specifications, quotations, or
inspection requirements, please contact our sales team so we can
confirm availability and prepare a formal quotation.
</p>

</td>
</tr>


<!-- DDR4 MEMORY -->
<tr>
<td style="padding:8px 30px 8px;">
<h2 style="margin:0;font-size:18px;color:#1f2937;">
DDR4 Memory
</h2>
</td>
</tr>

<tr>
<td style="padding:0 30px 22px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="border-collapse:collapse;font-size:13px;">

<tr style="background:#e5e7eb;">
<th align="left" style="padding:10px;">Product</th>
<th align="center" style="padding:10px;">Available</th>
<th align="right" style="padding:10px;">Unit Price</th>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">32GB 2Rx4 PC4-2400T</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">460</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$8</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">32GB 2Rx4 PC4-3200AA</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">500</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$10</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">16GB 2Rx8 PC4-3200AA</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">500</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$6</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">70</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$80</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">32GB Dual Rank x4 DDR4-2933 CAS-21</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">90</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$15</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">64GB Dual Rank x4 DDR4-2933 CAS-21</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">50</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$28</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">32GB Dual Rank x4 DDR4-3200 CAS-22</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">59</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$18</td>
</tr>

<tr>
<td style="padding:9px;">64GB Dual Rank x4 DDR4-3200 CAS-22</td>
<td align="center" style="padding:9px;">100</td>
<td align="right" style="padding:9px;">$32</td>
</tr>

</table>
</td>
</tr>


<!-- DDR5 -->
<tr>
<td style="padding:8px 30px;">
<h2 style="margin:0;font-size:18px;color:#1f2937;">
DDR5 / Server Memory
</h2>
</td>
</tr>

<tr>
<td style="padding:0 30px 22px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="border-collapse:collapse;font-size:13px;">

<tr style="background:#e5e7eb;">
<th align="left" style="padding:10px;">Product</th>
<th align="center" style="padding:10px;">Available</th>
<th align="right" style="padding:10px;">Unit Price</th>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">DDR5 64GB 4800MHz ECC RDIMM 2Rx4 P43331-B21</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">16</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$510</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">DDR5 64GB 5600MHz ECC RDIMM 2Rx4 P64707-B21</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">19</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$700</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">DDR4 64GB 3200MHz ECC RDIMM 2Rx4 SK Hynix</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">25</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$360</td>
</tr>

<tr>
<td style="padding:9px;border-bottom:1px solid #e5e7eb;">DDR5 64GB 4800MHz ECC RDIMM 2Rx4 Samsung</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">25</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$470</td>
</tr>

<tr>
<td style="padding:9px;">DDR5 64GB 5600MHz ECC RDIMM 2Rx4 SK Hynix</td>
<td align="center" style="padding:9px;">20</td>
<td align="right" style="padding:9px;">$430</td>
</tr>

</table>
</td>
</tr>


<!-- CISCO NETWORKING -->
<tr>
<td style="padding:8px 30px;">
<h2 style="margin:0;font-size:18px;color:#1f2937;">
Cisco Networking
</h2>
</td>
</tr>

<tr>
<td style="padding:0 30px 22px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="border-collapse:collapse;font-size:13px;">

<tr style="background:#e5e7eb;">
<th align="left" style="padding:10px;">Product</th>
<th align="center" style="padding:10px;">Available</th>
<th align="right" style="padding:10px;">Unit Price</th>
</tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">C9300-48T-A Cisco Catalyst 9300</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">12</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$490</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">C9200-48P-A Cisco Catalyst 9200</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">10</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$180</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">C9200L-48P-4G-E Cisco Catalyst 9200L</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">15</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$120</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">C9500-24Y4C-A Cisco Catalyst 9500</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">2</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$2,800</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">N9K-C93180YC-FX Cisco Nexus 93180YC-FX</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">10</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$400</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">N9K-C93180YC-FX3 Cisco Nexus 93180YC-FX3</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">8</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$590</td></tr>

<tr><td style="padding:9px;">N9K-C9336C-FX2 Cisco Nexus 9336C-FX2</td><td align="center" style="padding:9px;">3</td><td align="right" style="padding:9px;">$2,400</td></tr>

</table>
</td>
</tr>


<!-- CISCO COLLABORATION -->
<tr>
<td style="padding:8px 30px;">
<h2 style="margin:0;font-size:18px;color:#1f2937;">
Cisco Collaboration Equipment
</h2>
</td>
</tr>

<tr>
<td style="padding:0 30px 22px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="border-collapse:collapse;font-size:13px;">

<tr style="background:#e5e7eb;">
<th align="left" style="padding:10px;">Product</th>
<th align="center" style="padding:10px;">Available</th>
<th align="right" style="padding:10px;">Unit Price</th>
</tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">SPARK-BOARD70-K9 — Cisco Spark Board 70, Standard</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">8</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$1,850</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">SPARK-BOARD70-G-K9 — Cisco Spark Board 70, Global/GPL Variant</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">5</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$1,950</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">CS-BRD75P-K9 — Cisco Board Pro 75</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">3</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$10,200</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">CS-BRD55P-K9 — Cisco Board Pro 55</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">3</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$5,900</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">CS-ROOMBARPRO-K9 — Cisco Room Bar Pro</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">5</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$2,950</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">CS-ROOMBAR-K9 — Cisco Room Bar</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">15</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$610</td></tr>

<tr><td style="padding:9px;">CS-DESKPRO-K9 — Cisco Desk Pro</td><td align="center" style="padding:9px;">9</td><td align="right" style="padding:9px;">$1,100</td></tr>

</table>
</td>
</tr>


<!-- LENOVO -->
<tr>
<td style="padding:8px 30px;">
<h2 style="margin:0;font-size:18px;color:#1f2937;">
Lenovo ThinkSystem
</h2>
</td>
</tr>

<tr>
<td style="padding:0 30px 22px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="border-collapse:collapse;font-size:13px;">

<tr style="background:#e5e7eb;">
<th align="left" style="padding:10px;">Product</th>
<th align="center" style="padding:10px;">Available</th>
<th align="right" style="padding:10px;">Unit Price</th>
</tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR250 V3 — 1U Single-Socket Rack Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">6</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$1,800</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR630 V3 — 1U Dual-Socket Rack Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">8</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$3,500</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR650 V3 — 2U Dual-Socket Rack Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">13</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$5,000</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR650a V3 — 2U Accelerated Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">5</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$6,500</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR665 V3 — 2U Dual-Socket AMD Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">6</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$7,500</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR645 V3 — 1U Dual-Socket AMD Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">3</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$4,500</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">ThinkSystem SR635 V3 — 1U Single-Socket AMD Server</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">8</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$3,500</td></tr>

<tr><td style="padding:9px;">ThinkSystem SR675 V3 — 2U Accelerated/GPU-Capable Server</td><td align="center" style="padding:9px;">10</td><td align="right" style="padding:9px;">$8,000</td></tr>

</table>
</td>
</tr>


<!-- NVIDIA -->
<tr>
<td style="padding:8px 30px;">
<h2 style="margin:0;font-size:18px;color:#1f2937;">
NVIDIA GPUs
</h2>
</td>
</tr>

<tr>
<td style="padding:0 30px 30px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="border-collapse:collapse;font-size:13px;">

<tr style="background:#e5e7eb;">
<th align="left" style="padding:10px;">Product</th>
<th align="center" style="padding:10px;">Available</th>
<th align="right" style="padding:10px;">Unit Price</th>
</tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA H100 PCIe — 80GB HBM3</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">6</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$19,300</td></tr>

<tr style="background:#f3f4f6;">
<td style="padding:9px;border-bottom:1px solid #e5e7eb;font-weight:bold;">NVIDIA H200 PCIe/NVL — 141GB HBM3e</td>
<td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;font-weight:bold;">4</td>
<td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;font-weight:bold;">$21,500</td>
</tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA L40S — 48GB GDDR6</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">7</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$3,500</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA RTX PRO 6000 Blackwell Server Edition — 96GB GDDR7 ECC</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">2</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$9,900</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA RTX PRO 6000 Blackwell Workstation Edition — 96GB GDDR7</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">3</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$3,900</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA B200 — 180GB HBM3e</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">3</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$22,000</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA RTX 6000 Ada — 48GB GDDR6 ECC</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">10</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$2,100</td></tr>

<tr><td style="padding:9px;border-bottom:1px solid #e5e7eb;">NVIDIA A100 — 40GB/80GB</td><td align="center" style="padding:9px;border-bottom:1px solid #e5e7eb;">15</td><td align="right" style="padding:9px;border-bottom:1px solid #e5e7eb;">$2,000</td></tr>

<tr><td style="padding:9px;">NVIDIA L4 — 24GB GDDR6</td><td align="center" style="padding:9px;">17</td><td align="right" style="padding:9px;">$970</td></tr>

</table>
</td>
</tr>


<!-- CONTACT -->
<tr>
<td style="padding:0 30px 30px;">

<table width="100%" cellpadding="0" cellspacing="0" border="0"
style="background:#f3f4f6;border:1px solid #e5e7eb;">

<tr>
<td style="padding:20px;">

<p style="margin:0 0 10px;font-size:15px;font-weight:bold;">
Quotations, Availability &amp; Inspection
</p>

<p style="margin:0 0 12px;font-size:14px;line-height:1.6;">
For quotations, availability confirmation, product details,
or inspection scheduling, please contact us:
</p>

<p style="margin:0;font-size:14px;line-height:1.8;">
<strong>Email:</strong>
<a href="mailto:sales@primetechware.com"
style="color:#2563eb;text-decoration:none;">
sales@primetechware.com
</a>
<br>

<strong>Phone:</strong>
<a href="tel:+19094354982"
style="color:#2563eb;text-decoration:none;">
+1 909 435 4982
</a>
</p>

</td>
</tr>

</table>
</td>
</tr>


<!-- FOOTER -->
<tr>
<td style="border-top:1px solid #e5e7eb;background:#fafafa;padding:22px 30px;">

<p style="margin:0;font-size:14px;line-height:1.6;">
Thank you,
</p>

<p style="margin:7px 0 0;font-size:14px;line-height:1.6;">
<strong>Martin Liam</strong><br>
Prime Tech Ware
</p>

</td>
</tr>

</table>

</td>
</tr>
</table>

</body>
</html>



--1088327066151b1b5f0d9769e96568876--

