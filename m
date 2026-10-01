Return-Path: <SRS0=shuy=HX=kaberaa.com=node_utlan8328@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817E7CA5FCB
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Oct 2026 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C6EC1F00899; Thu,  1 Oct 2026 14:35:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.172.92.99
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790865305;
	b=LWonrQBL+Mg2QMAWcg/AYZt4ECoOUN7pN+De1C/fCV7xOyjfliClE7CYqrA8z+Kc4qI8
	 /iHR2rfdTTkgcgZlvYukslmrGLFuXrUjA5unz/Yvv9zqnhTueMD+YFEZU0rjGUqywWLfD
	 B+tae2ZTcj1zq7bRq6gnkwH5A8BI0omIQzq3trKgYOcjNo+pCfSq9bAUnpRD5zEtSV8LJ
	 Qg5mGDNYDmsqRUqj9jDarJr/BAl9t7hYxLfzxzZ2w3vpCG9DJjHxkqmDCgr3I5aDzuCIQ
	 buZ0m5Ezy/uY0YqHa7S26jyipWkInwoSy7uzalhc805echLZ+/Zr9bWL0arB5cLd11A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790865305;
	h=DMARC-Filter:Received:Date:List-Id:To:From:Reply-To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-Get-Message-Sender-Via:X-Authenticated-Sender:X-Source:
	 X-Source-Args:X-Source-Dir;
	bh=exeukhW5bPA2dbprPnoxAkiwLrh0RIrSxTuClxi1nxo=;
	b=XO3UzvbNLbXDuDC5Z+NUVcJzvVmU6+hda5SGBC2hUjTwkZ6jhPsCKaZHCuY5udb/Kh+2
	 K8GzJgREP+GSK5jFaQqPF3Ao3ikavIeMVpaWxIcDJYRlZ13XNS0theyQ77kPGmEATeZqn
	 v7s1VAf3DkrZt2qfnH714awJXp+rcJNhAxUDO9iOVNfJCHZpMYNjSTC3r8YEnFiaHODDF
	 nd7ufXUdRsmoJ626MKqo4UnQ1GVMobPC5wmbvM/x5DLEhF8x6zG/BEDKF3u5t345cWPpT
	 YxX3FH7eaqevcsrBroWYvMiNyzlhEefg1MeusIIIJxNauOSKOlxHPR6/f2sWsdC4PkA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=kaberaa.com;
	spf=none smtp.mailfrom=kaberaa.com;
	arc=none smtp.remote-ip=103.172.92.99
Received: from c0001-c4486.pwh-r1.com (c0001-c4486.pwh-r1.com [103.172.92.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C98D21F00898
	for <linux-firmware@kernel.org>; Thu,  1 Oct 2026 14:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C98D21F00898
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kaberaa.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=kaberaa.com
Received: from [23.95.89.238] (port=54819 helo=127.0.0.1)
	by c0001-c4486.pwh-r1.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <node_utlan8328@kaberaa.com>)
	id 1xCHoQ-000000091dd-07LO
	for linux-firmware@kernel.org;
	Thu, 01 Oct 2026 20:01:04 +0530
Date: Thu, 1 Oct 2026 16:13:44 +0200
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Prime tech Ware <node_utlan8328@kaberaa.com>
Reply-To: sales@primetechware.com
Subject: List
Message-ID: <e70370c194768aac8b9d81724be62d16@kaberaa.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="13807f1d78f2b24c954e8f5b63cabd6ee"
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - c0001-c4486.pwh-r1.com
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kaberaa.com
X-Get-Message-Sender-Via: c0001-c4486.pwh-r1.com: authenticated_id: node_utlan8328@kaberaa.com
X-Authenticated-Sender: c0001-c4486.pwh-r1.com: node_utlan8328@kaberaa.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

This is a multi-part message in MIME format.

--13807f1d78f2b24c954e8f5b63cabd6ee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit






Prime Tech Ware | Inventory Update

  body {
    margin:0;
    padding:0;
    background:#ffffff;
    color:#333333;
    font-family:Arial,Helvetica,sans-serif;
    font-size:14px;
    line-height:1.5;
  }
  .wrap {
    width:100%;
    max-width:680px;
    margin:0 auto;
    padding:24px 16px;
    box-sizing:border-box;
  }
  .header {
    padding-bottom:16px;
    border-bottom:1px solid #dddddd;
  }
  .company {
    font-size:20px;
    font-weight:600;
    color:#222222;
  }
  .subject {
    margin-top:4px;
    color:#666666;
    font-size:13px;
  }
  p { margin:0 0 12px 0; }
  h2 {
    margin:24px 0 9px 0;
    padding-bottom:6px;
    border-bottom:1px solid #e5e5e5;
    font-size:16px;
    font-weight:600;
    color:#222222;
  }
  table {
    width:100%;
    border-collapse:collapse;
    margin:0;
    font-size:13px;
  }
  th, td {
    padding:7px 6px;
    border-bottom:1px solid #e6e6e6;
    text-align:left;
    vertical-align:top;
  }
  th {
    font-weight:600;
    color:#333333;
  }
  th:nth-child(2), td:nth-child(2) {
    text-align:center;
    white-space:nowrap;
  }
  th:nth-child(3), td:nth-child(3) {
    text-align:right;
    white-space:nowrap;
  }
  .note {
    margin-top:24px;
    padding-top:14px;
    border-top:1px solid #dddddd;
    font-size:13px;
    color:#555555;
  }
  .footer {
    margin-top:18px;
    padding-top:12px;
    border-top:1px solid #eeeeee;
    font-size:12px;
    color:#777777;
  }
  a { color:#333333; text-decoration:none; }




  
    Prime Tech Ware
    Current Inventory Update
  

  
    Hello,
    Please find our current inventory availability below.
    For specific quantities, quotations, product specifications, or stock confirmation, please contact our sales team.
  

  
    DDR4 Memory
    
      
        Product
        Available
        Unit Price
      
      
        32GB 2Rx4 PC4-2400T460$832GB 2Rx4 PC4-3200AA500$1016GB 2Rx8 PC4-3200AA500$6128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM70$8032GB Dual Rank x4 DDR4-2933 CAS-2190$1564GB Dual Rank x4 DDR4-2933 CAS-2150$2832GB Dual Rank x4 DDR4-3200 CAS-2259$1864GB Dual Rank x4 DDR4-3200 CAS-22100$32
      
    
    
    DDR5 / Server Memory
    
      
        Product
        Available
        Unit Price
      
      
        DDR5 64GB 4800MHz ECC RDIMM 2Rx4 P43331-B2116$510DDR5 64GB 5600MHz ECC RDIMM 2Rx4 P64707-B2119$700DDR4 64GB 3200MHz ECC RDIMM 2Rx4 SK Hynix25$360DDR5 64GB 4800MHz ECC RDIMM 2Rx4 Samsung25$470DDR5 64GB 5600MHz ECC RDIMM 2Rx4 SK Hynix20$430
      
    
    
    Cisco Networking
    
      
        Product
        Available
        Unit Price
      
      
        C9300-48T-A Cisco Catalyst 930012$490C9200-48P-A Cisco Catalyst 920010$180C9200L-48P-4G-E Cisco Catalyst 9200L15$120C9500-24Y4C-A Cisco Catalyst 95002$2,800N9K-C93180YC-FX Cisco Nexus 93180YC-FX10$400N9K-C93180YC-FX3 Cisco Nexus 93180YC-FX38$590N9K-C9336C-FX2 Cisco Nexus 9336C-FX23$2,400
      
    
    
    Cisco Collaboration Equipment
    
      
        Product
        Available
        Unit Price
      
      
        SPARK-BOARD70-K9 — Cisco Spark Board 70, Standard8$1,850SPARK-BOARD70-G-K9 — Cisco Spark Board 70, Global/GPL Variant5$1,950CS-BRD75P-K9 — Cisco Board Pro 753$10,200CS-BRD55P-K9 — Cisco Board Pro 553$5,900CS-ROOMBARPRO-K9 — Cisco Room Bar Pro5$2,950CS-ROOMBAR-K9 — Cisco Room Bar15$610CS-DESKPRO-K9 — Cisco Desk Pro9$1,100
      
    
    
    Lenovo ThinkSystem
    
      
        Product
        Available
        Unit Price
      
      
        ThinkSystem SR250 V3 — 1U Single-Socket Rack Server6$1,800ThinkSystem SR630 V3 — 1U Dual-Socket Rack Server8$3,500ThinkSystem SR650 V3 — 2U Dual-Socket Rack Server13$5,000ThinkSystem SR650a V3 — 2U Accelerated Server5$6,500ThinkSystem SR665 V3 — 2U Dual-Socket AMD Server6$7,500ThinkSystem SR645 V3 — 1U Dual-Socket AMD Server3$4,500ThinkSystem SR635 V3 — 1U Single-Socket AMD Server8$3,500ThinkSystem SR675 V3 — 2U Accelerated/GPU-Capable Server10$8,000
      
    
    
    NVIDIA GPUs
    
      
        Product
        Available
        Unit Price
      
      
        NVIDIA H100 PCIe — 80GB HBM36$19,300NVIDIA H200 PCIe/NVL — 141GB HBM3e4$21,500NVIDIA L40S — 48GB GDDR67$3,500NVIDIA RTX PRO 6000 Blackwell Server Edition — 96GB GDDR7 ECC2$9,900NVIDIA RTX PRO 6000 Blackwell Workstation Edition — 96GB GDDR73$3,900NVIDIA B200 — 180GB HBM3e3$22,000NVIDIA RTX 6000 Ada — 48GB GDDR6 ECC10$2,100NVIDIA A100 — 40GB/80GB15$2,000NVIDIA L4 — 24GB GDDR617$970
      
    
    

  
    Inventory and pricing are subject to availability and prior sale.
    Please confirm current stock and pricing before placing an order.
  

  
    Martin Liam
    Prime Tech Ware
    sales@primetechware.com
    +1 909 435 4982 &nbsp; | &nbsp; +1 909 552 6526
    primetechware.com
  




--13807f1d78f2b24c954e8f5b63cabd6ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Prime Tech Ware | Inventory Update</title>
<style>
  body {
    margin:0;
    padding:0;
    background:#ffffff;
    color:#333333;
    font-family:Arial,Helvetica,sans-serif;
    font-size:14px;
    line-height:1.5;
  }
  .wrap {
    width:100%;
    max-width:680px;
    margin:0 auto;
    padding:24px 16px;
    box-sizing:border-box;
  }
  .header {
    padding-bottom:16px;
    border-bottom:1px solid #dddddd;
  }
  .company {
    font-size:20px;
    font-weight:600;
    color:#222222;
  }
  .subject {
    margin-top:4px;
    color:#666666;
    font-size:13px;
  }
  p { margin:0 0 12px 0; }
  h2 {
    margin:24px 0 9px 0;
    padding-bottom:6px;
    border-bottom:1px solid #e5e5e5;
    font-size:16px;
    font-weight:600;
    color:#222222;
  }
  table {
    width:100%;
    border-collapse:collapse;
    margin:0;
    font-size:13px;
  }
  th, td {
    padding:7px 6px;
    border-bottom:1px solid #e6e6e6;
    text-align:left;
    vertical-align:top;
  }
  th {
    font-weight:600;
    color:#333333;
  }
  th:nth-child(2), td:nth-child(2) {
    text-align:center;
    white-space:nowrap;
  }
  th:nth-child(3), td:nth-child(3) {
    text-align:right;
    white-space:nowrap;
  }
  .note {
    margin-top:24px;
    padding-top:14px;
    border-top:1px solid #dddddd;
    font-size:13px;
    color:#555555;
  }
  .footer {
    margin-top:18px;
    padding-top:12px;
    border-top:1px solid #eeeeee;
    font-size:12px;
    color:#777777;
  }
  a { color:#333333; text-decoration:none; }
</style>
</head>
<body>
<div class="wrap">
  <div class="header">
    <div class="company">Prime Tech Ware</div>
    <div class="subject">Current Inventory Update</div>
  </div>

  <div style="padding-top:18px;">
    <p>Hello,</p>
    <p>Please find our current inventory availability below.</p>
    <p>For specific quantities, quotations, product specifications, or stock confirmation, please contact our sales team.</p>
  </div>

  
    <h2>DDR4 Memory</h2>
    <table role="table">
      <thead><tr>
        <th scope="col">Product</th>
        <th scope="col">Available</th>
        <th scope="col">Unit Price</th>
      </tr></thead>
      <tbody>
        <tr><td>32GB 2Rx4 PC4-2400T</td><td>460</td><td>$8</td></tr><tr><td>32GB 2Rx4 PC4-3200AA</td><td>500</td><td>$10</td></tr><tr><td>16GB 2Rx8 PC4-3200AA</td><td>500</td><td>$6</td></tr><tr><td>128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM</td><td>70</td><td>$80</td></tr><tr><td>32GB Dual Rank x4 DDR4-2933 CAS-21</td><td>90</td><td>$15</td></tr><tr><td>64GB Dual Rank x4 DDR4-2933 CAS-21</td><td>50</td><td>$28</td></tr><tr><td>32GB Dual Rank x4 DDR4-3200 CAS-22</td><td>59</td><td>$18</td></tr><tr><td>64GB Dual Rank x4 DDR4-3200 CAS-22</td><td>100</td><td>$32</td></tr>
      </tbody>
    </table>
    
    <h2>DDR5 / Server Memory</h2>
    <table role="table">
      <thead><tr>
        <th scope="col">Product</th>
        <th scope="col">Available</th>
        <th scope="col">Unit Price</th>
      </tr></thead>
      <tbody>
        <tr><td>DDR5 64GB 4800MHz ECC RDIMM 2Rx4 P43331-B21</td><td>16</td><td>$510</td></tr><tr><td>DDR5 64GB 5600MHz ECC RDIMM 2Rx4 P64707-B21</td><td>19</td><td>$700</td></tr><tr><td>DDR4 64GB 3200MHz ECC RDIMM 2Rx4 SK Hynix</td><td>25</td><td>$360</td></tr><tr><td>DDR5 64GB 4800MHz ECC RDIMM 2Rx4 Samsung</td><td>25</td><td>$470</td></tr><tr><td>DDR5 64GB 5600MHz ECC RDIMM 2Rx4 SK Hynix</td><td>20</td><td>$430</td></tr>
      </tbody>
    </table>
    
    <h2>Cisco Networking</h2>
    <table role="table">
      <thead><tr>
        <th scope="col">Product</th>
        <th scope="col">Available</th>
        <th scope="col">Unit Price</th>
      </tr></thead>
      <tbody>
        <tr><td>C9300-48T-A Cisco Catalyst 9300</td><td>12</td><td>$490</td></tr><tr><td>C9200-48P-A Cisco Catalyst 9200</td><td>10</td><td>$180</td></tr><tr><td>C9200L-48P-4G-E Cisco Catalyst 9200L</td><td>15</td><td>$120</td></tr><tr><td>C9500-24Y4C-A Cisco Catalyst 9500</td><td>2</td><td>$2,800</td></tr><tr><td>N9K-C93180YC-FX Cisco Nexus 93180YC-FX</td><td>10</td><td>$400</td></tr><tr><td>N9K-C93180YC-FX3 Cisco Nexus 93180YC-FX3</td><td>8</td><td>$590</td></tr><tr><td>N9K-C9336C-FX2 Cisco Nexus 9336C-FX2</td><td>3</td><td>$2,400</td></tr>
      </tbody>
    </table>
    
    <h2>Cisco Collaboration Equipment</h2>
    <table role="table">
      <thead><tr>
        <th scope="col">Product</th>
        <th scope="col">Available</th>
        <th scope="col">Unit Price</th>
      </tr></thead>
      <tbody>
        <tr><td>SPARK-BOARD70-K9 — Cisco Spark Board 70, Standard</td><td>8</td><td>$1,850</td></tr><tr><td>SPARK-BOARD70-G-K9 — Cisco Spark Board 70, Global/GPL Variant</td><td>5</td><td>$1,950</td></tr><tr><td>CS-BRD75P-K9 — Cisco Board Pro 75</td><td>3</td><td>$10,200</td></tr><tr><td>CS-BRD55P-K9 — Cisco Board Pro 55</td><td>3</td><td>$5,900</td></tr><tr><td>CS-ROOMBARPRO-K9 — Cisco Room Bar Pro</td><td>5</td><td>$2,950</td></tr><tr><td>CS-ROOMBAR-K9 — Cisco Room Bar</td><td>15</td><td>$610</td></tr><tr><td>CS-DESKPRO-K9 — Cisco Desk Pro</td><td>9</td><td>$1,100</td></tr>
      </tbody>
    </table>
    
    <h2>Lenovo ThinkSystem</h2>
    <table role="table">
      <thead><tr>
        <th scope="col">Product</th>
        <th scope="col">Available</th>
        <th scope="col">Unit Price</th>
      </tr></thead>
      <tbody>
        <tr><td>ThinkSystem SR250 V3 — 1U Single-Socket Rack Server</td><td>6</td><td>$1,800</td></tr><tr><td>ThinkSystem SR630 V3 — 1U Dual-Socket Rack Server</td><td>8</td><td>$3,500</td></tr><tr><td>ThinkSystem SR650 V3 — 2U Dual-Socket Rack Server</td><td>13</td><td>$5,000</td></tr><tr><td>ThinkSystem SR650a V3 — 2U Accelerated Server</td><td>5</td><td>$6,500</td></tr><tr><td>ThinkSystem SR665 V3 — 2U Dual-Socket AMD Server</td><td>6</td><td>$7,500</td></tr><tr><td>ThinkSystem SR645 V3 — 1U Dual-Socket AMD Server</td><td>3</td><td>$4,500</td></tr><tr><td>ThinkSystem SR635 V3 — 1U Single-Socket AMD Server</td><td>8</td><td>$3,500</td></tr><tr><td>ThinkSystem SR675 V3 — 2U Accelerated/GPU-Capable Server</td><td>10</td><td>$8,000</td></tr>
      </tbody>
    </table>
    
    <h2>NVIDIA GPUs</h2>
    <table role="table">
      <thead><tr>
        <th scope="col">Product</th>
        <th scope="col">Available</th>
        <th scope="col">Unit Price</th>
      </tr></thead>
      <tbody>
        <tr><td>NVIDIA H100 PCIe — 80GB HBM3</td><td>6</td><td>$19,300</td></tr><tr><td>NVIDIA H200 PCIe/NVL — 141GB HBM3e</td><td>4</td><td>$21,500</td></tr><tr><td>NVIDIA L40S — 48GB GDDR6</td><td>7</td><td>$3,500</td></tr><tr><td>NVIDIA RTX PRO 6000 Blackwell Server Edition — 96GB GDDR7 ECC</td><td>2</td><td>$9,900</td></tr><tr><td>NVIDIA RTX PRO 6000 Blackwell Workstation Edition — 96GB GDDR7</td><td>3</td><td>$3,900</td></tr><tr><td>NVIDIA B200 — 180GB HBM3e</td><td>3</td><td>$22,000</td></tr><tr><td>NVIDIA RTX 6000 Ada — 48GB GDDR6 ECC</td><td>10</td><td>$2,100</td></tr><tr><td>NVIDIA A100 — 40GB/80GB</td><td>15</td><td>$2,000</td></tr><tr><td>NVIDIA L4 — 24GB GDDR6</td><td>17</td><td>$970</td></tr>
      </tbody>
    </table>
    

  <div class="note">
    Inventory and pricing are subject to availability and prior sale.
    Please confirm current stock and pricing before placing an order.
  </div>

  <div class="footer">
    <strong>Martin Liam</strong><br>
    Prime Tech Ware<br>
    <a href="mailto:sales@primetechware.com">sales@primetechware.com</a><br>
    +1 909 435 4982 &nbsp; | &nbsp; +1 909 552 6526<br>
    <a href="https://primetechware.com">primetechware.com</a>
  </div>
</div>
</body>
</html>



--13807f1d78f2b24c954e8f5b63cabd6ee--

