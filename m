Return-Path: <SRS0=/8x1=2D=nysrs.cn=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D3DC83F1A
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Jul 2025 05:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4056BC4CEF1; Tue, 22 Jul 2025 05:11:57 +0000 (UTC)
Received: from out208-109.dm.aliyun.com (out208-109.dm.aliyun.com [140.205.208.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38D58C4CEEB
	for <linux-firmware@kernel.org>; Tue, 22 Jul 2025 05:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38D58C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nysrs.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nysrs.cn
X-AliDM-RcptTo: bGludXgtZmlybXdhcmVAa2VybmVsLm9yZw==
Feedback-ID: default:daniel@nysrs.cn:alibabak_SmtpBatch:265526
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nysrs.cn; s=aliyun-cn-hangzhou;
	t=1753161110; h=Date:To:From:Subject:Message-ID:List-Unsubscribe:List-Unsubscribe-Post:MIME-Version:Content-Type;
	bh=Yy/MIVt1vw3n6Uwlmgm0c6Rwg+Qa0X5dWSGtakMTAXc=;
	b=oqgtKm0tU4Sy4327gZTZ5QU4M2bqVjDol7xpnhfqTHwJj9ikaXj8O8EdExzkLDKW+BMvQzRlxfaYHHxqSElQJFa3ehjNs9koQAHuFEnjdAF0xTFp6cmpNBZAyQygJ68pyHgGTUwC6I508SRnNJaAMOT2fFezpct1SBFiRNojVT4=
Received: from iZ8vbd0h23t71ihh44qyb4Z(mailfrom:daniel@nysrs.cn fp:SMTPD_-VHcEAmy35j cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Tue, 22 Jul 2025 13:11:49 +0800
X-EnvId: 600000210482516484
Date: Tue, 22 Jul 2025 13:11:49 +0800
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Jakie Feng <daniel@nysrs.cn>
Reply-To: Jakie Feng <jakie.feng@proto-mfg.cn>
Subject: China's high-quality CNC custom parts supplier - <13:11:49.632 22/07/2025>
Message-ID: <92f28f18-ce79-52a7-faa9-687f1d7ce4b8@wheat>
X-Mailer: SeaMonkey-Mailagent revision 2 [W10_21H2][v2.53][Gecko]
51WHEATSEARCH-MESSAGE-ID: 92f28f18-ce79-52a7-faa9-687f1d7ce4b8@wheat
List-Unsubscribe: <https://dm-de.aliyuncs.com/trace/v1/report?bid=1&env=2353161313&mac=265527&mf=daniel%40nysrs.cn&msgid=92f28f18-ce79-52a7-faa9-687f1d7ce4b8%40wheat&sac=0&tag=prod&tid=&to=linux-firmware%40kernel.org&tpl=&ts=1753161109&type=0&url=https%3A%2F%2Ftinyurl.com%2F5cyxzcsd%2Ftrack.php%3Fevent%3Dunsubscribe%26emailId%3D1453844373%26token%3DeyJlbnYiOiJwcm8iLCJlbWFpbElkIjoiMTQ1Mzg0NDM3MyJ9&v=1.0&sign=YmlkPTEmZW52PTIzNTMxNjEzMTMmbWFjPTI2NTUyNyZtZj1kYW5pZWwlNDBueXNycy5jbiZtc2dpZD05MmYyOGYxOC1jZTc5LTUyYTctZmFhOS02ODdmMWQ3Y2U0YjglNDB3aGVhdCZzYWM9MCZ0YWc9cHJvZCZ0aWQ9JnRvPWxpbnV4LWZpcm13YXJlJTQwa2VybmVsLm9yZyZ0cGw9JnRzPTE3NTMxNjExMDkmdHlwZT0wJnVybD1odHRwcyUzQSUyRiUyRnRpbnl1cmwuY29tJTJGNWN5eHpjc2QlMkZ0cmFjay5waHAlM0ZldmVudCUzRHVuc3Vic2NyaWJlJTI2ZW1haWxJZCUzRDE0NTM4NDQzNzMlMjZ0b2tlbiUzRGV5SmxibllpT2lKd2NtOGlMQ0psYldGcGJFbGtJam9pTVRRMU16ZzBORE0zTXlKOSZ2PTEuMCZ1cmx0cz0xNzUzMTYxMTA5&urlts=1753161109>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_EOqv0PFqHLGdl1yGr1TDs23NAcyKC121wkbNsyXog"

--b1=_EOqv0PFqHLGdl1yGr1TDs23NAcyKC121wkbNsyXog
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Greetings,=0A=0AI hope this message finds you well.Allow me to briefly intr=
oduce us-PROTO MFG.=0A=0A&nbsp;=0A=0AWe are Proto MFG, specialize in&nbsp;C=
NC machining, sheet metal fabrication, and injection molding&nbsp;with over=
 10 years of industry experience.&nbsp;=0A=0AOur parts are widely used in m=
echanical, automotive, aerospace and fields=0A=0AWhy choose PROTO MFG?  Cer=
tified Quality : We are&nbsp;ISO9001 and ISO13485&nbsp;, ensuring that our =
products meet high standards of quality, stability, and reliability. Effici=
ent delivery:The delivery time is usually 7 days to half a month.   Trusted=
 by Industry Leaders : We are a direct supplier to renowned brands such as&=
nbsp;Tesla, Archer, and Schneider Electric. Learn much about...=0A=0AIf you=
 need an inquiry, send the quotation to my email address.=0A=0A&nbsp;=0A=0A=
&nbsp;
--b1=_EOqv0PFqHLGdl1yGr1TDs23NAcyKC121wkbNsyXog
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p style=3D"line-height: 1;">Greetings,</p> <p style=3D"line-height: 1;">I =
hope this message finds you well.Allow me to briefly introduce us-PROTO MFG=
.</p> <p>&nbsp;</p> <p style=3D"line-height: 1;">We are Proto MFG, speciali=
ze in<strong>&nbsp;CNC machining, sheet metal fabrication, and injection mo=
lding</strong>&nbsp;with over 10 years of industry experience.&nbsp;</p> <p=
 style=3D"line-height: 1;">Our parts are widely used in mechanical, automot=
ive, aerospace and fields</p> <p style=3D"line-height: 1;"><strong>Why choo=
se PROTO MFG?</strong></p> <ol> <li><span style=3D"font-size: 16px;"><stron=
g>Certified Quality</strong></span>: We are<strong>&nbsp;ISO9001 and ISO134=
85</strong>&nbsp;, ensuring that our products meet high standards of qualit=
y, stability, and reliability.</li> <li><span style=3D"font-size: 16px;"><s=
trong>Efficient delivery:</strong><span style=3D"font-size: 14px;">The deli=
very time is usually 7 days to half a month.</span></span></li> <li><span s=
tyle=3D"font-size: 16px;"><strong>Trusted by Industry Leaders</strong></spa=
n>: We are a direct supplier to renowned brands such as&nbsp;<strong>Tesla,=
 Archer, and Schneider Electric.</strong></li> <li><strong>Learn much about=
...</strong></li> </ol> <p style=3D"line-height: 1;">If you need an inquiry=
, send the quotation to my email address.</p> <p style=3D"line-height: 1;">=
&nbsp;</p> <p style=3D"line-height: 1;">&nbsp;</p><img src=3D'https://dm-sg=
.aliyuncs.com/trace/v1/report?bid=3D1&env=3D2353161313&mac=3D265527&mf=3Dda=
niel%40nysrs.cn&msgid=3D92f28f18-ce79-52a7-faa9-687f1d7ce4b8%40wheat&sac=3D=
0&tag=3Dprod&tid=3D&to=3Dlinux-firmware%40kernel.org&tpl=3D&ts=3D1753161109=
&type=3D0&url=3Dhttps%3A%2F%2Ftinyurl.com%2F5cyxzcsd%2Ftrack.php%3Fevent%3D=
open%26emailId%3D1453844373%26token%3DeyJlbnYiOiJwcm8iLCJlbWFpbElkIjoiMTQ1M=
zg0NDM3MyJ9&v=3D1.0&sign=3DYmlkPTEmZW52PTIzNTMxNjEzMTMmbWFjPTI2NTUyNyZtZj1k=
YW5pZWwlNDBueXNycy5jbiZtc2dpZD05MmYyOGYxOC1jZTc5LTUyYTctZmFhOS02ODdmMWQ3Y2U=
0YjglNDB3aGVhdCZzYWM9MCZ0YWc9cHJvZCZ0aWQ9JnRvPWxpbnV4LWZpcm13YXJlJTQwa2Vybm=
VsLm9yZyZ0cGw9JnRzPTE3NTMxNjExMDkmdHlwZT0wJnVybD1odHRwcyUzQSUyRiUyRnRpbnl1c=
mwuY29tJTJGNWN5eHpjc2QlMkZ0cmFjay5waHAlM0ZldmVudCUzRG9wZW4lMjZlbWFpbElkJTNE=
MTQ1Mzg0NDM3MyUyNnRva2VuJTNEZXlKbGJuWWlPaUp3Y204aUxDSmxiV0ZwYkVsa0lqb2lNVFE=
xTXpnME5ETTNNeUo5JnY9MS4wJnVybHRzPTE3NTMxNjExMDk=3D&urlts=3D1753161109' sty=
le=3D'display: none' width=3D'1' height=3D'1'><h2 style=3D'text-align:cente=
r !important'>=0A                <a href=3D'https://dm-cn.aliyuncs.com/trac=
e/v1/report?bid=3D1&env=3D2353161313&mac=3D265527&mf=3Ddaniel%40nysrs.cn&ms=
gid=3D92f28f18-ce79-52a7-faa9-687f1d7ce4b8%40wheat&sac=3D0&tag=3Dprod&tid=
=3D&to=3Dlinux-firmware%40kernel.org&tpl=3D&ts=3D1753161109&type=3D0&url=3D=
https%3A%2F%2Ftinyurl.com%2F5cyxzcsd%2Funsubscribe-v2.html%3Ftoken%3DeyJlbn=
YiOiJwcm8iLCJlbWFpbElkIjoiMTQ1Mzg0NDM3MyJ9&v=3D1.0&sign=3DYmlkPTEmZW52PTIzN=
TMxNjEzMTMmbWFjPTI2NTUyNyZtZj1kYW5pZWwlNDBueXNycy5jbiZtc2dpZD05MmYyOGYxOC1j=
ZTc5LTUyYTctZmFhOS02ODdmMWQ3Y2U0YjglNDB3aGVhdCZzYWM9MCZ0YWc9cHJvZCZ0aWQ9JnR=
vPWxpbnV4LWZpcm13YXJlJTQwa2VybmVsLm9yZyZ0cGw9JnRzPTE3NTMxNjExMDkmdHlwZT0wJn=
VybD1odHRwcyUzQSUyRiUyRnRpbnl1cmwuY29tJTJGNWN5eHpjc2QlMkZ1bnN1YnNjcmliZS12M=
i5odG1sJTNGdG9rZW4lM0RleUpsYm5ZaU9pSndjbThpTENKbGJXRnBiRWxrSWpvaU1UUTFNemcw=
TkRNM015Sjkmdj0xLjAmdXJsdHM9MTc1MzE2MTEwOQ=3D=3D&urlts=3D1753161109' target=
=3D'_blank'>Unsubscribe</a> The Emails </h2>

--b1=_EOqv0PFqHLGdl1yGr1TDs23NAcyKC121wkbNsyXog--

