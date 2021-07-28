Return-Path: <SRS0=k5hF=MU=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A6BC4338F
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Jul 2021 17:01:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A5BD560FED; Wed, 28 Jul 2021 17:01:21 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E15B6054F;
	Wed, 28 Jul 2021 17:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E15B6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=intel.com
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="276492190"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208,217";a="276492190"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 10:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208,217";a="663552629"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2021 10:01:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 10:01:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 10:01:14 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2242.010;
 Wed, 28 Jul 2021 10:01:14 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Kyle
 McMartin" <kyle@mcmartin.ca>, "ben@decadent.org.uk" <ben@decadent.org.uk>,
	Josh Boyer <jwboyer@kernel.org>
Subject: i915  DMC  Updates - TGL:v2.12 and RKL v2.03
Thread-Topic: i915  DMC  Updates - TGL:v2.12 and RKL v2.03
Thread-Index: AdeD0ddoP2AWrs6LS1Kzx5z+lW0M4Q==
Date: Wed, 28 Jul 2021 17:01:13 +0000
Message-ID: <501e28bddabb4214a3c0c9f7fa8f320a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: multipart/alternative;
	boundary="_000_501e28bddabb4214a3c0c9f7fa8f320aintelcom_"
MIME-Version: 1.0

--_000_501e28bddabb4214a3c0c9f7fa8f320aintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Kindly pull these updates from i915.

The following changes since commit 168452ee695b5edb9deb641059bc110b9c5e8fc7=
:

  Merge tag 'iwlwifi-fw-2021-07-19' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/iwlwifi/linux-firmware into main (2021-07-19 14:35:47 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-firmware tgl_rkl_dmc_updates

for you to fetch changes up to 6c9fd94d41310443ea4ff782ce1545e49e74221c:

  i915: Add v2.03 DMC for RKL (2021-07-28 09:45:27 -0700)

----------------------------------------------------------------
Anusha Srivatsa (2):
      i915: Add v2.12 DMC for TGL
     i915: Add v2.03 DMC for RKL

WHENCE                   |   6 ++++++
i915/rkl_dmc_ver2_03.bin | Bin 0 -> 18476 bytes
i915/tgl_dmc_ver2_12.bin | Bin 0 -> 19760 bytes
3 files changed, 6 insertions(+)
create mode 100644 i915/rkl_dmc_ver2_03.bin
create mode 100644 i915/tgl_dmc_ver2_12.bin

Thanks,
Anusha

--_000_501e28bddabb4214a3c0c9f7fa8f320aintelcom_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">Kindly pull these updates from i915.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 168452ee695b5edb9=
deb641059bc110b9c5e8fc7:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; Merge tag 'iwlwifi-fw-2021-07-19' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware into main (202=
1-07-19 14:35:47 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; git://anongit.freedesktop.org/drm/drm-firmwar=
e tgl_rkl_dmc_updates<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 6c9fd94d41310443ea4ff=
782ce1545e49e74221c:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; i915: Add v2.03 DMC for RKL (2021-07-28 09:45=
:27 -0700)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha Srivatsa (2):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i915: Add v2.12 DMC f=
or TGL<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i915: Add v2.03 DMC fo=
r RKL<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp=
; 6 &#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoNormal">i915/rkl_dmc_ver2_03.bin | Bin 0 -&gt; 18476 bytes<o=
:p></o:p></p>
<p class=3D"MsoNormal">i915/tgl_dmc_ver2_12.bin | Bin 0 -&gt; 19760 bytes<o=
:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 6 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 i915/rkl_dmc_ver2_03.bin<o:p></o:=
p></p>
<p class=3D"MsoNormal">create mode 100644 i915/tgl_dmc_ver2_12.bin<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Anusha<o:p></o:p></p>
</div>
</body>
</html>

--_000_501e28bddabb4214a3c0c9f7fa8f320aintelcom_--
