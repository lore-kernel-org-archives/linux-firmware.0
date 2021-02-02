Return-Path: <SRS0=uJUH=HE=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CC9C433E0
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Feb 2021 00:49:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3313364D5D; Tue,  2 Feb 2021 00:49:26 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECA964EAA
	for <linux-firmware@kernel.org>; Tue,  2 Feb 2021 00:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ECA964EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: 6djRKk/ImgsHRMTMs3H7Jy+AHGAXRCB9/fMqly1db90V/egvfrag3eiX+6zVqz6qnkrdKABHx2
 urhA3Yc4F9Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="244858797"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208,217";a="244858797"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 16:49:25 -0800
IronPort-SDR: BGsy98cjowRchdN6/I+6tl3fU3b+MxOdE1VnaVW60kNud6j6qtPQkmApzT/vUAGGAom5N1Za5D
 Gv3Jl6hrLerw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208,217";a="578099749"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2021 16:49:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:49:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Feb 2021 16:49:24 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.002;
 Mon, 1 Feb 2021 16:49:24 -0800
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Kyle McMartin <kyle@mcmartin.ca>, "ben@decadent.org.uk"
	<ben@decadent.org.uk>
Subject: I915 Update - ADLS(dmc), DG1(GuC, HuC)
Thread-Topic: I915 Update - ADLS(dmc), DG1(GuC, HuC)
Thread-Index: Adb4/PP2tsg17x6CSV+7Ubau+LgHLw==
Date: Tue, 2 Feb 2021 00:49:22 +0000
Message-ID: <6ac7d05dfec24e8abff678f47f27f6a1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: multipart/alternative;
	boundary="_000_6ac7d05dfec24e8abff678f47f27f6a1intelcom_"
MIME-Version: 1.0

--_000_6ac7d05dfec24e8abff678f47f27f6a1intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sending some i915 updates to be pulled in upstream.

The following changes since commit 05789708b79b38eb0f1a20d8449b4eb56d39b39f=
:

  brcm: Link RPi4's WiFi firmware with DMI machine name. (2021-01-19 07:42:=
43 -0500)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware DG1-guc-huc-ADLS-dmc

for you to fetch changes up to 348d8a9740930e7b8bd83a36baba40c5cfc3f8be:

  i915: Add DMC v2.01 for ADL-S (2021-01-29 11:43:12 -0800)

----------------------------------------------------------------
Anusha Srivatsa (3):
      i915: Add GuC v49.0.1 for DG1
      i915: Add HuC v7.7.1 for DG1
      i915: Add DMC v2.01 for ADL-S

WHENCE                    |   9 +++++++++
i915/adls_dmc_ver2_01.bin | Bin 0 -> 18704 bytes
i915/dg1_guc_49.0.1.bin   | Bin 0 -> 311872 bytes
i915/dg1_huc_7.7.1.bin    | Bin 0 -> 582400 bytes
4 files changed, 9 insertions(+)
create mode 100644 i915/adls_dmc_ver2_01.bin
create mode 100644 i915/dg1_guc_49.0.1.bin
create mode 100644 i915/dg1_huc_7.7.1.bin


Thanks,
Anusha


--_000_6ac7d05dfec24e8abff678f47f27f6a1intelcom_
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
<p class=3D"MsoNormal">Sending some i915 updates to be pulled in upstream.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 05789708b79b38eb0=
f1a20d8449b4eb56d39b39f:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; brcm: Link RPi4's WiFi firmware with DMI mach=
ine name. (2021-01-19 07:42:43 -0500)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; git://anongit.freedesktop.org/drm/drm-firmwar=
e DG1-guc-huc-ADLS-dmc<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 348d8a9740930e7b8bd83=
a36baba40c5cfc3f8be:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; i915: Add DMC v2.01 for ADL-S (2021-01-29 11:=
43:12 -0800)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha Srivatsa (3):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add GuC v49.0.1=
 for DG1<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add HuC v7.7.1 =
for DG1<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add DMC v2.01 f=
or ADL-S<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
;&nbsp; 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">i915/adls_dmc_ver2_01.bin | Bin 0 -&gt; 18704 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">i915/dg1_guc_49.0.1.bin&nbsp;&nbsp; | Bin 0 -&gt; 31=
1872 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">i915/dg1_huc_7.7.1.bin&nbsp;&nbsp;&nbsp; | Bin 0 -&g=
t; 582400 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">4 files changed, 9 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/adls_dmc_ver2_01.bin<o:p></o=
:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/dg1_guc_49.0.1.bin<o:p></o:p=
></p>
<p class=3D"MsoNormal">create mode 100644 i915/dg1_huc_7.7.1.bin<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_6ac7d05dfec24e8abff678f47f27f6a1intelcom_--
