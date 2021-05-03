Return-Path: <SRS0=as9S=J6=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F8DC433B4
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 21:42:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF387611CD; Mon,  3 May 2021 21:42:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C3761283;
	Mon,  3 May 2021 21:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C3761283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: vGp+3bINPmoiJCgBxE4axtDgCRvfVPE7/rArDHMXOQB6e1Mo7OrMSxsCH6TNSz3h+X3Bw0a8pH
 F0Y3TBMDVYug==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197934439"
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; 
   d="scan'208,217";a="197934439"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 14:42:30 -0700
IronPort-SDR: hjKuEr6YfPsgyDSHFOtVlwu8+JjnLRVCE+flafai5TYmGcFe7kmnfEbYZ5l1z3u1iTLG1DMZn+
 W2bYOJpBOBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; 
   d="scan'208,217";a="618205582"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga006.fm.intel.com with ESMTP; 03 May 2021 14:42:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 3 May 2021 14:42:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 3 May 2021 14:42:29 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.013;
 Mon, 3 May 2021 14:42:29 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Josh Boyer <jwboyer@kernel.org>, "'kyle@kernel.org'" <kyle@kernel.org>,
	"ben@decadent.org.uk" <ben@decadent.org.uk>
Subject: I915 Firmware update
Thread-Topic: I915 Firmware update
Thread-Index: AddAZOysDB8B8JpmTLGLi8oeNanvhw==
Date: Mon, 3 May 2021 21:42:28 +0000
Message-ID: <42c5b2447ab6474f922638c5dfc24f37@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: multipart/alternative;
	boundary="_000_42c5b2447ab6474f922638c5dfc24f37intelcom_"
MIME-Version: 1.0

--_000_42c5b2447ab6474f922638c5dfc24f37intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Resending the PR with WHENCE file entries.

Requesting to add the updates to linux-firmware repo.

The following changes since commit 3f23f5125b1fef5ed2103c0236a5657966e30e4d=
:

  amdgpu: add new polaris 12 MC firmware (2021-05-03 09:26:38 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware adlp_dmc_firmware

for you to fetch changes up to 3d32f216e153b0365132592910efcbfa2533066f:

  i915: Add ADL-P DMC Support (2021-05-03 14:34:52 -0700)

----------------------------------------------------------------
Anusha Srivatsa (1):
      i915: Add ADL-P DMC Support

WHENCE                    |   6 ++++++
i915/adlp_dmc_ver2_09.bin | Bin 0 -> 44636 bytes
i915/adlp_dmc_ver2_10.bin | Bin 0 -> 44616 bytes
3 files changed, 6 insertions(+)
create mode 100644 i915/adlp_dmc_ver2_09.bin
create mode 100644 i915/adlp_dmc_ver2_10.bin

Thanks,
Anusha

--_000_42c5b2447ab6474f922638c5dfc24f37intelcom_
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
<p class=3D"MsoNormal">Resending the PR with WHENCE file entries.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><br>
Requesting to add the updates to linux-firmware repo.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 3f23f5125b1fef5ed=
2103c0236a5657966e30e4d:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; amdgpu: add new polaris 12 MC firmware (2021-=
05-03 09:26:38 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; git://anongit.freedesktop.org/drm/drm-firmwar=
e adlp_dmc_firmware<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 3d32f216e153b03651325=
92910efcbfa2533066f:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; i915: Add ADL-P DMC Support (2021-05-03 14:34=
:52 -0700)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha Srivatsa (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add ADL-P DMC S=
upport<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
;&nbsp; 6 &#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">i915/adlp_dmc_ver2_09.bin | Bin 0 -&gt; 44636 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">i915/adlp_dmc_ver2_10.bin | Bin 0 -&gt; 44616 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 6 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/adlp_dmc_ver2_09.bin<o:p></o=
:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/adlp_dmc_ver2_10.bin<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha<o:p></o:p></p>
</div>
</body>
</html>

--_000_42c5b2447ab6474f922638c5dfc24f37intelcom_--
