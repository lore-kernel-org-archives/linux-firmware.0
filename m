Return-Path: <SRS0=HipO=JY=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6B0C433ED
	for <linux-firmware@archiver.kernel.org>; Tue, 27 Apr 2021 22:04:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B979A613BC; Tue, 27 Apr 2021 22:04:21 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536E5613B4;
	Tue, 27 Apr 2021 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536E5613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: YOB4YmYBhGeartHNM3JZDMAWgKB6Nm/LJ4P1NFsmLH8NW4U1APonJJYiouGQm1BZ2+PAiOzKei
 vgWCNc3VfuGw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="184081410"
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208,217";a="184081410"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2021 15:04:09 -0700
IronPort-SDR: sejKn0mhrUHSP6ijoNfBhlAlYXfFicEgUnaBI+AhYwfZy24l4rrYZChQVF+OzWxpwRWJ3KDddr
 0uvG4UJh4qbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,256,1613462400"; 
   d="scan'208,217";a="604656826"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2021 15:04:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 15:04:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 15:04:08 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.013;
 Tue, 27 Apr 2021 15:04:08 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "ben@decadent.org.uk" <ben@decadent.org.uk>, Kyle McMartin
	<kyle@mcmartin.ca>, Josh Boyer <jwboyer@kernel.org>
Subject: I915 updates to be pulled to linux-firmware
Thread-Topic: I915 updates to be pulled to linux-firmware
Thread-Index: Adc7sTBBiM+CNTIxTZCi4iLVgJTXhA==
Date: Tue, 27 Apr 2021 22:04:08 +0000
Message-ID: <e3fb2ef55263454495ed8b4aabfa77be@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: multipart/alternative;
	boundary="_000_e3fb2ef55263454495ed8b4aabfa77beintelcom_"
MIME-Version: 1.0

--_000_e3fb2ef55263454495ed8b4aabfa77beintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sending PR for ADL-P:

The following changes since commit fa0efeff4894e36b9c3964376f2c99fae101d147=
:

  linux-firmware: Update firmware file for Intel Bluetooth AX210 (2021-04-2=
6 07:00:56 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware adlp_firmware

for you to fetch changes up to 726645d0915c8506b491db23d3103f0027055ac5:

  i915: Add ADL-P DMC Support (2021-04-27 09:32:13 -0700)

----------------------------------------------------------------
Anusha Srivatsa (1):
      i915: Add ADL-P DMC Support

i915/adlp_dmc_ver2_09.bin | Bin 0 -> 44636 bytes
i915/adlp_dmc_ver2_10.bin | Bin 0 -> 44616 bytes
2 files changed, 0 insertions(+), 0 deletions(-)
create mode 100644 i915/adlp_dmc_ver2_09.bin
create mode 100644 i915/adlp_dmc_ver2_10.bin


Thanks,
Anusha

--_000_e3fb2ef55263454495ed8b4aabfa77beintelcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Sending PR for ADL-P:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit fa0efeff4894e36b9=
c3964376f2c99fae101d147:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; linux-firmware: Update firmware file for Inte=
l Bluetooth AX210 (2021-04-26 07:00:56 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; git://anongit.freedesktop.org/drm/drm-firmwar=
e adlp_firmware<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 726645d0915c8506b491d=
b23d3103f0027055ac5:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; i915: Add ADL-P DMC Support (2021-04-27 09:32=
:13 -0700)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha Srivatsa (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add ADL-P DMC S=
upport<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">i915/adlp_dmc_ver2_09.bin | Bin 0 -&gt; 44636 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">i915/adlp_dmc_ver2_10.bin | Bin 0 -&gt; 44616 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 0 insertions(&#43;), 0 deletions(-)=
<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/adlp_dmc_ver2_09.bin<o:p></o=
:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/adlp_dmc_ver2_10.bin<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha<o:p></o:p></p>
</div>
</body>
</html>

--_000_e3fb2ef55263454495ed8b4aabfa77beintelcom_--
