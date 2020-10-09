Return-Path: <SRS0=ZUot=DQ=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F1EC433E7
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2020 18:41:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C2EF222B9; Fri,  9 Oct 2020 18:41:48 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB7922284
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2020 18:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB7922284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: 3p8IR4iOAhlV051v0bdZEfofHng6itBaNHDe5UASnV4gWxX1i1My0Esh7/sQb6jWg9sILiB+nJ
 yEhOBTqkIeIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182969286"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208,217";a="182969286"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 11:41:47 -0700
IronPort-SDR: +LKNdB/fJdhIcZbKXlQgvIbzNo7r0FmSqu9kzJgxrcWb3JXidR/YyDPajDitwQ/KWzcUbM9l/i
 oWo06nNSN53Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208,217";a="328991074"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga002.jf.intel.com with ESMTP; 09 Oct 2020 11:41:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 11:41:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 9 Oct 2020 11:41:45 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Fri, 9 Oct 2020 11:41:45 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Kyle McMartin <kyle@mcmartin.ca>, "'ben@decadent.org.uk'"
	<ben@decadent.org.uk>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>
Subject: i915 Update : DG1 DMC
Thread-Topic: i915 Update : DG1 DMC
Thread-Index: Adaea4W6Jtrfz8J7RqGJot9NVZc0zQ==
Date: Fri, 9 Oct 2020 18:41:45 +0000
Message-ID: <3997663f047e4ab68fca41e3c8a05671@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: multipart/alternative;
	boundary="_000_3997663f047e4ab68fca41e3c8a05671intelcom_"
MIME-Version: 1.0

--_000_3997663f047e4ab68fca41e3c8a05671intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kyle, Ben,

Please add the i915 updates to linux-firmware from branch dg1_dmc_v2_02

The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96=
:

  ice: Add comms package file for Intel E800 series driver (2020-10-05 08:0=
9:03 -0400)

are available in the Git repository at: dg1_dmc_v2_02

  git://anongit.freedesktop.org/drm/drm-firmware dg1_dmc_v2_02

for you to fetch changes up to a140ef3eb3746aba2c897db16e02ffb5ffa9e7a2:

  i915: Add DG1 DMC v2.02 (2020-10-08 12:13:33 -0700)

----------------------------------------------------------------
Anusha Srivatsa (1):
      i915: Add DG1 DMC v2.02

WHENCE                   |   2 ++
i915/dg1_dmc_ver2_02.bin | Bin 0 -> 16624 bytes
2 files changed, 2 insertions(+)
create mode 100644 i915/dg1_dmc_ver2_02.bin

Thanks,
Anusha

--_000_3997663f047e4ab68fca41e3c8a05671intelcom_
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
	margin-bottom:.0001pt;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Kyle, Ben,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please add the i915 updates to linux-firmware from b=
ranch <b>
dg1_dmc_v2_02</b><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 58d41d0facca2478d=
3e45f6321224361519aee96:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; ice: Add comms package file for Intel E800 se=
ries driver (2020-10-05 08:09:03 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at: dg1_dmc_v2_0=
2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; git://anongit.freedesktop.org/drm/drm-firmwar=
e dg1_dmc_v2_02<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to a140ef3eb3746aba2c897=
db16e02ffb5ffa9e7a2:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; i915: Add DG1 DMC v2.02 (2020-10-08 12:13:33 =
-0700)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha Srivatsa (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add DG1 DMC v2.=
02<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp=
; 2 &#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">i915/dg1_dmc_ver2_02.bin | Bin 0 -&gt; 16624 bytes<o=
:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 2 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/dg1_dmc_ver2_02.bin<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha<o:p></o:p></p>
</div>
</body>
</html>

--_000_3997663f047e4ab68fca41e3c8a05671intelcom_--
