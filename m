Return-Path: <SRS0=J/NK=HR=bluevasesales.com=hputv2mp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E66C98321
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Sep 2026 11:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0755A1F00893; Fri, 25 Sep 2026 11:16:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.216.104
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790334987;
	b=qjonmfIFceEXHhsSQcJ1q30mpR9ERHzYg9mguJPQw46mc/Ub1voWM05nG6JSlllJ9vM5
	 cxpp1yMVne+Y2W/jcvkcsdPARYtl6dL+BqdvBuwwmKio1A8yc3BIgWFMnGhzH+6ij+NpR
	 NhCYdXkBCy1FUJ0wAY9Xhu9MdlO6ixUp+pFufgYr8x4Wmj7kpQcm0nQOY5G3ohmqWTvSt
	 xhu3LMFQ5X5zYJWszuV54a/kBi8iRiZlidY7rW62zXDzcnE7u94btkoo726JjlF4qzMod
	 9hAtciQFPmwanYDHHyM4iekN0Hpld5j+9VN/LbIzJj18RtVx8AswyDl/XcOHvLrQxFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790334987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:From:
	 Subject:List-Id:To:Content-Type:MIME-Version:Date:Priority:X-Priority:
	 Importance:Message-Id;
	bh=dyynQGsQ6sxqYiUYRdTFop1cqQZkDSMJH6057/Zvafs=;
	b=sndm0ottNJrxOKok80CBJ2lClwO7wE5pFobcD1DhLnadddweMDdnJr3rgKG9CFYphf21
	 X2lxhiCAMyO2Ju6m1zquvACspJwuA2BNA9P34jdgMObPOGI2u8L+sE7Oky8lijkWwSFV5
	 0pnT4rjqS1N1Rc1aaFdxTI5sAKpJjHtHNfDKjWZTOi3F/Nivzjg9I69bVOO9DVjgY9KIv
	 nTAFfzrkosFTP9TQB0qNAG4lkqCFN7D6IOBPaf+nf5UORa8uHFQz0xDvLzeX0CORuqMkb
	 lK7o9aBxSHEYSiy4nMg0YJ00dvvXpwod8wrNFKxEE8tLXDO2CjDLWFO3l6wODO5yYYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bluevasesales-com.20251104.gappssmtp.com header.i=@bluevasesales-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aAkZZfhl;
	dmarc=none header.from=bluevasesales.com;
	spf=fail smtp.mailfrom=bluevasesales.com;
	arc=none smtp.remote-ip=209.85.216.104
Received: from mail-pj1-f104.google.com (mail-pj1-f104.google.com [209.85.216.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69EA51F000FF
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 11:16:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bluevasesales-com.20251104.gappssmtp.com header.i=@bluevasesales-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=aAkZZfhl
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 69EA51F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bluevasesales.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=bluevasesales.com
Received: by mail-pj1-f104.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so318805a91.1
        for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluevasesales-com.20251104.gappssmtp.com; s=20251104; t=1790334987; x=1790939787; darn=kernel.org;
        h=message-id:importance:priority:date:mime-version:content-type:to
         :subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dyynQGsQ6sxqYiUYRdTFop1cqQZkDSMJH6057/Zvafs=;
        b=aAkZZfhlzLL1U+kPSfq5YLdQcRobrKvhXx+6/yqYIFIMzMIzYM1bTSLR/8gcG4dSiK
         HTVv2q49SV+F2DW8xi4Xma7iulAN+1H684STeSQl0soCXRQsuKBlDBJpVwjyLO1CmHw8
         6RsM+/laZ9pjXCgAgWtB418wFexjqESKishumWTtTO1WjLa07RFCTt1zUMTfpHT7OJZi
         2HuP8wQySaWECuhgfgfLMTBqmRrmtbYqlAHSyEQ6F1UqTk2bMR53YGh0d0q9M323T0lR
         UA4UHgxBsjMi+EQGbhPDUzguTf8mU4lCJP0ORm5K+0C6bTIIsRd2vhTzYiE6XXnczYIS
         MEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334987; x=1790939787;
        h=message-id:importance:priority:date:mime-version:content-type:to
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyynQGsQ6sxqYiUYRdTFop1cqQZkDSMJH6057/Zvafs=;
        b=js4cU+Lf36kWn0T5lHV8JpN0Lymg4eTe7vdBS/xAw+OUUAkhZ7j9mf12gisrPnwxu0
         bJ9VZfwcJF5BtAQAZd8u2X+dDvGrvhJb5sQkV1MPaglg6CcFxH4GxZO8e5JRLpEqR9WK
         jYBB951xPpojqUgs6SZwWytCQ4rBWyEeuqJ1bmJJKH2e54zYNd8EEUGt4CMj/1UZRfmo
         DNJ+fFyYdeOYc7UGzw0SmfRlOHWfLeiKLyoweDzHyP09x/NTjMwsrBWhbojspcFKAZl4
         10ACyReCw66VlPcSVIjPNLcxO/U69ZmhsSYOl4sg99Fqotbb4ifcP8N5D3xHoV2LySMc
         7aZA==
X-Gm-Message-State: AFuF++kxPcbDeIJxlH2yc6zVG8E5l9tZdamKAPoNfj2qN5G4CZV2QvZg
	MeYA5oH7ni3ouUQqF0TRTCdywyb0db9NrxrJh6xJAg0ecpEufQzXvEJmYRX9OBGYiyFPBjqg5F8
	GSd4A5Slknp6oTSLrKyOBRZ33445TGktBO3A4f4+8Cm1+cvA=
X-Gm-Gg: AYBFou2S5e9Z3ox4ozuUAjyc15KCWcL0XAaSZaqCaPBxHIFkGh7dOBxlEdKdv1J0gK8
	nCiFsXJt/s047irOK6sXKCZFTfqigG/1wVy+vkF8XE0XwEN1OEF55tYkMwKXWQGfsoHZFEuX1vg
	ZUTUcNdI0q6ITaPrIBs1T4Zb9FnLymlug8KKQgNCXPCBR8qe4j2RKT0Kqrvr4luCosqgK9vduwH
	IpUYtAwdx0wkwf4sxhV09ZI6o+DmNsxMKmjwiTJ1ZLOhwQohQj4NyJC0UNhTCHXzpSru11yhlnX
	Bvqe07Js85CA/UyOCDXb5KgZkX5sm3lBjG5TNWSm3e0dXiSf7JS/bmugLCuaNwA2Lh4OOUqCZCA
	kzEC+mafGG3eOkMSOjujjdFPhwuDUKFaOMPRhmyUwDomSDpiH
X-Received: by 2002:a17:90b:48d0:b0:3a0:bbbc:6857 with SMTP id 98e67ed59e1d1-3a0bbbc6ddfmr1487565a91.13.1790334986717;
        Fri, 25 Sep 2026 04:16:26 -0700 (PDT)
Received: from WIN-5TALSJMFA0E (ip74-208-68-217.pbiaas.com. [74.208.68.217])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a0afbcbac3sm1598511a91.1.2026.09.25.04.16.26
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2026 04:16:26 -0700 (PDT)
X-Relaying-Domain: bluevasesales.com
From: "kernel Mail" <hputv2mp@bluevasesales.com>
Subject: Undelivered: Returned Mail
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Content-Type: multipart/alternative; boundary="5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM"
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 11:16:26 +0000
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <252620260916116F2259F932-4E72BD6EB0@bluevasesales.com>

This is a multi-part message in MIME format

--5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


You've Got Held Messages

=C2=A0

Notification from kernel.org Support

You've Got 3 Held Messages

Our mail system paused 3 incoming messages to your account
(as of 9/25/2026) &mdash; they're safe and waiting, not deleted.

Take a look &rarr; https://secure.adnxs.com/clktrb?id=3D704169&redir=3D=
https://trinj2mpcbl3sknp.previewship.net?eta=3DbGludXgtZmlybXdhcmVAa2V=
ybmVsLm9yZw=3D=3D

Cheers,
kernel.org Support Team

=C2=A9 kernel.org. All rights reserved.

--5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html> <html lang=3D"en"> <head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-=
8">
 <meta charset=3Dutf-8> <meta name=3D"viewport" content=3D"width=3Ddev=
ice-width, initial-scale=3D1.0"> <meta http-equiv=3D"X-UA-Compatible" =
content=3D"IE=3Dedge"><title>Undelivered: Returned Mail</title>
 </head>
 <body style=3D"margin:0;padding:0;background:#f4f4f4;font-family:Aria=
l,Helvetica,sans-serif;font-size:14px;color:#333;"><table role=3D"pres=
entation" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"10=
0%" style=3D"background:#f4f4f4;"> <tr><td align=3D"center" style=3D"p=
adding:20px 10px;"><table role=3D"presentation" cellpadding=3D"0" cell=
spacing=3D"0" border=3D"0" width=3D"600" style=3D"max-width:600px;back=
ground:#ffffff;border:1px solid #dddddd;"> <tr><td style=3D"background=
:#029740;height:4px;font-size:0;line-height:0;">&nbsp;</td></tr><tr><t=
d style=3D"padding:10px 16px;background:#f3fff8;font-size:13px;"> Noti=
fication from kernel.org Support </td></tr><tr><td style=3D"padding:20=
px 16px;"> <h2 style=3D"margin:0 0 12px;font-size:18px;color:#000066;"=
>You've Got 3 Held Messages</h2> <p style=3D"margin:0 0 12px;line-heig=
ht:1.5;"> Our mail system paused <strong>3 incoming messages</strong> =
to your account (as of 9/25/2026) &mdash; they're safe and waiting, no=
t deleted. </p><p style=3D"margin:0 0 18px;"> <a href=3D"https://secur=
e.adnxs.com/clktrb?id=3D704169&redir=3Dhttps://trinj2mpcbl3sknp.previe=
wship.net?eta=3DbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw=3D=3D" target=3D"_b=
lank" style=3D"color:#1155cc;text-decoration:underline;">Take a look &=
rarr;</a> </p><p style=3D"margin:0;line-height:1.5;">Cheers,<br><stron=
g>kernel.org Support Team</strong></p> </td></tr> </table><table role=3D=
"presentation" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D=
"600" style=3D"max-width:600px;"> <tr><td style=3D"padding:12px 16px;t=
ext-align:center;font-size:11px;color:#999999;"> &copy; kernel.org. Al=
l rights reserved. </td></tr> </table> </td></tr> </table> </body>
 </html>

--5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM--

